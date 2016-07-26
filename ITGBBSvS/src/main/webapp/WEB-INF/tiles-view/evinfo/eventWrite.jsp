<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"> -->
</script>


<script>
$(function(){
	    
	// 시작 날짜와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
	var start_date = moment().subtract(29, 'days');
	var end_date = moment();
	// var fmt = "YYYY-MM-DD";
	var fmt = "MM/DD/YYYY"
	function cb(start, end) {
		$('#reportrange span').html(
				start.format(fmt) + ' - '
						+ end.format(fmt));
		$("input[name=beginStr]").val(start.format(fmt));
		$("input[name=endStr]").val(end.format(fmt));
	}
	cb(start_date, end_date);

	$('#reportrange')
			.daterangepicker(
					{
						ranges : {
							'오늘' : [ moment(), moment() ],
							'어제' : [ moment().subtract(1, 'days'),
										moment().subtract(1, 'days') ],
							'지난 7일' : [ moment().subtract(6, 'days'),
									moment() ],
							'지난 30일' : [ moment().subtract(29, 'days'),
									moment() ],
							'이번 달' : [ moment().startOf('month'),
									moment().endOf('month') ],
							'지난 달' : [
									moment().subtract(1, 'month')
											.startOf('month'),
									moment().subtract(1, 'month')
											.endOf('month') ]
						},
						'startDate' :  start_date,
						'endDate' : end_date
					}, cb);
		
    // summernote on
    var $snote = $("textarea[name=acontent]");
    $snote.on("click", function (){
    	$snote.summernote({
        	focus,
        	callbacks: {
        		onBlur: function() {
        			$snote.summernote("destroy");
        		}
        	}
        });
    });
    
});

</script>

<spring:hasBindErrors name="command" />
<form:errors path="command" />
<form enctype="multipart/form-data" method="post" name="writeForm"
	action="eventWrite.do">
	<input type="hidden" size="10" maxlength="10" name="writer"
		value="${sessionScope.userLoginInfo.id}">
	<div class="form-group">
		<div class="col-xs-8">
			<label for="usr">글 제목</label> <input type="text" class="form-control"
				id="title" name="title" size="100" title="글 제목 입력" maxlength="50"
				class="text" />
		</div>
		<div class="col-xs-8">
			<label for="comment">행사명</label> <input class="form-control"
				id="ename" type="text" name="ename" size="100" title="행사명 입력"
				maxlength="50" class="text" />
		</div>

		<div class="col-xs-4">
			<label for="comment"> 주최자</label> <input class="form-control"
				id="host" type="text" name="host" size="20" title="행사주최자 입력"
				maxlength="10" class="text" />
		</div>
		
		<input id="begin" type="hidden" name="beginStr" />
		<input  id="end" type="hidden" name="endStr" />
		<div class="container col-xs-5">
			<label for="reportrange">행사기간</label>
				<div id="reportrange" class="pull-right"
					style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
					<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp; <span></span>
					<b class="caret"></b>
				</div>
		</div>
		
		<div class="col-xs-12">
			<label for="comment">글 내용</label>
			<pre>
	<textarea class="form-control" id="comment" name="acontent" rows="13"
					cols="60">
	
전화 :
        
팩스 :
       
홈페이지 :
       
관람료 :
       
	</textarea>
</pre>
		</div>
		<div class="col-xs-2">
			<label for="comment">태그</label>
		</div>
		<div class="col-xs-2">

			<input class="form-control" id="tag1" type="text" name="tag1"
				size="20" title="태그1 입력" maxlength="10" class="text" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag2" type="text" name="tag2"
				size="20" title="태그2 입력" maxlength="10" class="text" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag3" type="text" name="tag3"
				size="20" title="태그3 입력" maxlength="10" class="text" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag4" type="text" name="tag4"
				size="20" title="태그4 입력" maxlength="10" class="text" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag5" type="text" name="tag5"
				size="20" title="태그5 입력" maxlength="10" class="text" />
		</div>
		<!-- <div class="col-xs-6">
	<label for="beginStr">시작일</label>    
		<input id="begin" type="text" name="beginStr" size="20" title="행사 시작일 입력" maxlength="20" class="DatePicker form-control"/>
		</div>
		<div class="col-xs-6">
	<label for="endStr">종료일</label>    
		<input  id="end" type="text" name="endStr" size="20" title="행사 종료일 입력" maxlength="20" class="DatePicker form-control"/>
		</div> -->
		
		
		<div class="col-xs-8">
			<label for="location">위치</label> <input class="form-control"
				id="location" type="text" name="location" size="20" title="행사 위치 입력"
				maxlength="20" class="text" />
		</div>
		<div class="col-xs-4">
			<br> <input class="form-control" type="button"
				name="searchLocation" value="위치검색" onclick="locCheck()">
		</div>
		<div class="col-xs-6">
			<label for="upload">이미지 첨부</label> <input class="form-control"
				type="file" name="upload">
		</div>
		<input class="form-control" id="lat" type="hidden" name="lat" size="5"
			title="위도" maxlength="3" class="text" /> <input class="form-control"
			id="lng" type="hidden" name="lng" size="5" title="경도" maxlength="3"
			class="text" />
		<div class="col-xs-12">

			<br> <input class="btn-default" type="submit" value="글쓰기">
			<input class="btn-default" type="reset" value="다시작성"> <input
				class="btn-default" type="button" value="목록보기"
				OnClick="window.location='list.do'">
		</div>
	</div>

</form>
