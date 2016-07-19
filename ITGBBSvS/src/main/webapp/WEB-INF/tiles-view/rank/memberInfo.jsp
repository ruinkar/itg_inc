<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
*{margin:0; padding:0; border-style:none; }
#wrapper-list {margin:auto; }
#list {};

</style>
<script>
$(function() {
	itg.mpage.init();
	itg.mpage.print('${json_list}');
});
</script>
</head>
<body>
	<div><!-- 
	--><div>${mem.nick}</div><!-- 
	--><div>${mem.mpoint}</div>
	</div>
	<div id="wrapper-list">
		<ul id="list"></ul>
	</div><!-- 
	--><div>${pagingHTML}</div>
</body>
</html>