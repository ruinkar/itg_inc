<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<script>
$(function(){
    $(".DatePicker").datepicker({
        changeMonth : true,
        changeYear : true
    });
});

</script>
</head>
<body>
        <spring:hasBindErrors name="command"/>
        <form:errors path="command"/>
	<form  enctype="multipart/form-data" method="post" name="writeForm" action="eventWrite.do">
	<input type="hidden" size="10" maxlength="10" name="writer" value="${sessionScope.userLoginInfo.id}">
	<div class="form-group">
	<div class="col-xs-8">
	<label for="usr">글 제목</label>
		<input  type="text" class="form-control" id="title" name="title" size="100" title="글 제목 입력" maxlength="50" class="text" />
		</div>
   <div class="col-xs-8">
    <label for="comment">행사명</label>    
        <input class="form-control"  id="ename" type="text" name="ename" size="100" title="행사명 입력" maxlength="50" class="text"/>
        </div>
    
    <div class="col-xs-4">  
    <label for="comment"> 주최자</label> 
        <input class="form-control"  id="host" type="text" name="host" size="20" title="행사주최자 입력" maxlength="10" class="text"/>
        </div>
<div class="col-xs-12">
<label for="comment">글 내용</label>
	<pre>
	<textarea class="form-control"  id="comment" name="acontent" rows="13" cols="60">
	
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
		
		<input class="form-control" id="tag1" type="text" name="tag1" size="20" title="태그1 입력" maxlength="10" class="text"/>
		</div>
        <div class="col-xs-2">
        <input class="form-control" id="tag2" type="text" name="tag2" size="20" title="태그2 입력" maxlength="10" class="text"/>
		</div>
        <div class="col-xs-2">
        <input class="form-control" id="tag3" type="text" name="tag3" size="20" title="태그3 입력" maxlength="10" class="text"/>
		</div>
        <div class="col-xs-2">
        <input class="form-control" id="tag4" type="text" name="tag4" size="20" title="태그4 입력" maxlength="10" class="text"/>
		</div>
        <div class="col-xs-2">
        <input class="form-control" id="tag5" type="text" name="tag5" size="20" title="태그5 입력" maxlength="10" class="text"/>
		</div>
	<div class="col-xs-6">
	<label for="beginStr">시작일</label>    
		<input id="begin" type="text" name="beginStr" size="20" title="행사 시작일 입력" maxlength="20" class="DatePicker form-control"/>
		</div>
		<div class="col-xs-6">
	<label for="endStr">종료일</label>    
		<input  id="end" type="text" name="endStr" size="20" title="행사 종료일 입력" maxlength="20" class="DatePicker form-control"/>
		</div>
	 
	<div class="col-xs-8">
	<label for="location">위치</label>	
		<input class="form-control"  id="location" type="text" name="location" size="20" title="행사 위치 입력" maxlength="20" class="text"/>
		</div>
		<div class="col-xs-4">
		<br>
		<input class="form-control"  type="button" name="searchLocation" value="위치검색" onclick="locCheck()">
		</div>
    <div class="col-xs-6">  
	<label for="upload">이미지 첨부</label>    
		<input class="form-control"  type="file" name="upload">
	</div>
        <input class="form-control"  id="lat" type="hidden" name="lat" size="5" title="위도" maxlength="3" class="text"/>
        <input class="form-control"  id="lng" type="hidden" name="lng" size="5" title="경도" maxlength="3" class="text"/>
    <div class="col-xs-12">  	
    
    <br>
		<input class="btn-default" type="submit" value="글쓰기" >
		<input class="btn-default" type="reset" value="다시작성">
  		<input class="btn-default" type="button" value="목록보기" OnClick="window.location='list.do'">
  		</div>
</div>      

	</form>

</body>
</html>