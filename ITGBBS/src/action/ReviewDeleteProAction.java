package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import base.model.BoardDAO;
import model.*;

public class ReviewDeleteProAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		int anum = Integer.parseInt(request.getParameter("anum"));
		
		ReviewDAO reviewPro = new ReviewDAO();
		boolean check = false;
		check = reviewPro.deleteArticle(anum);
		
		System.out.println("pageNum = " + pageNum);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return "/index.jsp";
	}

}
