package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import base.model.BoardDAO;
import etc.PagingUtil;


public class ReviewDAO {
	
	final String SQL_COUNT = "select count(*) from review";
	
	// select * from (select * from review r, board b where r.anum = b.anum) order by anum desc rownum >=? and rownum <=?;
	final String SQL_PAGE = "select * from (select * from review r, board b where r.anum = b.anum)";
	final String SQL_PAGE_END = " order by anum desc rownum >=? and rownum <=?";
	
	// select rownum, a.* from (select * from (select b.*, r.evnum, r.rating from board b, review r where r.anum = b.anum order by r.anum desc) where writer like 'a%') a where rownum between 1 and 2
	final String SQL_PAGE_SEARCH = "select rownum, a.* from (select * from (select b.*, r.evnum, r.rating from board b, review r where r.anum = b.anum order by r.anum desc) where";
	final String SQL_PAGE_SEARCH_END = " like 'a%') a where rownum between 1 and 2";
	
	
	
	
	private DBConnectionMgr pool = null;

	
	public ReviewDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.printf("pool = %s%n", pool);
		} catch (Exception e) {
			System.out.printf("DBConnectionMgr error: %s%n", e);
		}
	} // constructor
	
		
	// 1) 검색어에 따른 레코드 개수 계산 후 출력하는 메서드
	// search 검색분야
	// search 검색어
	public int getArticleSearchCount(String search, String searchtext) {
		
		System.out.printf("%s, %s%n", search, searchtext);
		int count = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = SQL_COUNT;
		
		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			// 검색 여부 체크
			if (search == null || search.equals("")) {
				sql += "";
			} else { // 검색했다면
				
				if (search.equals("subject_content")) { // 제목 + 내용
					sql += " where subject like '%" + searchtext + "%' or content like '%" + searchtext + "%'";
				} else { // 제목 또는 작성자
					sql += " where " + search + " like '%" + searchtext + "%'";
				}
				
				System.out.printf("sql레코드 수 검색어 = %s%n", sql);
			}
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				// 그룹함수를 통한 계산식
				count = rs.getInt(1); // 인덱스 숫자가 키보다 더 빠르다
			}
			
		} catch (Exception e) {
			System.out.printf("getArticleSearchCount() error: %s%n", e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return count;
	}
	
	// 2. 페이지별로 n개의 레코드를 출력하는 메서드
	// 레코드의 첫 번째 순번, 화면에 출력시켜줄 레코드 수
	// 2) 검색에 대한 메서드 → 4개의 매개변수
	public List getSearchArticles(int start, int end, String search, String searchtext) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "";
		
		try {
			con = pool.getConnection();
			
			if (search == null || search.equals("")) {
				sql = SQL_PAGE;
			} else {
				sql = SQL_PAGE_SEARCH;
				if (search.equals("subject_content")) { // 제목 + 내용
					sql = "title like '" + searchtext + "' or acontent like '" + searchtext + "'";
				} else { // 제목 or 작성자
					sql = " where " + search + " like '" + searchtext +"'";
				}
				
			}
			sql += SQL_PAGE_END;
			
			pstmt = con.prepareStatement(sql);
			// mysql에서는 start를 0부터 계산
			pstmt.setInt(1, start - 1);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				list = new ArrayList(end); // new ArrayList(10);
				do {
					BoardDTO article = makeArticleFromResult(rs);
					
					list.add(article);
				} while (rs.next());
			}
			
		} catch (Exception e) {
			System.out.println("getSearchArticles() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return list;
	}
	
	// 3. 페이징 처리해주는 메서드 → ListAction의 소스 복잡 → 단순화하는 메서드
	// 1) 화면에 출력할 페이지번호, 2) 화면에 출력할 레코드 수
	public HashMap pageList(String pageNum, int count, String search, String searchtext) {
		// 최종 페이징처리한 계산 결과값을 저장할 변수 선언
		HashMap<String, String> map = new HashMap<String, String>();
		PagingUtil page = null;

		int pageSize = 10; // numPerPage → 페이지 당 보여주는 레코드 수
		int blockSize = 10; // pagePerBlock → 블럭 당 보여주는 페이지 수

		// 현재 페이지 설정
		if (pageNum == null) {
			pageNum = "1"; // default → "1" → 1
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 = nowPage

		// 총 레코드 수 구하기
		count = getArticleSearchCount(search, searchtext);
		System.out.printf("현재 레코드 수: %d%n", count);
		
		page = new PagingUtil(currentPage, count, pageSize, blockSize, "list.do");

		String start = String.valueOf(page.getStartCount() );
		String end = String.valueOf(page.getEndCount() );
		String pagingHtml = page.getPagingHtml().toString();
		
		map.put("start", start);

		return map;
	}
	
	
	// 게시물 쓰기 및 답변 달기 통합
	public void insertArticle(BoardDTO article) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select → 현재 테이블의 num의 최대값 구하기
		// list.jsp or content.jsp를 통해 값을 전달
		
		int num = article.getNum();
		int ref =  article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		
		System.out.printf("insertArticle num: %s%n", num);
		System.out.printf("ref = %s, re_step = %s%n", ref, re_step);
		System.out.printf("re_level = %s%n", re_level);
		int number = 0; // 게시물 번호
		String sql = ""; 
		
		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		
			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1; // 게시물이 없는 경우
			}
			pstmt.close();
			
			// 신규 or 답변
			if(num != 0) { // 답변
				// 답변글이 달릴 위치부터 순서 밀기(re_step)
				sql = "update board set re_step=re_step+1 where ref=? and re_step>?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref); 
				pstmt.setInt(2, re_step);
				int result_update = pstmt.executeUpdate();
				System.out.println("update re_step: " + result_update);
				
				re_step++;	// 해당 글의 답변이므로 대상 글의 다음 위치를 점유
				re_level++; // 답변이므로 들여쓰기 증가
			} else { // 신규
				ref = number; // 1,2,3,4,5
				re_step = 0;
				re_level = 0;
			}
			//insert 구문
			sql = "insert into board(writer, email, subject, passwd, reg_date,";
			sql += "ref, re_step, re_level, content, ip) values(?,?,?,?,?,?,?,?,?,?)";
			
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			// values(?,?,?,?,now(),?,?,?,?,?)
			// 사용시 index 6번째 칼럼을 메서드 인덱스 5로 접근
			pstmt.setTimestamp(5, article.getReg_date());
			// 신규나 답변에 맞춰 계산한 변수를 대입 ref, re_step, re_level
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			
			int result = pstmt.executeUpdate();
			System.out.printf("insert result = ", result);
			
		} catch (Exception e) {
			System.out.printf("insertArticle() error: %s%n", e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	
	// 글 상세보기 조회수 증가
	// select * from board where num=?
	public BoardDTO getArticle(int num) {

		BoardDTO article = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "update board set readcount = readcount+1 where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result = pstmt.executeUpdate();
			System.out.println("조회수 증가 유무(update)" + result);

			pstmt.close();
			sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = makeArticleFromResult(rs);
				/*
				article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setEmail(rs.getString("email"));
				article.setContent(rs.getString("content"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setIp(rs.getString("ip"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));*/
			}

		} catch (Exception e) {
			System.out.println("getArticle() error:" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return article;
	}
	
	// 글 수정시 내용 보여주기
	// select * from board where num=?
	public BoardDTO updateGetArticle(int num) {

		BoardDTO article = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = makeArticleFromResult(rs);
				/*
				article = new BoardDTO();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setEmail(rs.getString("email"));
				article.setContent(rs.getString("content"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setIp(rs.getString("ip"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));*/
			}

		} catch (Exception e) {
			System.out.println("getArticle() error:" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		// 중복 부분을 따로 메서드로 작성
		// 

		return article;
	}
	
	// 글 수정
	public boolean updateArticle(BoardDTO article) {
		
		boolean check = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select → 현재 테이블의 num의 최대값 구하기
		// list.jsp or content.jsp를 통해 값을 전달
		
		int num = article.getNum();
		String passwd = article.getPasswd();
		System.out.println("passwd " + passwd);
		
		System.out.printf("updateArticle num: %s%n", num);
		String sql = ""; 
		
		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			con.setAutoCommit(false);
						
			//update 구문
			sql = "update board set writer=?, email=?, subject=?, reg_date=now(), content=?, ip=? where num=? and passwd=?";
			// sql = "update board set writer=?, email=?, subject=?, reg_date=now(), content=?, ip=? where num=?";
						
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getContent());
			pstmt.setString(5, article.getIp());
			pstmt.setInt(6, article.getNum());
			pstmt.setString(7, article.getPasswd());
			
			int result = pstmt.executeUpdate();
			System.out.printf("update result = %d%n", result);
			
			check = result == 1;
			
			if (check) con.commit();
			else con.rollback();
			
			con.setAutoCommit(true);
			
		} catch (Exception e) {
			System.out.println("updateArticle() error:" + e);
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException e2) {	
					System.out.println("rollback error: " + e2);
				}
			}
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return check;
	}
	
	// 글 삭제
	public boolean deleteArticle(int num, String passwd) {

		boolean check = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		System.out.printf("deleteArticle num: %s%n", num);
		String sql = "";
		
		try {
			
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			con.setAutoCommit(false);
			// delete query
			sql = "delete from board where num=? and passwd=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, passwd);

			int result = pstmt.executeUpdate();
			System.out.printf("delete result = ", result);

			check = result == 1;

			if (check) con.commit();
			else con.rollback();

			con.setAutoCommit(true);

		} catch (Exception e) {
			System.out.println("deleteArticle() error:" + e);
			if (con != null) {
				try {
					con.rollback();
				} catch (SQLException e2) {
					System.out.println("rollback error: " + e2);
				}
			}
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return check;
	}
	
	/*// 비밀번호 체크
	public boolean checkPasswd(int num, String passwd) {
		
		boolean check = false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		String true_passwd = "";
		
		try {
			con = pool.getConnection();
			sql = "select passwd from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				true_passwd = rs.getString(1);
			}
			
			check = true_passwd.equals(passwd);
			
		} catch (Exception e) {
			System.out.println("checkPasswd error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		
		return check;
	}*/
	
	private BoardDTO makeArticleFromResult(ResultSet rs) throws Exception{
		
		BoardDTO article = new BoardDTO();
		
		article.setNum(rs.getInt("num"));
		article.setWriter(rs.getString("writer"));
		article.setSubject(rs.getString("subject"));
		article.setEmail(rs.getString("email"));
		article.setContent(rs.getString("content"));
		article.setPasswd(rs.getString("passwd"));
		article.setReg_date(rs.getTimestamp("reg_date"));
		article.setReadcount(rs.getInt("readcount"));
		article.setIp(rs.getString("ip"));
		article.setRef(rs.getInt("ref"));
		article.setRe_step(rs.getInt("re_step"));
		article.setRe_level(rs.getInt("re_level"));
		
		return article;
	}
	
	
}