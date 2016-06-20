package base.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import base.model.BoardDAO;
import model.*;

public class DeleteProAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("num"));
		String passwd = request.getParameter("passwd");
		
		BoardDAO dbPro = new BoardDAO();
		boolean check = false;
		/*
		<jsp:useBean id="article" class="hoganlee.board.BoardDTO"/>
		<jsp:setProperty name="article" property="*"/>*/
		// num, ref, re_step, re_level, writer, subject, passwd, content, email
		// reg_date, readcount, ip
		check = dbPro.deleteArticle(num, passwd);
		
		System.out.println("pageNum = " + pageNum);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("check", check);
		
		return BASE + "/deletePro.jsp";
	}

}
