package legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import inc.itgbbs.util.ContentPath;
import legacy.member.MemberDAO;

public class DeleteProAction2 implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		//String id = (String)session.getAttribute("id");
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDAO mda = new MemberDAO();
		int check = mda.deleteMember(id, password);
		
		request.setAttribute("check", check);
		session.invalidate();
		
		return MEMBER+"/DeletePro2.jsp";
	}

}
