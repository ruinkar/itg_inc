<%@page import="model.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
		   //한글처리
		   request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="article" class="model.BoardDTO" />
	<jsp:setProperty name="article" property="*" />
	<%
	   //로그인 임시 계정
	   article.setWriter("jjj");
		//댓글용 타이틀
		article.setTitle("댓글");
	
	   Timestamp t=new Timestamp(System.currentTimeMillis());
	   article.setAdate(t);//직접 컴퓨터의 시스템날짜와 시간
	   article.setIp(request.getRemoteAddr());
	   //insertArticle메서드호출
	   BoardDAO dbPro=new BoardDAO();
	   dbPro.insertReply(article);
	   //정상적으로 데이터가 입력
	   
	   response.sendRedirect("okkyFreeArticle.jsp?anum="+article.getPnum());
	   
	%>