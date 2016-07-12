package base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.model.BoardDAO;
import base.model.BoardDTO;
import legacy.action.CommandAction;
import legacy.model.*;

public class UpdateProAction implements CommandAction, inc.itgbbs.util.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		BoardDTO article = new BoardDTO();
		BoardDAO dbPro = new BoardDAO();
		boolean check = false;
		// <jsp:setProperty name="article" property="*"/>
		// num, ref, re_step, re_level, writer, subject, passwd, content, email
		// reg_date, readcount, ip

		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setWriter(request.getParameter("writer"));
		article.setSubject(request.getParameter("subject"));
		article.setPasswd(request.getParameter("passwd"));
		article.setContent(request.getParameter("content"));
		article.setEmail(request.getParameter("email"));
		article.setIp(request.getRemoteAddr());

		String pageNum = request.getParameter("pageNum");
		System.out.println("pageNum = " + pageNum);

		check = dbPro.updateArticle(article);

		request.setAttribute("check", check);
		request.setAttribute("pageNum", pageNum);

		return BASE + "/updatePro.jsp";
	}

}
