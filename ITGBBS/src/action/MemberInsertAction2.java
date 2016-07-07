package action;

//추가->web상에 import
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import etc.ContentPath;
import member.MemberDAO;
import model.LoginInfoDTO;
import model.MemberDTO;

public class MemberInsertAction2 implements CommandAction, ContentPath {
	// 요청한 명령어에 따른 페이지로 이동시켜주는 메서드
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		// 한글처리
		request.setCharacterEncoding("UTF-8");

		// 빈즈객체를 생성 ->확인용
		MemberDTO mdt = new MemberDTO();
		LoginInfoDTO ldt = new LoginInfoDTO();

		mdt.setId(request.getParameter("id"));
		mdt.setName(request.getParameter("name"));
		mdt.setNick(request.getParameter("nick"));
		mdt.setEmail(request.getParameter("email"));

		ldt.setId(request.getParameter("id"));
		ldt.setPassword(request.getParameter("password"));

		// 회원가입메서드 호출
		MemberDAO mao = new MemberDAO();
		boolean flag = mao.memberInsert(mdt,ldt);
	    System.out.println("웹상의 확인(flag)="+flag);
	    
	    request.setAttribute("flag", new Boolean(flag));

		return MEMBER+"/MemberInsert2.jsp";
	}
}
