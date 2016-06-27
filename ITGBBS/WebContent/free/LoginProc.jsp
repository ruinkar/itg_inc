<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!--id, passwd를 체크( 레이아웃은 아무런 역할도 없으므로 body, head 태그를 삭제함 )  -->

<%
	//Login.jsp -> id, passwd -> DB접속 -> true(LoginSuccess.jsp -> 나중에 Login.jsp), false(LogError.jsp)
	String mem_id = request.getParameter("j_username");
	String mem_passwd = request.getParameter("j_password");
	System.out.println("mem_id="+mem_id+
						",mem_passwd="+mem_passwd);
	
/* 	//MemberDAO 객체를 생성
	MemberDAO memMgr = new MemberDAO();
	// select id, passwd from member where id='test' and passwd='1234' sql 문장 결과를 반환하는 메서드
	boolean check = memMgr.loginCheck(mem_id, mem_passwd); */
	
%>

<% 
	response.sendRedirect("okkyFree2.jsp");
/* 	if(check){	//그런 사용자가 존재한다면
		session.setAttribute("idKey", mem_id);
		response.sendRedirect("Login.jsp"); //이동 목적으로 쓰이는 코드, 공유용은 forward
	}else{
		response.sendRedirect("LogError.jsp");	//에러페이지
	} */

%>
