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
	   
	   //updateArticle메서드호출
	   System.out.println("anum = " + article.getAnum());
	   System.out.println("anum2 = " + request.getParameter("anum"));
	   BoardDAO dbPro=new BoardDAO();
	   dbPro.updateArticle(article);
	   //정상적으로 데이터가 입력
	   response.sendRedirect("okkyFree2.jsp");
	%>