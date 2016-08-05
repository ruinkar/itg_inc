<!--

================================================== rank~

--><%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%><!--
--><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--
--><%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script>
$(function() {
	// get count, json and parse
	var json_top = JSON.parse('${json_top}');
	var json_page = JSON.parse('${json_page}');
	
	// 초기화
	itg.initRank('${rtype}');
	itg.print(json_top, json_page); // 출력
	
}); // $.ready()
</script>
<div id="right container">
	<div class="row">
		<div class="col-xs-12">
			<c:forEach var="index" begin="1" end="4">
				<div class="stage_top"></div>
			</c:forEach>
		</div>
	</div>
	<div class="row text-center">
		<div class="list-container col-xs-12">
			<ul id="list-group">
			</ul>
		</div>
		<div id="pgbox">${pagingHtml}</div>
	</div>
</div><!--  

================================================== ~rank

-->