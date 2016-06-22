package base.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.CommandAction;
import base.model.BoardDAO;
import base.model.BoardDTO;

public class WriteProAction implements CommandAction, etc.ContentPath {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("utf-8");
		
		BoardDTO article = new BoardDTO();
		BoardDAO dbPro = new BoardDAO();
		Timestamp t = new Timestamp(System.currentTimeMillis());
		
		// num, ref, re_step, re_level, writer, subject, passwd, content, email
		// reg_date, readcount, ip
		article.setNum(Integer.parseInt(request.getParameter("num")));
		article.setRef(Integer.parseInt(request.getParameter("ref")));
		article.setRe_step(Integer.parseInt(request.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(request.getParameter("re_level")));
		article.setWriter(request.getParameter("writer"));
		article.setSubject(request.getParameter("subject"));
		article.setPasswd(request.getParameter("passwd"));
		article.setContent(request.getParameter("content"));
		article.setEmail(request.getParameter("email"));
		article.setReg_date(t); // 직접 컴퓨터의 날짜 및 시간 등록
		article.setIp(request.getRemoteAddr());
		
		//insertArticle 호출
		dbPro.insertArticle(article);
		
		// 정상적으로 데이터 입력
		return BASE + "/writePro.jsp";
	}

}
