<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ page session="true"%>
<tiles:importAttribute name="javascripts" />
<tiles:importAttribute name="stylesheets" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<c:forEach var="script" items="${javascripts}">
	<script src="<c:url value="${script}"/>"></script></c:forEach>
<c:forEach var="styles" items="${stylesheets}">
	<link rel="stylesheet" type="text/css" href="<c:url value="${styles}"/>"></c:forEach>
</head>
<body>
<div id="wrapper">
	<div id="sidebar-wrapper">
		<ul class="sidebar-nav"><tiles:insertAttribute name="menu" /></ul></div>
	<div class="page-content-wrapper"><tiles:insertAttribute name="body" />
		<%-- <table class="main_table" border="0" cellpadding="0" cellspacing="1" bgcolor="#a0a0a0" width="100%">
			<tr bgcolor="#ffffff">
				<td class="main_menu" width="15%" valign="top"><tiles:insertAttribute name="menu" /></td>
				<td width="85%" valign="top"><tiles:insertAttribute name="body" /></td>
			</tr>
		</table> --%>
	</div>
</div>
</body>
</html>