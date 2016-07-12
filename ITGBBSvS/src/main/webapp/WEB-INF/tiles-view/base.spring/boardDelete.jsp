<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<form:form commandName="command">
	<form:errors element="div"/>
	<spring:message code="write.form.pwd"/>
	<form:password path="pwd"/>
	<form:errors path="pwd"/><br>
	
	<input type="submit" value="<spring:message code="write.form.submit"/>">
	<input type="button" value="<spring:message code="list.content.title"/>" 
	                               onclick="location.href='list.do'">
</form:form>