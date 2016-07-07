package action;

import javax.servlet.http.*;

import etc.ContentPath;
import member.MemberDAO;

public class LoginProcAction implements CommandAction,ContentPath

{
	public String requestPro(HttpServletRequest request,
            HttpServletResponse response)
            throws Throwable{
         
		HttpSession session = request.getSession();
		  //Login.do에 의한 Login.jsp에서 값이 넘어옴.
		  String id = request.getParameter("id");
		  String pw = request.getParameter("password");

		  System.out.println("id="+id);
		  System.out.println("passwd="+pw);
		  MemberDAO memMgr = new MemberDAO();
		  boolean loginCheck = memMgr.loginCheck(id,pw);
       
		  request.setAttribute("loginCheck", 
				                new Boolean(loginCheck)); 
		  session.setAttribute("id", new String(id));
	      return MEMBER+"/LoginProc.jsp";
	}
}
