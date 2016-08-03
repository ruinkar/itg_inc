<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입폼</title>
<style>
.one-line-box {
	display: inline-block;
	color: red;
	height: 1.5em;
	overflow: hidden;
}
.delete-form tr td:first-child {
	text-align: right;
	padding-right: 10px;
}
.delete-form tr:last-child td {
	text-align: center;
}

.container {
	margin:0;
}
</style>
</head>
<body>
	<form:form modelAttribute="command" cssClass="container">
		<form:input path="id" readonly="true"/>님, 비밀번호를 확인 후 탈퇴를 진행합니다.
		<table class="delete-form">
			<tr>
				<td>비밀번호</td>
				<td><form:input path="password" /></td>
				<td><form:errors path="password" element="div" cssClass="one-line-box" /></td>
			</tr>
			<tr>
				<td colspan="3"><input type="submit" value="보내기"></td>
			</tr>
		</table>
	</form:form>
</body>
</html>