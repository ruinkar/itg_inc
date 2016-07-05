package action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etc.ContentPath;
import model.BoardDAO;
import model.BoardDTO;

public class FreeReplyProAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// <jsp:useBean id="article" class="model.BoardDTO" />
		BoardDTO article = new BoardDTO();
		// <jsp:setProperty name="article" property="*" />
		int pnum = Integer.parseInt(request.getParameter("pnum").trim());
		int pageNum = Integer.parseInt(request.getParameter("pageNum").trim());
		System.out.println("pnum = "+pnum +", pageNum = " + pageNum);
		
		article.setPnum(pnum);
		article.setAcontent(request.getParameter("acontent"));
		article.setTag1(request.getParameter("tag1"));
		article.setTag2(request.getParameter("tag2"));
		article.setTag3(request.getParameter("tag3"));
		article.setTag4(request.getParameter("tag4"));
		article.setTag5(request.getParameter("tag5"));

		// 로그인 임시 계정
		article.setWriter("jjj");
		// 댓글용 타이틀
		article.setTitle("댓글");

		Timestamp t = new Timestamp(System.currentTimeMillis());
		article.setAdate(t);// 직접 컴퓨터의 시스템날짜와 시간
		article.setIp(request.getRemoteAddr());
		// insertArticle메서드호출
		article.setCategory(3);// 댓글 카테고리 설정
		BoardDAO dbPro = new BoardDAO();
		dbPro.insertReply(article);
		// 정상적으로 데이터가 입력

		request.setAttribute("anum", pnum);
		request.setAttribute("pageNum", pageNum);
		System.out.println("FreeReplyProAction 출력 성공!");

		return FREE + "/replyPro.jsp";
	}

}
