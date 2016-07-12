package legacy.action;

//추가->web상에 import
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import inc.itgbbs.util.ContentPath;
import legacy.member.MemberDAO;

public class LoginAction implements CommandAction, ContentPath
{
	//요청한 명령어에 따른 페이지로 이동시켜주는 메서드
	public String requestPro(HttpServletRequest request,
		                     HttpServletResponse response)
		                     throws Throwable{
	/*HttpSession session = request.getSession();
	String id = (String)request.getAttribute("id");
	String password = request.getParameter("password");
	
	MemberDAO mda = new MemberDAO();
	int check = mda.deleteMember(id, password);
	
	request.setAttribute("check", check);*/
		
		
    return MEMBER+"/Login2.jsp";
  
	}
}
