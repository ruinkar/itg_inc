package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etc.ContentPath;
import model.BoardDAO;
import model.BoardDTO;

public class FreeUpdateProAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		// 한글처리
		request.setCharacterEncoding("utf-8");
		// <jsp:useBean id="article" class="model.BoardDTO" />
		BoardDTO article = new BoardDTO();
		// <jsp:setProperty name="article" property="*" />

		// writeForm에서 입력받은 제목, 태그, 내용, 작성자 정보 입력(작성자는 로그인 세션 활용 예정)
		article.setAnum(Integer.parseInt(request.getParameter("anum")));
		article.setCategory(0); //자유게시판 카테고리
		article.setTitle(request.getParameter("title"));
		article.setAcontent(request.getParameter("acontent"));
		article.setWriter(request.getParameter("writer"));
		article.setTag1(request.getParameter("tag1"));
		article.setTag2(request.getParameter("tag2"));
		article.setTag3(request.getParameter("tag3"));
		article.setTag4(request.getParameter("tag4"));
		article.setTag5(request.getParameter("tag5"));

		// updateArticle메서드호출
		System.out.println("UpdateForm.jsp에서 받은 anum = " + request.getParameter("anum"));
		BoardDAO dbPro = new BoardDAO();
		dbPro.updateArticle(article);
		
		return FREE + "/updatePro.jsp";
	}

}
