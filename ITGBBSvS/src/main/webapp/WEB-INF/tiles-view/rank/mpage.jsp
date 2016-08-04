<!--

================================================== memberInfo~

--><%@ page language="java" contentType="text/html; charset=UTF-8"
    	pageEncoding="UTF-8"%><!--  
--><%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
*{margin:0; padding:0; list-style:none; }
#wrapper-list {margin:auto; }
</style>
<script>
$(function() {
	var json_page = JSON.parse('${json_page}');
	itg.mpage.init("${mem.id}");
	itg.mpage.print(json_page);
});
</script>
<div><!--
	--><div id="thumbnail_box" style="width:150px; height:150px;"></div><!--
	--><div id="nick_box">${mem.nick}</div><!-- 
	--><div id="mpoint_box">${mem.mpoint}</div>
</div>
<div id="list-container">
	<ul id="list"></ul>
</div><!-- 
--><div id="pgbox">${pagingHtml}</div><!--  

================================================== ~memberInfo

-->