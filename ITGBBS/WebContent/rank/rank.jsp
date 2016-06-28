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

#rank_list {margin:auto; border:0; background-color:cyan; }
.line_rank_list {color:blue; }
.line_rank_list:nth-child(odd) td {text-align:left; }
.line_rank_list:nth-child(even) td {text-align:right; }


</style>
<script src="http://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(function() {
	// 초기화
	itg.init();
	
	// 각각 출력
	itg.stage_top.print();
	itg.rank_list.print();
	
}); // $.ready()

var itg = {
	back_width: 600,
	back_height: 150,
	list_item_height: 50,
	stage_top: {}, // 상위 랭크
	rank_list: {}, // 나머지 랭크 페이지
	pages: {}
};

itg.getSizeBG = function() {
	var h = $(window).height();
	
	var	htemp = h / 4;
	this.back_height = htemp > this.back_height ? htemp : this.back_height;
	
	// var wtemp = this.back_height * 4;
	var wtemp = h;
	this.back_width = wtemp > this.back_width ? wtemp : this.back_width;
	
	var litemp = h / 11;
	this.list_item_height = litemp > this.list_item_height ? litemp : this.list_item_height;
}

// 초기화
itg.init = function() {
	itg.stage_top.$stage = $(".stage_top");
	itg.rank_list.$rank_list = $("#rank_list");
	
	this.getSizeBG();
	
	this.stage_top.init();
	this.rank_list.init();
}

// 상위 랭크 표시화면 초기 설정
itg.stage_top.init = function() {
	
	console.log(this);
	// 상위 랭크 표시화면 사이즈 지정
	itg.stage_top.$stage.css({
		width: itg.back_width,
		height: itg.back_height
	});
	
	// 상위 랭크 개별 항목 동적 삽입
	this.$stage.each(function(index){
		var $this = $(this);
		
		for(var i = 0; i <= index; i++) {
			var box = document.createElement("div");
			var $box = $(box);
			
			$box.addClass("box_top");
			$box.css({
				width: itg.back_height,
				height: $this.height()
			});
			$this.append(box);
		}
	});
}; // stage_top.init()

// 상위 랭크 json to view
itg.stage_top.print = function() {
	// 상위 랭크 리스트 표시
	var json_high = JSON.parse('${json_high}');
	var $box = $(".box_top");
	
	$(json_high).each(function(index){
		$box.eq(index).text(this.id);
	});
}; // itg.stage_top.print()

// 나머지 랭크 표시화면 초기설정
itg.rank_list.init = function() {
	// 기타 랭크 표시화면 사이즈 지정
	this.$rank_list.css({
		width: itg.back_width
	});
}; // itg.rank_list.init()

// 나머지 랭크 json to view
itg.rank_list.print = function() {
	// 나머지 랭크 리스트 표시
	var json_others = JSON.parse('${json_others}');
	var $tr = $(".item_rank_list");
	
	$(json_others).each(function(){
		var tr = document.createElement("tr"); 
		var $tr = $(tr);
		var td = document.createElement("td");
		var $td = $(td);
		
		$tr.css({
			height: itg.list_item_height
		});
		
		$tr.addClass("line_rank_list");
		$td.addClass("item.rank_list");
		$td.text(this.id);
		
		$tr.append(td);
		itg.rank_list.$rank_list.append(tr);
	});
} // itg.rank_list.print()

itg.pages.getPage = function() {
	console.log(${count});
}
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