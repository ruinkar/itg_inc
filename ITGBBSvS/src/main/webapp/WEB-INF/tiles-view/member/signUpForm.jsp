<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입폼</title>
</head>
<body>
<!-- form:errors path="fieldName" -->
	<h2>레코드 추가</h2>
	<form:form modelAttribute="memberCommand" autocomplete="off">
		<form:errors element="div"/>
		아이디 : <form:input path="id"/>
		<font color="red"><form:errors path="id"/></font>
		<br>
		비밀번호 : <form:password path="password" showPassword="false"/>
		<font color="red"><form:errors path="password"/></font>
		<br>
		이름 : <form:input path="name"/>
		<font color="red"><form:errors path="name"/></font>
		<br>
		 닉네임 : <form:input path="nick"/>
		<font color="red"><form:errors path="nick"/></font>
		<br>
		이메일 : <form:input path="email"/>
		<font color="red"><form:errors path="email"/></font>
		<br>
		<input type="submit" value="보내기">
	</form:form>
</body>
</html>