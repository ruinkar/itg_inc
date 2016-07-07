package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import etc.ContentPath;
import member.MemberDAO;
import model.LoginInfoDTO;
import model.MemberDTO;

public class MemberUpdateProcAction2 implements CommandAction, ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session =request.getSession();
		String id = (String)session.getAttribute("id");
		System.out.println(id);
		// String id = request.getParameter("id");
		MemberDTO mto = new MemberDTO();
		mto.setId(id);
		mto.setName(request.getParameter("name"));
		mto.setNick(request.getParameter("nick"));
		mto.setEmail(request.getParameter("email"));
		
		System.out.println(mto);
		
		LoginInfoDTO lto = new LoginInfoDTO();
		lto.setId(id);
		lto.setPassword(request.getParameter("password"));
		System.out.println(lto);
		
		MemberDAO mao = new MemberDAO();
		boolean check = mao.memberUpdate(mto, lto);
		
		
		request.setAttribute("check", check);
		
		
		return MEMBER+"/MemberUpdateProc2.jsp";
	}

}
