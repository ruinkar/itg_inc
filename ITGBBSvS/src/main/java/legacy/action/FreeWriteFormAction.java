package legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inc.itgbbs.util.ContentPath;

public class FreeWriteFormAction implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub

		
		int anum = 0; // writePro.jsp
		// 답변글
		if (request.getParameter("anum") != null) {
			anum = Integer.parseInt(request.getParameter("anum"));
			System.out.println("=okkyFree2.jsp에서 넘어온값 anum=" + anum);
		}

		request.setAttribute("anum", anum);
		
		return FREE+"/okkyFreeWrite.jsp";
	}

}
