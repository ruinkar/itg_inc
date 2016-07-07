<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%-- <?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>rank</title>
<style>
* {margin:0; padding:0; border-style:none; border:0; text-decoration:none; text-align:center; }

div {text_align:center; }
.stage_top {margin:auto; }
/*
.stage_high_rank:nth-child(odd) {background-color:#938172; }
.stage_high_rank:nth-child(even) {background-color:#CC9E61; } */

.box_top {display:inline-block; border-radius:50%; background:url("/img/korail.jpg");}
.box_top:nth-child(odd) {background-color:#541F14; }
.box_top:nth-child(even) {background-color:#020304; }
.box_top div:first-child {color:gold; }
.box_top div:last-child {color:silver; }

#rank_list {margin:auto; background-color:cyan; }
.item_rank_list {color:blue; list-style:none; }

#pages {margin:auto; background-color:gray; }
#pages a,font {padding:10px; border:3px solid white; }
#pages a:hover {color:white; background-color:black;  }
</style>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="itg.rank.js"></script>
<script>
$(function() {
	// get count, json and parse
	var json_others = JSON.parse('${json_others}');
	
	// 초기화
	itg.init();
	itg.print(json_high, json_others); // 출력
	
}); // $.ready()

</script>
</head>
<body>
	<c:set var="num" value="0"/>
	<c:forEach var="index" begin="0" end="3">
		<div class="stage_top">
			<c:forEach var="member" items="${list}" begin="${num}" end="${num + index - 1}">
				<div class="box_top" onclick="itg.stage_top.lnsr()">
					<div>${member.nick}</div>
					<div>${member.mpoint}</div>
				</div>			
			</c:forEach>
		</div>
	</c:forEach>
	<hr/>
	<div class="list-group">
		<ul id="rank_list">
		</ul>
	</div>
	<div id="pages">${pagingHtml}</div>
</body>
</html>