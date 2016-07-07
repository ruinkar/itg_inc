<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
 <HEAD>
  <TITLE>회원탈퇴 확인</TITLE>
<link href="style.css" rel="stylesheet"
      type="text/css">
<script language="JavaScript" src="prototype.js"></script>
<script language="JavaScript" src="script.js"></script>
</SCRIPT>
 </HEAD>
 <BODY onload="document.del.password.focus()" bgcolor="#ffffff">
  <center>
     <TABLE>
    <form name="del" method="post" 
	                      action="DeletePro2.do">
     <TR>
		<TD align="center" colspan="2">
	<b>${id}님 비밀번호를 입력해주세요</b></TD>
     </TR>

     <TR>
		<TD>비밀번호</TD>
		<TD><INPUT TYPE="password" NAME="password"></TD>
     </TR>
     
     <TR>
	    <TD>
		<INPUT TYPE="button" value="탈퇴" 
		        onclick="submit()">&nbsp;&nbsp;&nbsp;
		<INPUT TYPE="button" value="취소"
        onclick="document.location.href='/ITGBBS/member/Login2.jsp?id=${id}'">
		</TD>
     </TR>
	 <!-- hidden값 전달 -->
	 <input type="hidden" name="id" value="${id}">
	 <!--  -->
	 </form>
     </TABLE>
  </center>
 </BODY>
</HTML>
