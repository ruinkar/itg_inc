package legacy.action;

//추가->web상에 import
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import inc.itgbbs.util.ContentPath;
import legacy.model.LoginInfoDTO;
import legacy.model.MemberDTO;

public class RegisterProcAction2 implements CommandAction,ContentPath {
	// 요청한 명령어에 따른 페이지로 이동시켜주는 메서드
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// 한글처리
		request.setCharacterEncoding("utf-8");

		// 빈즈객체를 생성 ->확인용
		MemberDTO mdt = new MemberDTO();
		System.out.println("mdt=" + mdt);
		LoginInfoDTO ldt = new LoginInfoDTO();

		mdt.setId(request.getParameter("id"));
		mdt.setName(request.getParameter("name"));
		mdt.setNick(request.getParameter("nick"));
		mdt.setEmail(request.getParameter("email"));
		ldt.setId(request.getParameter("id"));
		ldt.setPassword(request.getParameter("repassword"));

		//회원등록확인.jsp로 넘기는 값
		request.setAttribute("mdt", mdt);
		request.setAttribute("ldt", ldt);

		return MEMBER+"/RegisterProc2.jsp";
	}
}
