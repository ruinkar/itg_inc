package base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 단순히 forward 방식으로 페이지 이동
public class WriteFormAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 1. list.jsp(글쓰기) → 신규글, 2. content.jsp(게시물 상세) → 답변글
		int num = 0, ref = 1, re_step = 0, re_level = 0; // writePro.jsp
		// 답변글
		// content.jsp에서 매개변수 넘어온 경우
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			ref = Integer.parseInt(request.getParameter("ref"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
			System.out.printf("=content.jsp에서 넘어온 값 num = %s%n", num);
			System.out.printf("ref = %s, re_step = %s, re_level = %s%n", ref, re_step, re_level);
		}
		// request 객체에 저장후 전달
		request.setAttribute("num", num);
		request.setAttribute("ref", ref);
		request.setAttribute("re_step", re_step);
		request.setAttribute("re_level", re_level);
				
		return BASE + "/writeForm.jsp";
	}

}
