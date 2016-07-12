package legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inc.itgbbs.util.ContentPath;
import legacy.model.BoardDAO;
import legacy.model.BoardDTO;

public class FreeUpdateFormAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		
		//list.jsp에서 content.jsp로 넘어온 두 값 num, pageNum
		int anum = Integer.parseInt(request.getParameter("anum"));
		String pageNum = request.getParameter("pageNum");
		System.out.println("FreeUpdateFormAction의 anum = " + anum + ", pageNum = " + pageNum); //파라미터로 받은 값 디버깅
			
		BoardDAO dbPro = new BoardDAO();	//메서드 호출
		BoardDTO article = dbPro.updateGetArticle(anum);	//updateForm.jst와 소스가 거의 같음
		
		//답글쓰기 주소 넘길때 코드를 줄이기 위한 것
	/* 	int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level(); */
		
		//값 전달 
		request.setAttribute("anum", anum);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("article", article);
		
		return FREE+"/updateForm.jsp";
	}

}
