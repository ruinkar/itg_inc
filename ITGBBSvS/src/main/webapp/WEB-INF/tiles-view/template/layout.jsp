<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<tiles:insertAttribute name="css" />
<tiles:insertAttribute name="js" />
</head>
<body>
<table border="0" cellpadding="0" cellspacing="1" bgcolor="#a0a0a0" width="100%">
	<tr height="100" valign="middle" bgcolor="#ffffff">
		<td colspan="2"><tiles:insertAttribute name="header" /></td>
	</tr>
	<tr height="600" bgcolor="#ffffff">
		<td width="15%" valign="top"><tiles:insertAttribute name="menu" /></td>
		<td width="85%" valign="top"><tiles:insertAttribute name="body" /></td>
	</tr>
	<tr bgcolor="#ffffff">
		<td colspan="2"><tiles:insertAttribute name="footer" /></td>
	</tr>
</table>
</body>
</html>