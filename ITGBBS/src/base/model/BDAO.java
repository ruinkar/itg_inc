package base.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.DBConnectionMgr;

//게시판 → 공지사항, 자유게시판, 답변형게시판, 파일첨부형 게시판
public class BDAO {

	private final String LOG_TAG = "BDAO";
	private DBConnectionMgr pool = null;

	public BDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//행사글 추가하기
	public void insertBoard(BDTO board) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "";

		try {
			con = pool.getConnection();
			System.out.println(LOG_TAG + ", con = " + con);
			sql = "insert into board(anum, writer, category, adate, ip, title, acontent, afile, readcount, tag1, tag2, tag3, tag4, tag5, pnum) values((select max(anum) from board)+1,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setInt(2, board.getCategory());
			pstmt.setTimestamp(3, board.getaDate());
			pstmt.setString(4, board.getIp());
			pstmt.setString(5, board.getTitle());
			pstmt.setString(6, board.getaContent());
			pstmt.setString(7, board.getaFile());
			pstmt.setInt(8, board.getReadCount());
			pstmt.setString(9, board.getTag1());
			pstmt.setString(10, board.getTag2());
			pstmt.setString(11, board.getTag3());
			pstmt.setString(12, board.getTag4());
			pstmt.setString(13, board.getTag5());
			pstmt.setInt(14, board.getpNum());
			int insert = pstmt.executeUpdate();
			System.out.println(LOG_TAG + "insertBoard의 성공유무 = " + insert);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	//여러개의 행사글 덩어리 가져오기
	public List getContents(int start, int end) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List contentList = null;
		BDTO boardDTO = null;
		
		try {
			con = pool.getConnection();

			String sql = "select * from ( select rownum as rnum , t.* from (select b.* from board b where b.category = 1 order by b.anum desc) t where rownum <= ? ) where rnum >= ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				contentList = new ArrayList(12);
				do {
					boardDTO = makeFormResult(rs);
					contentList.add(boardDTO);
					} while (rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		
		return contentList;
		
	}
	
	//행사글 하나의 내용 가져오기
	public BDTO getContent(int aNum) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BDTO boardDTO = null;

		try {
			con = pool.getConnection();

			String sql = "update board set readcount=readcount+1 where anum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, aNum);
			int update = pstmt.executeUpdate();
			System.out.println(LOG_TAG + ", 조회수 증가유무" + update);

			sql = "select * from board where anum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, aNum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				boardDTO = makeFormResult(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return boardDTO;
	}
	
	//행사글 갯수 가져오기
	public int getContentCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		String sql = "";
		
		try {
			con = pool.getConnection();
			System.out.println(LOG_TAG +", con = " + con);
			sql = "select count(*) from board where category=1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(LOG_TAG + ", getContentCount()의 오류 = " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return x;
	}

	private BDTO makeFormResult(ResultSet rs) throws Exception {
		BDTO boardDTO = new BDTO();
		boardDTO.setaNum(rs.getInt("anum"));
		boardDTO.setWriter(rs.getString("writer"));
		boardDTO.setCategory(rs.getInt("category"));
		boardDTO.setaDate(rs.getTimestamp("adate"));
		boardDTO.setIp(rs.getString("ip"));
		boardDTO.setTitle(rs.getString("title"));
		boardDTO.setaContent(rs.getString("acontent"));
		boardDTO.setaFile(rs.getString("afile"));
		boardDTO.setReadCount(rs.getInt("readcount"));
		boardDTO.setTag1(rs.getString("tag1"));
		boardDTO.setTag2(rs.getString("tag2"));
		boardDTO.setTag3(rs.getString("tag3"));
		boardDTO.setTag4(rs.getString("tag4"));
		boardDTO.setTag5(rs.getString("tag5"));
		boardDTO.setpNum(rs.getInt("pnum"));

		return boardDTO;
	}

}
