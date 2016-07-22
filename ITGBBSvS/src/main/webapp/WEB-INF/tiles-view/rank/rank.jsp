<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<%-- <?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
</head>
<body>
	<!-- <div id="left">
		<ul>
			<li><a href="rank.do">활동</a></li>
			  --<li><a href="rank.do?rtype=1">평점</a></li>
		</ul>
	</div> --><!-- 
	 --><div id="right">
		<div>
			<c:forEach var="index" begin="1" end="4">
				<div class="stage_top"></div>
			</c:forEach>
			<hr />
			<div class="list-container">
				<ul id="list-group">
				</ul>
			</div>
			<div id="pgbox">${pagingHtml}</div>
		</div>
	</div>
</body>
</html>