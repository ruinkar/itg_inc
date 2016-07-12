package legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.model.BoardDAO;
import base.model.BoardDTO;
import legacy.action.CommandAction;
import legacy.model.*;

public class ReviewUpdateFormAction implements CommandAction, inc.itgbbs.util.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int anum = Integer.parseInt(request.getParameter("anum"));
		String pageNum = request.getParameter("pageNum");

		ReviewDAO reviewdao = new ReviewDAO();
		ReviewAllDTO article = reviewdao.getArticle(anum);
		
		// 답변에 대한 메서드 정리		
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		
		
		return REVIEW + "/updateForm.jsp";
	}

}
