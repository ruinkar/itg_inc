package legacy.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inc.itgbbs.util.ContentPath;
import legacy.model.BoardDAO;
import legacy.model.BoardDTO;

public class FreeWriteProAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// <jsp:useBean id="article" class="model.BoardDTO" />
		BoardDTO article = new BoardDTO();
		// <jsp:setProperty name="article" property="*" />

		//writeForm에서 입력받은 제목, 태그, 내용, 작성자 정보 입력(작성자는 로그인 세션 활용 예정)
		article.setTitle(request.getParameter("title"));
		article.setAcontent(request.getParameter("acontent"));
		article.setWriter(request.getParameter("writer"));
		article.setTag1(request.getParameter("tag1"));
		article.setTag2(request.getParameter("tag2"));
		article.setTag3(request.getParameter("tag3"));
		article.setTag4(request.getParameter("tag4"));
		article.setTag5(request.getParameter("tag5"));
		
		Timestamp t = new Timestamp(System.currentTimeMillis());
		article.setAdate(t);// 직접 컴퓨터의 시스템날짜와 시간
		article.setIp(request.getRemoteAddr());
		// insertArticle메서드호출
		article.setCategory(0);// 자유게시판 카테고리 설정
		BoardDAO dbPro = new BoardDAO();
		dbPro.insertArticle(article);
		// 정상적으로 데이터가 입력

		return FREE+"/writePro.jsp";
	}

}
