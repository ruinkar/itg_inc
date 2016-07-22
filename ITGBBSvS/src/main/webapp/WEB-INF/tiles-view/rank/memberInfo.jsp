<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
*{margin:0; padding:0; list-style:none; }
#wrapper-list {margin:auto; }
#list {}

</style>
<script>
$(function() {
	var json_page = JSON.parse('${json_page}');
	itg.mpage.init("${mem.id}");
	itg.mpage.print(json_page);
});
</script>
</head>
<body>
	<div><!--
	--><div id="thumbnail_box" style="width:150px; height:150px;"></div><!--
	--><div id="nick_box">${mem.nick}</div><!-- 
	--><div id="mpoint_box">${mem.mpoint}</div>
	</div>
	<div id="list-container">
		<ul id="list"></ul>
	</div><!-- 
	--><div id="pgbox">${pagingHtml}</div>
</body>
</html>