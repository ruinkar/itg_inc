package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import etc.KeyArchive;

public class ReviewDAO implements KeyArchive {

	private DBConnectionMgr pool = null;

	public ReviewDAO() {
		try {
			pool = DBConnectionMgr.getInstance();
			System.out.printf("pool = %s%n", pool);
		} catch (Exception e) {
			System.out.printf("DBConnectionMgr error: %s%n", e);
		}
	} // constructor

	// 페이징 처리 기법 → 레코드를 정해 둔 페이지 별로 출력하는 기법
	// 1. 총 레코드 수를 구해주는 메서드
	public int getArticleCount() {
		int count = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			sql = "select count(*) from board where category = 2";
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

	// 1-1) 검색어에 따른 레코드 개수 계산 후 출력하는 메서드
	// search 검색분야
	// search 검색어
	public int getArticleSearchCount(String search, String searchtext) {

		System.out.printf("%s, %s%n", search, searchtext);
		int count = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			// 검색 여부 체크
			if (search == null || search.equals("")) {

				sql = "select count(*) from board where category=2";

			} else { // 검색했다면

				if (search.equals("subject_content")) { // 제목 + 내용
					sql = "select count(*) from board where category=2 and (title like '" + searchtext
							+ "' or acontent like '" + searchtext + " ' )";
				} else { // 제목 또는 작성자
					sql = "select count(*) from board where category=2 and " + search + " like '" + searchtext + "'";
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
	public List getArticles(int start, int end) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "select * from board where category = 2 order by anum desc";
			pstmt = con.prepareStatement(sql);
			// mysql에서는 start를 0부터 계산
			/*
			 * pstmt.setInt(1, start); pstmt.setInt(2, end);
			 */
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList(end); // new ArrayList(10);
				do {
					BoardDTO article = makeArticleFromResult(rs);
					list.add(article);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("getArticles() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}

	public void insertArticle(BoardDTO article, ReviewDTO review) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select → 현재 테이블의 num의 최대값 구하기
		// list.jsp or content.jsp를 통해 값을 전달
		String sql = "";
		int anum;
		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			sql = "select max(anum) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				anum = rs.getInt(1) + 1;
			} else {
				anum = 1; // 게시물이 없는 경우
			}
			pstmt.close();
			sql = "INSERT INTO BOARD (ANUM, WRITER, CATEGORY, ADATE, IP, TITLE, ACONTENT, AFILE, READCOUNT, TAG1, TAG2, TAG3, TAG4, TAG5, PNUM ) ";
			sql += "                 VALUES  ( ?, ?,? , sysdate, ?, ?, ?, ?,? ,?, ?, ?, ?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setObject(1, anum);
			pstmt.setObject(2, article.getWriter());
			pstmt.setObject(3, article.getCategory());
			pstmt.setObject(4, article.getIp());
			pstmt.setObject(5, article.getTitle());
			pstmt.setObject(6, article.getAcontent());
			pstmt.setObject(7, article.getAfile());
			pstmt.setObject(8, article.getReadcount());
			pstmt.setObject(9, article.getTag1());
			pstmt.setObject(10, article.getTag2());
			pstmt.setObject(11, article.getTag3());
			pstmt.setObject(12, article.getTag4());
			pstmt.setObject(13, article.getTag5());
			pstmt.setObject(14, article.getPnum());

			int result = pstmt.executeUpdate();
			System.out.printf("board insert result = ", result);
			pstmt.close();
			sql = "INSERT INTO REVIEW (ANUM, EVNUM, RATING ) VALUES  (?,?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setObject(1, anum);
			pstmt.setObject(2, review.getEvnum());
			pstmt.setObject(3, review.getRating());

			result = pstmt.executeUpdate();
			System.out.printf("review insert result = ", result);

		} catch (Exception e) {
			System.out.printf("insertArticle() error: %s%n", e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// 글 상세보기 조회수 증가
	// select * from board where num=?
	public ReviewAllDTO getArticle(int anum) {

		ReviewAllDTO article = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "update board set readcount = readcount+1 where anum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			int result = pstmt.executeUpdate();
			System.out.println("조회수 증가 유무(update)" + result);

			pstmt.close();
			sql = "select * from"; 
			sql += "( select rownum as listnum , b.* , re.rating as rating , re.evnum  from board b , review re where  b.anum = re.anum )";
			sql += "where anum = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, anum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				article = makeReviewAllFromResult(rs);
			}
			pstmt.close();
			System.out.println("행사 불러오기 유무(update)" + result);
			System.out.println("행사 번호" + article.getEvnum());
			if ( article.getEvnum() == 0 )
			{
				article.setEvtitle("삭제된 행사 입니다. ");
			}
			else
			{
				pstmt.close();
				sql ="select * from" ;
				sql +="(select b.title as etitle , re.anum from board b , review re where b.anum = re.evnum)";
				sql +="where anum = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, anum);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					article.setEvtitle(rs.getString("etitle"));
				}
				
			}
			
		} catch (Exception e) {
			System.out.println("getArticle() error:" + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return article;
	}

	// 글 수정
	public boolean updateArticle(BoardDTO article, ReviewDTO review) {

		boolean check = false;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select → 현재 테이블의 num의 최대값 구하기
		// list.jsp or content.jsp를 통해 값을 전달

		int anum = article.getAnum();
		System.out.printf("updateArticle num: %s%n", anum);
		String sql = "";

		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			con.setAutoCommit(false);

			// update 구문
			sql = "UPDATE BOARD SET TITLE = ?, ACONTENT = ?, AFILE = ?, TAG1 = ?, TAG2 = ?, TAG3 = ?, TAG4 = ?, TAG5 = ? WHERE (ANUM = ?)";
			// sql = "update board set writer=?, email=?, subject=?,
			// reg_date=now(), content=?, ip=? where num=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setObject(1, article.getTitle());
			pstmt.setObject(2, article.getAcontent());
			pstmt.setObject(3, article.getAfile());
			pstmt.setObject(4, article.getTag1());
			pstmt.setObject(5, article.getTag2());
			pstmt.setObject(6, article.getTag3());
			pstmt.setObject(7, article.getTag4());
			pstmt.setObject(8, article.getTag5());
			pstmt.setObject(9, article.getAnum());
			int result = pstmt.executeUpdate();
			System.out.printf("update board result = %d%n", result);
			pstmt.close();
			sql = "UPDATE REVIEW SET EVNUM = ?, RATING = ? WHERE (ANUM = ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setObject(1, review.getEvnum());
			pstmt.setObject(2, review.getRating());
			pstmt.setObject(3, article.getAnum());
			result = pstmt.executeUpdate();
			System.out.printf("update REVIEW result = %d%n", result);
			check = true;
			if (check)
				con.commit();
			else
				con.rollback();

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
	public boolean deleteArticle(int num) {

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
			sql = "delete from board where anum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			int result = pstmt.executeUpdate();
			System.out.printf("delete board result = ", result);
			pstmt.close();
			sql = "delete from review where anum=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			result = pstmt.executeUpdate();
			System.out.printf("delete review result = ", result);
			con.commit();
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

	

	public void insertReply(BoardDTO article) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; // select → 현재 테이블의 num의 최대값 구하기
		// list.jsp or content.jsp를 통해 값을 전달

		int pnum = article.getPnum();

		System.out.printf("insertArticle pnum: %s%n", pnum);

		int number = 0; // 게시물 번호
		String sql = "";

		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			sql = "select max(anum) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				number = rs.getInt(1) + 1;
			} else {
				number = 1; // 게시물이 없는 경우
			}
			pstmt.close();

			// insert 구문
			sql = "insert into board(anum, writer, category, adate, ip,";
			sql += "title, acontent, afile, tag1, tag2, tag3, tag4, tag5, pnum) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.setString(2, article.getWriter());
			pstmt.setInt(3, article.getCategory());
			pstmt.setTimestamp(4, article.getAdate());
			pstmt.setString(5, article.getIp()); // article.setIp(request.getRemoteAddr());
			pstmt.setString(6, article.getTitle());
			pstmt.setString(7, article.getAcontent());
			pstmt.setString(8, article.getAfile());
			pstmt.setString(9, article.getTag1());
			pstmt.setString(10, article.getTag2());
			pstmt.setString(11, article.getTag3());
			pstmt.setString(12, article.getTag4());
			pstmt.setString(13, article.getTag5());
			pstmt.setInt(14, pnum);

			int result = pstmt.executeUpdate();
			System.out.printf("insert result = ", result);

		} catch (Exception e) {
			System.out.printf("insertArticle() error: %s%n", e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	public int getReplyCount(int pnum) {
		int count = 0;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = pool.getConnection();
			System.out.printf("con = %s%n", con);
			sql = "select count(*) from board where pnum=" + pnum;
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

	// 2. 페이지별로 n개의 댓글 레코드를 출력하는 메서드
	// 레코드의 첫 번째 순번, 화면에 출력시켜줄 레코드 수
	public List getReplies(int anum) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "";

		try {
			con = pool.getConnection();
			sql = "select * from board where pnum=? order by anum asc";
			pstmt = con.prepareStatement(sql);
			// System.out.println("sql = " +sql);

			// mysql에서는 start를 0부터 계산
			pstmt.setInt(1, anum);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList(); // new ArrayList(10);

				do {
					BoardDTO article = new BoardDTO();

					article.setAnum(rs.getInt("anum"));
					article.setWriter(rs.getString("writer"));
					article.setCategory(rs.getInt("category"));
					article.setAdate(rs.getTimestamp("adate"));
					article.setIp(rs.getString("ip"));
					article.setTitle(rs.getString("title"));
					article.setAcontent(rs.getString("acontent"));
					article.setAfile(rs.getString("afile"));
					article.setReadcount(rs.getInt("readcount"));
					article.setTag1(rs.getString("tag1"));
					article.setTag2(rs.getString("tag2"));
					article.setTag3(rs.getString("tag3"));
					article.setTag4(rs.getString("tag4"));
					article.setTag5(rs.getString("tag5"));
					article.setPnum(rs.getInt("pnum"));

					list.add(article);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("getReplies() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return list;
	}

	
	public Hashtable <String, Integer> pageList(String pageNum, int count) {
		  // 최종 페이징처리한 계산 결과값을 저장할 변수 선언 
		Hashtable<String, Integer> pgList = new Hashtable<String, Integer>();
		  
		  int pageSize = 2; // numPerPage → 페이지 당 보여주는 레코드 수 
		  int blockSize = 1;//pagePerBlock → 블럭 당 보여주는 페이지 수
		  
		  // 현재 페이지 설정 
		  if (pageNum == null) { 
			  pageNum = "1"; // default → "1" → 1 
		  }
		  int currentPage = Integer.parseInt(pageNum); // 현재 페이지 = nowPage
		  
		  // 총 레코드 수 구하기 
		  ReviewDAO bdPro = new ReviewDAO(); 
		  count = bdPro.getArticleCount(); 
		  
		  System.out.printf("현재 레코드 수: %d%n", count);
		  
		  int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		  if (currentPage > pageCount) 
		  { currentPage = pageCount; }
		  System.out.printf("현재 pageCount 수: %d%n", pageCount);
		  System.out.printf("현재 currentPage : %d%n", currentPage);
		  // 시작 레코드 번호 ex (1- 1) * 10 + 1 = 1, (2 - 1) * 10 + 1 = 11 
		  int startRow = (currentPage - 1) * pageSize + 1; 
		  int endRow = currentPage * pageSize; // 1
		  
		  int number = 0; // 페이지별 시작하는 게시물 번호 
		  
		  number = count - (currentPage - 1) * pageSize; // ex) 122 - (1 - 1) * 10
		  System.out.printf("number: %s%n", number);
		  
		  int startPage = (currentPage - 1) / blockSize * blockSize + 1; 
		  int endPage = startPage + blockSize - 1;
		  
		  if (endPage > pageCount) endPage = pageCount;
		  
		  pgList.put("pageSize", pageSize); 
		  pgList.put("blockSize", blockSize);
		  pgList.put("currentPage", currentPage); 
		  pgList.put("pageCount",pageCount); 
		  pgList.put("startRow", startRow); 
		  pgList.put("endRow",endRow); 
		  pgList.put("number", number); 
		  pgList.put("startPage", startPage); 
		  pgList.put("endPage", endPage); 
		  pgList.put("count", count);
		  
		  return pgList; }
	
	// 2-1) 검색에 대한 메서드 → 4개의 매개변수
	public List getSearchArticles(int start, int end, String search, String searchtext) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = null;
		String sql = "";

		try {
			con = pool.getConnection();
			/*sql = "select * from ";
			sql+="( select rownum as rnum , b.* from board b  where b.category = 2 order by b.anum desc ) ";
			sql+="where rnum between ? and ? ";*/
			sql ="select * from";
			sql +="(select rownum as rnum , c.*  from ( select * from board  where category = 2 order by anum desc ) c  where rownum <= ?)";
			sql +="where rnum >= ?";
			if (search == null || search.equals("")) {
				

			/*} else {

				if (search.equals("subject_content")) { // 제목 + 내용
					sql = "select count(*) from board where category=2 and (title like '" + searchtext
							+ "' or acontent like '" + searchtext + " ' )";
				} else { // 제목또는 작성자
					sql = "select count(*) from board where category=2 and " + search + " like '" + searchtext + "'";
				}

				if (search.equals("subject_content")) { // 제목 + 내용
					sql = "select * from board where  category=2 and ( subject like '" + searchtext
							+ "' or content like '" + searchtext + "') order by  anum desc limit ?,?";
				} else { // 제목 or 작성자
					sql = "select * from board where  category=2 and  " + search + " like '" + searchtext
							+ "' order by anum desc limit ?,?";
				}*/

			}
			pstmt = con.prepareStatement(sql); // mysql에서는 start를 0부터 계산
			pstmt.setInt(1, end);
			pstmt.setInt(2, start);
			
			
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

	public Vector<BoardDTO> evRead(String title) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<BoardDTO> evList = new Vector<>();
		String sql = "";

		try {
			con = pool.getConnection();
			/*sql ="select * from";
			sql +="(select rownum as rnum , c.*  from ( select * from board  where category = 1 and title like '%" + title + "%' order by anum desc ) c  where rownum <= ?)";
			sql +="where rnum >= ?";
			*/
			sql = "select * from board where category=1 and title like '%" + title + "%'";
			pstmt = con.prepareStatement(sql);
			//pstmt.setInt(1, end);
			//pstmt.setInt(2, start);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				do {
					BoardDTO article = makeArticleFromResult(rs);
					evList.add(article);
				} while (rs.next());
			}

		} catch (Exception e) {
			System.out.println("getArticles() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return evList;
	}
	
	
	public int eventCount(String title) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<BoardDTO> evList = new Vector<>();
		String sql = "";
		int count = 0;
		try {
			con = pool.getConnection();
			sql = "select count(*) from board where category=1 and title like '%" + title + "%'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			System.out.println("getArticles() error: " + e);
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return count;
	}
	
	public Hashtable <String, Integer> eventpageList(String pageNum, int count , String title) {
		  // 최종 페이징처리한 계산 결과값을 저장할 변수 선언 
		Hashtable<String, Integer> pgList = new Hashtable<String, Integer>();
		  
		  int pageSize = 2; // numPerPage → 페이지 당 보여주는 레코드 수 
		  int blockSize = 1;//pagePerBlock → 블럭 당 보여주는 페이지 수
		  
		  // 현재 페이지 설정 
		  if (pageNum == null) { 
			  pageNum = "1"; // default → "1" → 1 
		  }
		  int currentPage = Integer.parseInt(pageNum); // 현재 페이지 = nowPage
		  
		  // 총 레코드 수 구하기 
		  ReviewDAO bdPro = new ReviewDAO(); 
		  count = bdPro.eventCount(title); 
		  
		  System.out.printf("현재 레코드 수: %d%n", count);
		  
		  int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		  if (currentPage > pageCount) 
		  { currentPage = pageCount; }
		  System.out.printf("현재 pageCount 수: %d%n", pageCount);
		  System.out.printf("현재 currentPage : %d%n", currentPage);
		  // 시작 레코드 번호 ex (1- 1) * 10 + 1 = 1, (2 - 1) * 10 + 1 = 11 
		  int startRow = (currentPage - 1) * pageSize + 1; 
		  int endRow = currentPage * pageSize; // 1
		  
		  int number = 0; // 페이지별 시작하는 게시물 번호 
		  
		  number = count - (currentPage - 1) * pageSize; // ex) 122 - (1 - 1) * 10
		  System.out.printf("number: %s%n", number);
		  
		  int startPage = (currentPage - 1) / blockSize * blockSize + 1; 
		  int endPage = startPage + blockSize - 1;
		  
		  if (endPage > pageCount) endPage = pageCount;
		  
		  pgList.put("pageSize", pageSize); 
		  pgList.put("blockSize", blockSize);
		  pgList.put("currentPage", currentPage); 
		  pgList.put("pageCount",pageCount); 
		  pgList.put("startRow", startRow); 
		  pgList.put("endRow",endRow); 
		  pgList.put("number", number); 
		  pgList.put("startPage", startPage); 
		  pgList.put("endPage", endPage); 
		  pgList.put("count", count);
		  
		  return pgList; }
	
	 /*
	 * // 3. 페이징 처리해주는 메서드 → ListAction의 소스 복잡 → 단순화하는 메서드 // 1) 화면에 출력할 페이지번호,
	 * 2) 화면에 출력할 레코드 수 public Hashtable pageList(String pageNum, int count) {
	 * // 최종 페이징처리한 계산 결과값을 저장할 변수 선언 Hashtable<String, Integer> pgList = new
	 * Hashtable<String, Integer>();
	 * 
	 * int pageSize = 10; // numPerPage → 페이지 당 보여주는 레코드 수 int blockSize = 10;
	 * // pagePerBlock → 블럭 당 보여주는 페이지 수
	 * 
	 * // 현재 페이지 설정 if (pageNum == null) { pageNum = "1"; // default → "1" → 1 }
	 * int currentPage = Integer.parseInt(pageNum); // 현재 페이지 = nowPage
	 * 
	 * // 총 레코드 수 구하기 ReviewDAO bdPro = new ReviewDAO(); count =
	 * bdPro.getArticleCount(); System.out.printf("현재 레코드 수: %d%n", count);
	 * 
	 * int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); if
	 * (currentPage > pageCount) { currentPage = pageCount; } // 시작 레코드 번호 ex (1
	 * - 1) * 10 + 1 = 1, (2 - 1) * 10 + 1 = 11 int startRow = (currentPage - 1)
	 * * pageSize + 1; int endRow = currentPage * pageSize; // 1
	 * 
	 * int number = 0; // 페이지별 시작하는 게시물 번호 List articleList = null; // 10개의
	 * 레코드들을 담을 변수(그릇)
	 * 
	 * number = count - (currentPage - 1) * pageSize; // ex) 122 - (1 - 1) * 10
	 * System.out.printf("number: %s%n", number);
	 * 
	 * int startPage = (currentPage - 1) / blockSize * blockSize + 1; int
	 * endPage = startPage + blockSize - 1;
	 * 
	 * if (endPage > pageCount) endPage = pageCount;
	 * 
	 * pgList.put("pageSize", pageSize); pgList.put("blockSize", blockSize);
	 * pgList.put("currentPage", currentPage); pgList.put("pageCount",
	 * pageCount); pgList.put("startRow", startRow); pgList.put("endRow",
	 * endRow); pgList.put("number", number); pgList.put("startPage",
	 * startPage); pgList.put("endPage", endPage); pgList.put("count", count);
	 * 
	 * return pgList; }
	 * 
	 * 
	 * // 게시물 쓰기 및 답변 달기 통합 public void insertArticle(BoardDTO article) {
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null; // select → 현재 테이블의 num의 최대값 구하기 // list.jsp or content.jsp를 통해 값을
	 * 전달
	 * 
	 * int num = article.getNum(); int ref = article.getRef(); int re_step =
	 * article.getRe_step(); int re_level = article.getRe_level();
	 * 
	 * System.out.printf("insertArticle num: %s%n", num); System.out.printf(
	 * "ref = %s, re_step = %s%n", ref, re_step); System.out.printf(
	 * "re_level = %s%n", re_level); int number = 0; // 게시물 번호 String sql = "";
	 * 
	 * try { con = pool.getConnection(); System.out.printf("con = %s%n", con);
	 * sql = "select max(num) from board"; pstmt = con.prepareStatement(sql); rs
	 * = pstmt.executeQuery();
	 * 
	 * if (rs.next()) { number = rs.getInt(1) + 1; } else { number = 1; // 게시물이
	 * 없는 경우 } pstmt.close();
	 * 
	 * // 신규 or 답변 if(num != 0) { // 답변 // 답변글이 달릴 위치부터 순서 밀기(re_step) sql =
	 * "update board set re_step=re_step+1 where ref=? and re_step>?"; pstmt =
	 * con.prepareStatement(sql); pstmt.setInt(1, ref); pstmt.setInt(2,
	 * re_step); int result_update = pstmt.executeUpdate(); System.out.println(
	 * "update re_step: " + result_update);
	 * 
	 * re_step++; // 해당 글의 답변이므로 대상 글의 다음 위치를 점유 re_level++; // 답변이므로 들여쓰기 증가 }
	 * else { // 신규 ref = number; // 1,2,3,4,5 re_step = 0; re_level = 0; }
	 * //insert 구문 sql =
	 * "insert into board(writer, email, subject, passwd, reg_date,"; sql +=
	 * "ref, re_step, re_level, content, ip) values(?,?,?,?,?,?,?,?,?,?)";
	 * 
	 * 
	 * pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * article.getWriter()); pstmt.setString(2, article.getEmail());
	 * pstmt.setString(3, article.getSubject()); pstmt.setString(4,
	 * article.getPasswd()); // values(?,?,?,?,now(),?,?,?,?,?) // 사용시 index 6번째
	 * 칼럼을 메서드 인덱스 5로 접근 pstmt.setTimestamp(5, article.getReg_date()); // 신규나
	 * 답변에 맞춰 계산한 변수를 대입 ref, re_step, re_level pstmt.setInt(6, ref);
	 * pstmt.setInt(7, re_step); pstmt.setInt(8, re_level); pstmt.setString(9,
	 * article.getContent()); pstmt.setString(10, article.getIp());
	 * 
	 * int result = pstmt.executeUpdate(); System.out.printf("insert result = ",
	 * result);
	 * 
	 * } catch (Exception e) { System.out.printf("insertArticle() error: %s%n",
	 * e); } finally { pool.freeConnection(con, pstmt, rs); } }
	 * 
	 * 
	 * // 글 상세보기 조회수 증가 // select * from board where num=? public BoardDTO
	 * getArticle(int num) {
	 * 
	 * BoardDTO article = null;
	 * 
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null; String sql = "";
	 * 
	 * try { con = pool.getConnection(); sql =
	 * "update board set readcount = readcount+1 where num=?"; pstmt =
	 * con.prepareStatement(sql); pstmt.setInt(1, num); int result =
	 * pstmt.executeUpdate(); System.out.println("조회수 증가 유무(update)" + result);
	 * 
	 * pstmt.close(); sql = "select * from board where num=?"; pstmt =
	 * con.prepareStatement(sql); pstmt.setInt(1, num); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { article = makeArticleFromResult(rs);
	 * 
	 * article = new BoardDTO(); article.setNum(rs.getInt("num"));
	 * article.setWriter(rs.getString("writer"));
	 * article.setSubject(rs.getString("subject"));
	 * article.setEmail(rs.getString("email"));
	 * article.setContent(rs.getString("content"));
	 * article.setPasswd(rs.getString("passwd"));
	 * article.setReg_date(rs.getTimestamp("reg_date"));
	 * article.setReadcount(rs.getInt("readcount"));
	 * article.setIp(rs.getString("ip")); article.setRef(rs.getInt("ref"));
	 * article.setRe_step(rs.getInt("re_step"));
	 * article.setRe_level(rs.getInt("re_level")); }
	 * 
	 * } catch (Exception e) { System.out.println("getArticle() error:" + e); }
	 * finally { pool.freeConnection(con, pstmt, rs); }
	 * 
	 * return article; }
	 * 
	 * // 글 수정시 내용 보여주기 // select * from board where num=? public BoardDTO
	 * updateGetArticle(int num) {
	 * 
	 * BoardDTO article = null;
	 * 
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null; String sql = "";
	 * 
	 * try { con = pool.getConnection(); sql = "select * from board where num=?"
	 * ; pstmt = con.prepareStatement(sql); pstmt.setInt(1, num); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { article = makeArticleFromResult(rs);
	 * 
	 * article = new BoardDTO(); article.setNum(rs.getInt("num"));
	 * article.setWriter(rs.getString("writer"));
	 * article.setSubject(rs.getString("subject"));
	 * article.setEmail(rs.getString("email"));
	 * article.setContent(rs.getString("content"));
	 * article.setPasswd(rs.getString("passwd"));
	 * article.setReg_date(rs.getTimestamp("reg_date"));
	 * article.setReadcount(rs.getInt("readcount"));
	 * article.setIp(rs.getString("ip")); article.setRef(rs.getInt("ref"));
	 * article.setRe_step(rs.getInt("re_step"));
	 * article.setRe_level(rs.getInt("re_level")); }
	 * 
	 * } catch (Exception e) { System.out.println("getArticle() error:" + e); }
	 * finally { pool.freeConnection(con, pstmt, rs); } // 중복 부분을 따로 메서드로 작성 //
	 * 
	 * return article; }
	 * 
	 * // 글 수정 public boolean updateArticle(BoardDTO article) {
	 * 
	 * boolean check = false;
	 * 
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null; // select → 현재 테이블의 num의 최대값 구하기 // list.jsp or content.jsp를 통해 값을
	 * 전달
	 * 
	 * int num = article.getNum(); String passwd = article.getPasswd();
	 * System.out.println("passwd " + passwd);
	 * 
	 * System.out.printf("updateArticle num: %s%n", num); String sql = "";
	 * 
	 * try { con = pool.getConnection(); System.out.printf("con = %s%n", con);
	 * con.setAutoCommit(false);
	 * 
	 * //update 구문 sql =
	 * "update board set writer=?, email=?, subject=?, reg_date=now(), content=?, ip=? where num=? and passwd=?"
	 * ; // sql =
	 * "update board set writer=?, email=?, subject=?, reg_date=now(), content=?, ip=? where num=?"
	 * ;
	 * 
	 * pstmt = con.prepareStatement(sql); pstmt.setString(1,
	 * article.getWriter()); pstmt.setString(2, article.getEmail());
	 * pstmt.setString(3, article.getSubject()); pstmt.setString(4,
	 * article.getContent()); pstmt.setString(5, article.getIp());
	 * pstmt.setInt(6, article.getNum()); pstmt.setString(7,
	 * article.getPasswd());
	 * 
	 * int result = pstmt.executeUpdate(); System.out.printf(
	 * "update result = %d%n", result);
	 * 
	 * check = result == 1;
	 * 
	 * if (check) con.commit(); else con.rollback();
	 * 
	 * con.setAutoCommit(true);
	 * 
	 * } catch (Exception e) { System.out.println("updateArticle() error:" + e);
	 * if (con != null) { try { con.rollback(); } catch (SQLException e2) {
	 * System.out.println("rollback error: " + e2); } } } finally {
	 * pool.freeConnection(con, pstmt, rs); }
	 * 
	 * return check; }
	 * 
	 * // 글 삭제 public boolean deleteArticle(int num, String passwd) {
	 * 
	 * boolean check = false;
	 * 
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null;
	 * 
	 * System.out.printf("deleteArticle num: %s%n", num); String sql = "";
	 * 
	 * try {
	 * 
	 * con = pool.getConnection(); System.out.printf("con = %s%n", con);
	 * con.setAutoCommit(false); // delete query sql =
	 * "delete from board where num=? and passwd=?"; pstmt =
	 * con.prepareStatement(sql); pstmt.setInt(1, num); pstmt.setString(2,
	 * passwd);
	 * 
	 * int result = pstmt.executeUpdate(); System.out.printf("delete result = ",
	 * result);
	 * 
	 * check = result == 1;
	 * 
	 * if (check) con.commit(); else con.rollback();
	 * 
	 * con.setAutoCommit(true);
	 * 
	 * } catch (Exception e) { System.out.println("deleteArticle() error:" + e);
	 * if (con != null) { try { con.rollback(); } catch (SQLException e2) {
	 * System.out.println("rollback error: " + e2); } } } finally {
	 * pool.freeConnection(con, pstmt, rs); }
	 * 
	 * return check; }
	 */
	/*
	 * // 비밀번호 체크 public boolean checkPasswd(int num, String passwd) {
	 * 
	 * boolean check = false;
	 * 
	 * Connection con = null; PreparedStatement pstmt = null; ResultSet rs =
	 * null; String sql = ""; String true_passwd = "";
	 * 
	 * try { con = pool.getConnection(); sql =
	 * "select passwd from board where num=?"; pstmt =
	 * con.prepareStatement(sql); pstmt.setInt(1, num); rs =
	 * pstmt.executeQuery();
	 * 
	 * if (rs.next()) { true_passwd = rs.getString(1); }
	 * 
	 * check = true_passwd.equals(passwd);
	 * 
	 * } catch (Exception e) { System.out.println("checkPasswd error: " + e); }
	 * finally { pool.freeConnection(con, pstmt, rs); }
	 * 
	 * return check; }
	 */

	private BoardDTO makeArticleFromResult(ResultSet rs) throws Exception {

		BoardDTO article = new BoardDTO();
		article.setAnum(rs.getInt(BOARD[0]));
		article.setWriter(rs.getString(BOARD[1]));
		article.setCategory(rs.getInt(BOARD[2]));
		article.setAdate(rs.getTimestamp(BOARD[3]));
		article.setIp(rs.getString(BOARD[4]));
		article.setTitle(rs.getString(BOARD[5]));
		article.setAcontent(rs.getString(BOARD[6]));
		article.setAfile(rs.getString(BOARD[7]));
		article.setReadcount(rs.getInt(BOARD[8]));
		article.setTag1(rs.getString(BOARD[9]));
		article.setTag2(rs.getString(BOARD[10]));
		article.setTag3(rs.getString(BOARD[11]));
		article.setTag4(rs.getString(BOARD[12]));
		article.setTag5(rs.getString(BOARD[13]));
		article.setPnum(rs.getInt(BOARD[14]));
		return article;
	}

	private ReviewAllDTO makeReviewAllFromResult(ResultSet rs) throws Exception {

		ReviewAllDTO article = new ReviewAllDTO();
		/*
		 * "anum", //게시물번호 "writer", //작성자 "category", //카테고리 "adate", //작성날짜
		 * "ip", //ip "title", //제목 "acontent", //글내용 "afile", //첨부파일
		 * "readcount",//조회수 "tag1", //태그1 "tag2", //태그2 "tag3", //태그3 "tag4",
		 * //태그4 "tag5", //태그5 "pnum" //대상글번호
		 */
		article.setAnum(rs.getInt(BOARD[0]));
		article.setWriter(rs.getString(BOARD[1]));
		article.setCategory(rs.getInt(BOARD[2]));
		article.setAdate(rs.getTimestamp(BOARD[3]));
		article.setIp(rs.getString(BOARD[4]));
		article.setTitle(rs.getString(BOARD[5]));
		article.setAcontent(rs.getString(BOARD[6]));
		article.setAfile(rs.getString(BOARD[7]));
		article.setReadcount(rs.getInt(BOARD[8]));
		article.setTag1(rs.getString(BOARD[9]));
		article.setTag2(rs.getString(BOARD[10]));
		article.setTag3(rs.getString(BOARD[11]));
		article.setTag4(rs.getString(BOARD[12]));
		article.setTag5(rs.getString(BOARD[13]));
		article.setPnum(rs.getInt(BOARD[14]));
		//article.setEvtitle(rs.getString("etitle"));
		article.setRating(rs.getInt("rating"));
		Integer evnum = rs.getInt("evnum");
		if (evnum != null ) article.setEvnum(evnum);
		else article.setEvnum(-1);
		return article;
	}
}
