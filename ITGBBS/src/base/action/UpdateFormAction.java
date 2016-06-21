package base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import base.model.BoardDAO;
import base.model.BoardDTO;
import model.*;

public class UpdateFormAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");

		BoardDAO bdPro = new BoardDAO();
		BoardDTO article = bdPro.updateGetArticle(num);
		
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		
		return BASE + "/updateForm.jsp";
	}

}
