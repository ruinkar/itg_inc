package action;

//추가->web상에 import
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etc.ContentPath;

public class RegisterAction2 implements CommandAction,ContentPath
{
	//요청한 명령어에 따른 페이지로 이동시켜주는 메서드
	public String requestPro(HttpServletRequest request,
		                     HttpServletResponse response)
		                     throws Throwable{
    return MEMBER+"/Register2.jsp";
  
	}
}
