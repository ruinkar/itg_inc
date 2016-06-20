package base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.model.BoardDAO;
import base.model.BoardDTO;
import model.*;

public class ContentAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		BoardDAO bdPro = new BoardDAO();
		BoardDTO article = bdPro.getArticle(num);
		
		// 답변에 대한 메서드 정리		
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		
		return BASE + "/content.jsp";
	}

}
