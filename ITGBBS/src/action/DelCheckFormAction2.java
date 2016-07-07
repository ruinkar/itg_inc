package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etc.ContentPath;

public class DelCheckFormAction2 implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		
		request.setAttribute("id", id);
		
		return MEMBER+"/DelCheckForm2.jsp";
	}

}
