<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!--게시판의 글쓰기와 동일하다. -->
<spring:hasBindErrors name="command"/>
<form:errors path="command"/>
<form action="update.do" enctype="multipart/form-data" method="post">

	<input type="hidden" name="seq" value="${command.seq }">

	<spring:message code="write.form.title"/>
	<input type="text" name="title" value="${command.title }">
	<form:errors path="command.title"/><br>

	<spring:message code="write.form.writer"/>
	<input type="text" name="writer" value="${command.writer }">
	<form:errors path="command.writer"/><br>

	<spring:message code="write.form.pwd"/>
	<input type="password" name="pwd" >
	<form:errors path="command.pwd"/><br>
 
	<spring:message code="write.form.content"/>
	<textarea rows="10" cols="50" name="content">${command.content }</textarea>
	<form:errors path="command.content"/><br>
 
	<spring:message code="write.form.upload"/>
	<input type="file" name="upload">
	<c:if test="${!empty command.filename }">
		(${command.filename })파일이 등록되어 있습니다.<br>
	</c:if>
	
	<input type="submit" value="<spring:message code="write.form.submit"/>">
	<input type="button" value="<spring:message code="list.content.title"/>" 
	                               onclick="location.href='list.do'">
</form>

