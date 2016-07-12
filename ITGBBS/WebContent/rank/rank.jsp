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

div {text_align:center;  }

#left {top:0; left:0; width:10%; background:purple; position:fixed;}

#left li {margin:auto; width:40%; background:#541F14; list-style:none; }
#left li:nth-child(even) {background:#020304; }

.stage_top {margin:auto; }
/*
.stage_high_rank:nth-child(odd) {background-color:#938172; }
.stage_high_rank:nth-child(even) {background-color:#CC9E61; } */
.cdiv {border-radius:50%; background-size:contain !important;}

.box_top {display:inline-block; position:relative; }

.box_top:nth-child(odd) {background-color:#541F14; }
.box_top:nth-child(even) {background-color:#020304; }
.box_top span {margin:auto; padding:auto; position:absolute; }
.box_top span:first-child {top:0; left:30%; color:gold; text-shadow: 1px 1px white; font-size:25px; }
.box_top span:last-child {bottom:0; color:red; text-shadow: 1px 1px white; font-size:50px; }

#rank_list {margin:auto; background-color:cyan; }
.item_rank_list {color:blue; list-style:none; width:100%; height:100%; background:red; }

.item_rank_list .outer {display: table; width: 100%; height: 100%; }
.item_rank_list .inner {display: table-cell; vertical-align: middle; text-align: center; }
.item_rank_list .centered {position:relative; display:inline-block; width:50%; padding:1em; background:orange; color:white; }

#pages {margin:auto; background-color:gray; }
#pages a,font {top:10px; padding:10px; border:3px solid white; }
#pages a:hover {color:white; background-color:black; }


</style>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="itg.rank.js"></script>
<script>
$(function() {
	// get count, json and parse
	var json_high = JSON.parse('${json_high}');
	var json_others = JSON.parse('${json_others}');
	
	// 초기화
	itg.init('${rtype}');
	itg.print(json_high, json_others); // 출력
	
}); // $.ready()

</script>
</head>
<body>
	<div id="left">
		<ul>
			<!----><li><a href="rank.do">활동</a></li><!--
			  ----><li><a href="rank.do?rtype=rating">평점</a></li>
		</ul>
	</div><!-- 
	 --><div id="right">
		<div>
			<c:forEach var="index" begin="1" end="4">
				<div class="stage_top"></div>
			</c:forEach>
			<hr />
			<div class="list-group">
				<ul id="rank_list">
				</ul>
			</div>
			<div id="paging_block_out">
				<div id="paging_block_mid">
					<div id="pages">${pagingHtml}</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>