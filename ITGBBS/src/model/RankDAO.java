package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import base.model.BoardDTO;

public class RankDAO {
	final String SQL_RANK_VIEW_HIGH
		= "select * from (select * from member order by mpoint desc) where rownum <= 10";
	final String SQL_RANK_VIEW_OTHERS 
		= "select * from (select * from member order by mpoint desc) where rownum between ? and ?";

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
		String sql = "";

		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			sql = "select count(*) from member";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1); // 인덱스 숫자가 키보다 더 빠르다
			}

		} catch (Exception e) {
			System.out.printf("getArticleCount() error: %s%n", e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return count;
	}
	

	// 랭킹 페이지 상단 표시용 상위 랭크
	public List<MemberDTO> getHighRank() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(SQL_RANK_VIEW_HIGH);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList(10); // new ArrayList(10);
				do {
					MemberDTO member = setMemberDTO(rs);
					list.add(member);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("getArticles() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}

	// 랭킹 페이지 하단 표시용 하위 랭크(현재 페이지에 따른 목록)
	public List getOthersRank(String start, String end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;

		try {
			con = pool.getConnection();
			pstmt = con.prepareStatement(SQL_RANK_VIEW_OTHERS);
			pstmt.setString(1, start);
			pstmt.setString(2, end);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList(10); // new ArrayList(10);
				do {
					MemberDTO member = setMemberDTO(rs);
					list.add(member);
				} while (rs.next());
			}
		} catch (Exception e) {
			System.out.println("getArticles() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}
	
	
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
		
		member.setId(rs.getString(KEY_ID));
		member.setName(rs.getString(KEY_NAME));
		member.setNick(rs.getString(KEY_NICK));
		member.setEmail(rs.getString(KEY_EMAIL));
		member.setThumbnail(rs.getString(KEY_THUMBNAIL));
		member.setMpoint(rs.getInt(KEY_MPOINT));
		member.setFkey(rs.getString(KEY_FKEY));
		member.setGkey(rs.getString(KEY_GKEY));

		return member;
	}
}
