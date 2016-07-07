package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;

// 단순히 forward 방식으로 페이지 이동
public class ReviewWriteFormAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 1. list.jsp(글쓰기) → 신규글, 2. content.jsp(게시물 상세) → 답변글
		int num = 0; // writePro.jsp
		// 답변글
		// content.jsp에서 매개변수 넘어온 경우
		if (request.getParameter("num") != null) {
			num = Integer.parseInt(request.getParameter("num"));
			System.out.printf("=List.jsp에서 넘어온 값 num = %s%n", num);
		}
		// request 객체에 저장후 전달
		request.setAttribute("num", num);
		request.setAttribute("writer", "aaa");
		return REVIEW + "/writeForm.jsp";
	}

}
