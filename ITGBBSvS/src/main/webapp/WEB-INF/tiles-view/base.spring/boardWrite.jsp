<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<spring:hasBindErrors name="command"/>
<form:errors path="command"/>
<!-- enctype->파일 첨부를 하기위해서 필요 p388,391
       spring:message 액션태그->code="불러올 키값"
       form:errors 액션태그=>path="적용필드명(DTO중 입력받은 필드명)"
                                                 커맨드객체명.필드명
-->
<form action="write.do" enctype="multipart/form-data" method="post">
	<spring:message code="write.form.title"/>
	<input type="text" name="title" value="${command.title}">
	<form:errors path="command.title" />
	<br>

	<spring:message code="write.form.writer"/>
	<input type="text" name="writer" value="${command.writer}">
	<form:errors path="command.writer" />
	<br>

	<spring:message code="write.form.pwd"/>
	<input type="password" name="pwd">
	<form:errors path="command.pwd" />
	<br>
 
	<spring:message code="write.form.content"/>
	<textarea rows="10" cols="50" name="content">${command.content}</textarea>
	<form:errors path="command.content" />
	<br>
 
	<spring:message code="write.form.upload"/>
	<input type="file" name="upload">
    <p>
	<input type="submit" value="<spring:message code="write.form.submit" />">
	<input type="button" value="<spring:message code="list.content.title" />" 
	          onclick="location.href='list.do'">
</form>

