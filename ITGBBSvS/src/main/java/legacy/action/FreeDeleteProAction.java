package legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inc.itgbbs.util.ContentPath;
import legacy.model.BoardDAO;

public class FreeDeleteProAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		// 한글처리
		request.setCharacterEncoding("utf-8");
		int anum = Integer.parseInt(request.getParameter("anum"));
		/*int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 삭제할 게시물의 페이지번호
		System.out.println("pageNum = " + pageNum);*/

		BoardDAO dbPro = new BoardDAO();
		boolean check = dbPro.deleteArticle(anum);
		// 정상적으로 데이터가 입력
		System.out.println("deleteArticle() 결과 값 = " + check);

		request.setAttribute("check", check);
		
		
		return FREE + "/deletePro.jsp";
	}

}
