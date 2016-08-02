<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
$(function(){
	// 시작 날짜와 끝나는 날짜를 지정한다. 여기에서는 30일로 설정하엿다
	// var fmt = "YYYY-MM-DD";
	var fmt = "MM/DD/YYYY";
	console.log($("#begin").val());
	var start_date = moment($("#begin").val(), fmt);
	console.log(start_date);
	
	console.log($("#end").val());
	var end_date = moment($("#end").val(), fmt);
	
	function cb(start, end) {
		$('#reportrange span').html(
				start.format(fmt) + ' - '
						+ end.format(fmt));
		console.log(start.format(fmt));
		console.log($("input[name=beginStr]").val());
		$("input[name=beginStr]").val(start.format(fmt));
		console.log($("input[name=beginStr]").val());
		console.log(end.format(fmt));
		console.log($("input[name=endStr]").val());
		$("input[name=endStr]").val(end.format(fmt));
		console.log($("input[name=endStr]").val());
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
        	focus: true,
        	callbacks: {
        		onBlur: function() {
        			$snote.summernote("destroy");
        		}
        	}
        });
    });
});

</script>
</head>
<body>
	<spring:hasBindErrors name="command"/>
	<form:errors path="command"/>
	<form  enctype="multipart/form-data" method="post" name="writeForm" action="updateForm.do">
	<input type="hidden" size="10" maxlength="10" name="writer" value="${sessionScope.userLoginInfo.id}">
    <input type="hidden" size="10" maxlength="10" name="anum" value="${barticle.anum}">
    <%-- <input type="hidden" size="10" maxlength="10" name="evnum" value="${earticle.evnum}">
    <h4>*글 제목 입력</h4>
        <input id="title" type="text" name="title" size="100" title="글 제목 입력" maxlength="50" class="text" value="${barticle.title}" />
    <h4>*글 내용 입력</h4>
        <pre>
<textarea name="acontent" rows="13" cols="100">
${barticle.acontent}
</textarea>
        </pre>
    <h4>*태그 입력 (필수입력x)</h4>
        <input id="tag1" type="text" name="tag1" size="20" title="태그1 입력" maxlength="10" class="text" value="${barticle.tag1}"/>
        <input id="tag2" type="text" name="tag2" size="20" title="태그2 입력" maxlength="10" class="text" value="${barticle.tag2}"/>
        <input id="tag3" type="text" name="tag3" size="20" title="태그3 입력" maxlength="10" class="text" value="${barticle.tag3}"/>
        <input id="tag4" type="text" name="tag4" size="20" title="태그4 입력" maxlength="10" class="text" value="${barticle.tag4}"/>
        <input id="tag5" type="text" name="tag5" size="20" title="태그5 입력" maxlength="10" class="text" value="${barticle.tag5}"/>
        
    <h4>*행사주최자 입력</h4>
        <input id="host" type="text" name="host" size="20" title="행사주최자 입력" maxlength="10" class="text" value="${earticle.host}"/>
        
    <h4>*행사명 입력</h4>
        <input id="ename" type="text" name="ename" size="100" title="행사명 입력" maxlength="50" class="text" value="${earticle.ename}"/>
        
    <h4>*행사 시작일 입력</h4>
        <input id="beginStr" type="text" name="beginStr" size="20" title="행사 시작일 입력" maxlength="20" class="DatePicker" value="${earticle.beginStr}"/>
        
    <h4>*행사 종료일 입력</h4>
        <input id="endStr" type="text" name="endStr" size="20" title="행사 종료일 입력" maxlength="20" class="DatePicker" value="${earticle.endStr}"/>
        
    <h4>*행사 위치 입력</h4>
        <input id="location" type="text" name="location" size="20" title="행사 위치 입력" maxlength="20" class="text" value="${earticle.location}"/>
        <input type="button" name="searchLocation" value="위치검색" onclick="locCheck()">
    <h4>*행사 이미지 첨부</h4>
        <input type="hidden" name="eimg" value="${earticle.eimg}">
                    <input type="file" name="upload">
                    <c:if test="${!empty earticle.eimg }">
                        (${earticle.eimg })파일이 등록되어 있습니다.<br>
                    </c:if>
        <input id="lat" type="hidden" name="lat" size="5" title="위도" maxlength="3" class="text" value="${earticle.lat}"/>
        <input id="lng" type="hidden" name="lng" size="5" title="경도" maxlength="3" class="text" value="${earticle.lng}"/>
        <input id="lng" type="hidden" name="afile" size="5" title="경도" maxlength="3" class="text" value="${barticle.afile}"/>
        <br><br><br> --%>
    <input type="hidden" size="10" maxlength="10" name="evnum" value="${earticle.evnum}"><!-- 
    
    --><div class="form-group"><!-- 
    
    	글 제목
		--><div class="col-xs-8">
			<label for="usr">글 제목</label> <input type="text" class="form-control"
				id="title" name="title" size="100" title="글 제목 입력" maxlength="50"
				class="text" value="${barticle.title}" />
		</div><!--
		
		행사명
		--><div class="col-xs-8">
			<label for="comment">행사명</label> <input class="form-control"
				id="ename" type="text" name="ename" size="100" title="행사명 입력"
				maxlength="50" class="text" value="${earticle.ename}" />
		</div><!--  
		
		주최자
		--><div class="col-xs-4">
			<label for="comment">행사주최자</label> <input class="form-control"
				id="host" type="text" name="host" size="20" title="행사주최자 입력"
				maxlength="10" class="text" value="${earticle.host}" />
		</div><!--  
		
		행사일정
		--><div class="container col-xs-5">
			<label for="reportrange">행사기간</label>
				<input id="begin" type="text" name="beginStr" value="${earticle.beginStr}" />
				<input id="end" type="text" name="endStr" value="${earticle.endStr}" />
				<div id="reportrange" class="pull-right"
					style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc; width: 100%">
					<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>&nbsp; <span></span>
					<b class="caret"></b>
				</div>
		</div><!--  
		
		글 내용
		--><div class="col-xs-12">
			<label for="comment">글 내용</label>
			<pre><textarea class="form-control" id="comment" name="acontent" rows="13"
					cols="100">${barticle.acontent}</textarea></pre>
		</div><!--  
		
		태그입력
		--><div class="col-xs-2">
			<label for="comment">태그</label>
		</div>
		<div class="col-xs-2">

			<input class="form-control" id="tag1" type="text" name="tag1"
				size="20" title="태그1 입력" maxlength="10" class="text" value="${barticle.tag1}" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag2" type="text" name="tag2"
				size="20" title="태그2 입력" maxlength="10" class="text" value="${barticle.tag2}" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag3" type="text" name="tag3"
				size="20" title="태그3 입력" maxlength="10" class="text" value="${barticle.tag3}" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag4" type="text" name="tag4"
				size="20" title="태그4 입력" maxlength="10" class="text" value="${barticle.tag4}" />
		</div>
		<div class="col-xs-2">
			<input class="form-control" id="tag5" type="text" name="tag5"
				size="20" title="태그5 입력" maxlength="10" class="text" value="${barticle.tag5}" />
		</div><!-- 
		
		행사 위치
		--><div class="col-xs-8">
			<label for="location">위치</label> <input class="form-control"
				id="location" type="text" name="location" size="20" title="행사 위치 입력"
				maxlength="20" class="text" value="${earticle.location}" />
		</div>
		<div class="col-xs-4">
			<br> <input class="form-control" type="button"
				name="searchLocation" value="위치검색" onclick="locCheck()">
		</div>
		<input class="form-control" id="lat" type="hidden" name="lat" size="5"
			title="위도" maxlength="3" class="text" value="${earticle.lat}" />
		<input class="form-control" id="lng" type="hidden" name="lng" size="5"
			title="경도" maxlength="3" class="text" value="${earticle.lng}"/><!--  
		
		행사 이미지
		--><div class="col-xs-6">
			<label for="upload">이미지 첨부</label><!--  
			--><input type="hidden" name="eimg" value="${earticle.eimg}"><!--  
			--><input type="hidden" name="afile" value="${barticle.afile}"><!--  
			--><input class="form-control" type="file" name="upload">
			<c:if test="${!empty earticle.eimg }">(${earticle.eimg })파일이 등록되어 있습니다.<br></c:if>
		</div><!--  
		
		버튼
		--><div class="col-xs-12"><br><br><br>
        <input type="submit" value="수정하기" >
        <input type="button" value="목록보기" OnClick="window.location='list.do'">
        <br><br><br>
        </div>
	</div>
	</form>
</body>
</html>