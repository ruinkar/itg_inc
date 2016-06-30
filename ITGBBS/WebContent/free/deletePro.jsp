<%@page import="model.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	   //한글처리
	   request.setCharacterEncoding("utf-8");
		int anum = Integer.parseInt(request.getParameter("anum"));	
		String pageNum = request.getParameter("pageNum");	//삭제할 게시물의 페이지번호

	   BoardDAO dbPro=new BoardDAO();
	   boolean check = dbPro.deleteArticle(anum);
	   //정상적으로 데이터가 입력
	  if(check==true){	//글 삭제 성공하면(response.sendRedirect("list.jsp?pageNum="+pageNum);) %>
		   <meta http-equiv="Refresh" content="0;url=okkyFree2.jsp?pageNum=<%=pageNum%>">
		   <!--  	   
		   <meta http-equiv="Refresh"(새로고침) content="0(몇초뒤 이동);url=list.jsp?pageNum=<%=pageNum%>(이동할 페이지명?매개변수값"> 
		   페이지 전환을 빨리 읽기 위해 넣은 'refresh'-->
	<% }else{%>
			<script>
				alert("통신 상의 문제로 게시글을 삭제할 수 없습니다.\n 관리자에게 문의해주세요.");
				history.go(-1);
			</script>
	<% } %>	