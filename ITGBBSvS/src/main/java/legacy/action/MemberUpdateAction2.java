package legacy.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import inc.itgbbs.util.ContentPath;
import legacy.member.MemberDAO;
import legacy.model.LoginInfoDTO;
import legacy.model.MemberDTO;

public class MemberUpdateAction2 implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		// String id = request.getParameter("id");
		
		MemberDAO mao = new MemberDAO();
		
		LoginInfoDTO lto = mao.getloginfo(id);
		MemberDTO mto = mao.getMember(id);
		
		
		System.out.println("aaaa");
		request.setAttribute("id", id);
		request.setAttribute("mto", mto);
		request.setAttribute("lto", lto);
		
		
		return MEMBER+"/MemberUpdate2.jsp";
	}

}
