package legacy.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import legacy.action.CommandAction;
import legacy.model.BoardDTO;
import legacy.model.ReviewDAO;
import legacy.model.ReviewDTO;

public class ReviewWriteProAction implements CommandAction, inc.itgbbs.util.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		BoardDTO article = new BoardDTO();
		ReviewDTO review = new ReviewDTO();
		ReviewDAO reviewdao = new ReviewDAO();
		Timestamp t = new Timestamp(System.currentTimeMillis());
		
		
		/*
		 * private int anum; //게시물번호
	private String writer; //작성자
	private int category;	//카테고리
	private Timestamp adate; //작성날짜
	private String ip; //ip 
	private String title;	//제목
	private String acontent;//글내용
	private String afile;	//첨부파일
	private int readcount;//조회수
	private String tag1; //태그1
	private String tag2; //태그2
	private String tag3;//태그3
	private String tag4; //태그4
	private String tag5;//태그5
	private int pnum; //대상글번호
*/
		article.setWriter(request.getParameter("writer"));
		article.setCategory(Integer.parseInt(request.getParameter("category")));
		article.setAdate(t); // 직접 컴퓨터의 날짜 및 시간 등록
		article.setIp(request.getRemoteAddr());
		article.setTitle(request.getParameter("title"));
		article.setAcontent(request.getParameter("acontent"));
		article.setAfile(request.getParameter("afile"));
		article.setReadcount(0);
		article.setTag1(request.getParameter("tag1"));
		article.setTag2(request.getParameter("tag2"));
		article.setTag3(request.getParameter("tag3"));
		article.setTag4(request.getParameter("tag4"));
		article.setTag5(request.getParameter("tag5"));
		review.setAnum(article.getAnum());
		review.setEvnum(Integer.parseInt(request.getParameter("evnum")));
		review.setRating(Integer.parseInt(request.getParameter("rating")));
		
		
		System.out.println(article.toString());
		System.out.println(review.toString());
		//insertArticle 호출
		reviewdao.insertArticle(article , review);
		// 정상적으로 데이터 입력
		return "/index.jsp";
	}

}
