package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ReviewAllDTO;
import model.ReviewDAO;

public class ReviewContentAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		int anum = Integer.parseInt(request.getParameter("anum"));
		String pageNum = request.getParameter("pageNum");
		
		ReviewDAO reviewdao = new ReviewDAO();
		ReviewAllDTO article = reviewdao.getArticle(anum);
		
		int replyNum = 0;
		List repliesList = null;
		replyNum = reviewdao.getReplyCount(anum);
		if (replyNum > 0) {
			repliesList = reviewdao.getReplies(anum);
		}
		
		// 답변에 대한 메서드 정리		
		request.setAttribute("article", article);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("replyNum", replyNum); 
		request.setAttribute("repliesList", repliesList); 

		return REVIEW + "/content.jsp";
	}

}
