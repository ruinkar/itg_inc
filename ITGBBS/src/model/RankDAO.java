package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import etc.KeyArchive;

public class RankDAO implements KeyArchive {
	final int top = 10;
	final int TYPE_MPOINT = 0;
	final int TYPE_RATING = 1;
	
	final String SQL_LIST_RANK_MPOINT_COUNT
		= "select count(*) from member";
	
	final String SQL_LIST_RANK_MPOINT_TOP
		= "select nick, thumbnail, mpoint from ( select nick, thumbnail, mpoint from member m order by mpoint desc ) where rownum <= ?";
	final String SQL_LIST_RANK_MPOINT_PAGE 
		= "select nick, thumbnail, mpoint from ( select m.*, rownum rnum from ( select nick, thumbnail, mpoint from member order by mpoint desc ) m where rownum <=? ) where rnum >=?";

	// select nick, avgrat, rnum from (	select nick, avgrat, rownum rnum from member, ( select writer, avg(rating) avgrat from board b, review r where r.evnum = b.anum group by writer) where writer = id order by avgrat ) where rnum <= 10 and rnum >= 1;
	final String SQL_LIST_RANK_RATING_TOP
		= "select nick, thumbnail, avgrat from ( select nick, thumbnail, avgrat, rownum rnum from member, ( select writer, avg(rating) avgrat from board b, review r where r.evnum = b.anum group by writer) where writer = id order by avgrat ) where rnum <= ?";
	final String SQL_LIST_RANK_RATING_PAGE
		= "select * from (select * from ( select nick, thumbnail, avgrat, rownum rnum from member, ( select writer, avg(rating) avgrat from board b, review r where r.evnum = b.anum group by writer ) where writer = id order by avgrat ) where rnum <= ? ) where rnum >= ?";

	DBConnectionMgr pool = null;

	public RankDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.printf("pool = %s%n", pool);
		} catch (Exception e) {
			System.out.printf("DBConnectionMgr error: %s%n", e);
		}
	} // constructor

	// 전체 멤버 수 확인 → 랭킹 페이지 산출
	public int getMemberCount() {
		int count = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			pstmt = con.prepareStatement(SQL_LIST_RANK_MPOINT_COUNT);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1); // 인덱스 숫자가 키보다 더 빠르다
			}

		} catch (Exception e) {
			System.out.printf("getMemberCount() error: %s%n", e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return count;
	}
	

	// 랭킹 페이지 상단 표시용 상위 랭크
	public List<String> getRankTop(int type) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		// System.out.println(type);

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(type == TYPE_MPOINT ? 
					SQL_LIST_RANK_MPOINT_TOP : SQL_LIST_RANK_RATING_TOP );
			pstmt.setInt(1, top);
			rs = pstmt.executeQuery();
			

			if (rs.next()) {
				list = new ArrayList(10); // new ArrayList(10);
				do {
					String data = setJsonData(rs);
					list.add(data);
				} while (rs.next());
			}
			
			if (list.isEmpty()) {
				list = Collections.emptyList();
			}
			
		} catch (Exception e) {
			System.out.println("getRankTop() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}

	// 랭킹 페이지 하단 표시용 하위 랭크(현재 페이지에 따른 목록)
	public List<String> getRankPage(int type, int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(type == TYPE_MPOINT ?
					SQL_LIST_RANK_MPOINT_PAGE : SQL_LIST_RANK_RATING_PAGE );
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();
			
			list = new ArrayList(10); // new ArrayList(10);
			
			if (rs.next()) {
				do {
					String data = setJsonData(rs);
					list.add(data);
				} while (rs.next());
			}
			
			if (list.isEmpty()) {
				list = Collections.emptyList();
			}
		} catch (Exception e) {
			System.out.println("getRankPage() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		System.out.println(list);
		
		return list;
	}
	
	// ResultSet to Json String
	private String setJsonData(ResultSet rs) throws Exception {
		ResultSetMetaData meta = rs.getMetaData();
		int count = meta.getColumnCount();
		
		StringBuffer out = new StringBuffer("{");
		for (int i = 1; i <= count; i++) {
			out.append("\"" + meta.getColumnLabel(i).toLowerCase() + "\":\"" + rs.getString(i) + "\"" + (i < count ? ",":""));
		}
		out.append("}");
		
		return out.toString();
	}
	
	// setJsonData로 만든 List를 Json 배열형태로 최종 포장
	public String listJSON(List<String> list){
		int size = list.isEmpty() ?
				0 : list.size();
		
		StringBuffer json = new StringBuffer("[");
		for(int i = 0; i < size; i++){
			String data = list.get(i);
			json.append(data + (i < size - 1 ? "," : "") );
		}
		json.append("]");
		
		// System.out.println(json);
		return json.toString();
	}
	
	/*
	// DB결과를 MemberDTO로 저장
	private MemberDTO setMemberDTO(ResultSet rs) throws Exception {

		MemberDTO member = new MemberDTO();
		// id name nick email thumbnail mpoint fkey gkey

		// member table keys
		final int KEY_ID = 1;
		final int KEY_NAME = 2;
		final int KEY_NICK = 3;
		final int KEY_EMAIL = 4;
		final int KEY_THUMBNAIL = 5;
		final int KEY_MPOINT = 6;
		final int KEY_FKEY = 7;
		final int KEY_GKEY = 8;
		
		// member.setId(rs.getString(KEY_ID));
		// member.setName(rs.getString(KEY_NAME));
		member.setNick(rs.getString(KEY_NICK));
		// member.setEmail(rs.getString(KEY_EMAIL));
		member.setThumbnail(rs.getString(KEY_THUMBNAIL));
		member.setMpoint(rs.getInt(KEY_MPOINT));
		// member.setFkey(rs.getString(KEY_FKEY));
		// member.setGkey(rs.getString(KEY_GKEY));

		return member;
	}
	
	// MemberDTO List를 Json 배열로 포장
	public String listJSON(List<MemberDTO> list){
		int size = list.isEmpty() ?
				0 : list.size();
		
		
		String json = "[";
		for(int i = 0; i < size; i++){
			MemberDTO member = list.get(i);
			json += member.toItemJSON() + (i >= size - 1 ? "" : ",");
		}
		json +="]";
		
		// System.out.println(json);
		
		return json;
	}*/
}
