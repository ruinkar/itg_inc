package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

public class ReviewDeleteFormAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			
		String anum = request.getParameter("anum");
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("anum", anum);
		request.setAttribute("pageNum", pageNum);
		
		return REVIEW + "/deleteForm.jsp";
	}

}
