<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>
.one-line-box {
	display: inline-block;
	color: red;
	height: 1.5em;
	overflow: hidden;
}

.sign-up-form tr td:first-child {
	text-align: right;
	padding-right: 10px;
}

.sign-up-form tr:last-child td {
	text-align: center;
}

.container {
	margin: 0;
}
</style>
<form:form modelAttribute="memberCommand" autocomplete="off"
	cssClass="container">
	<table class="sign-up-form">
		<tr>
			<td>아이디</td>
			<td><form:input path="id" /></td>
			<td><form:errors path="id" element="div" cssClass="one-line-box" /></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><form:input path="password" /></td>
			<td><form:errors path="password" element="div"
					cssClass="one-line-box" /></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><form:input path="name" /></td>
			<td><form:errors path="name" element="div"
					cssClass="one-line-box" /></td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td><form:input path="nick" /></td>
			<td><form:errors path="nick" element="div"
					cssClass="one-line-box" /></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><form:input path="email" /></td>
			<td><form:errors path="email" element="div"
					cssClass="one-line-box" /></td>
		</tr>
		<tr>
			<td colspan="3"><input type="submit" value="보내기"></td>
		</tr>
	</table>
</form:form>