<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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

.box_top {color:white; display:inline-block; }
.box_top:nth-child(odd) {background-color:#541F14; }
.box_top:nth-child(even) {background-color:#020304; }

#rank_list {margin:auto; background-color:cyan; }
.line_rank_list {color:blue; }
.line_rank_list:nth-child(odd) td {text-align:left; }
.line_rank_list:nth-child(even) td {text-align:right; }

#pages {margin:auto; background-color:gray; }
</style>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script src="itg.rank.js"></script>
<script>
$(function() {
	// get count, json and parse
	var count = ${count}
	var json_high = JSON.parse('${json_high}');
	var json_others = JSON.parse('${json_others}');
	
	// 초기화
	itg.init();
	itg.pages.getPage(count); // 페이징 작업 객체에 회원 수 입력
	itg.print(json_high, json_others); // 출력
	
}); // $.ready()

</script>
</head>
<body>
	<div class="stage_top">
	</div>
	<div class="stage_top">
	</div>
	<div class="stage_top">
	</div>
	<div class="stage_top">
	</div>
	<hr/>
	<table id="rank_list"></table>
	<div id="pages"></div>
</body>
</html>