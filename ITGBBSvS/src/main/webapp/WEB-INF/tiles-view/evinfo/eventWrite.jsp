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
	<input type="text" size="10" maxlength="10" name="writer" value="${sessionScope.userLoginInfo.id}">
	<h4>*글 제목 입력</h4>
		<input id="title" type="text" name="title" size="100" title="글 제목 입력" maxlength="50" class="text" />
	<h4>*글 내용 입력</h4>
	<pre>
	<textarea name="acontent" rows="13" cols="60">
	
전화 :
        
팩스 :
       
홈페이지 :
       
관람료 :
       
	</textarea>
</pre>	   
	<h4>*태그 입력 (필수입력x)</h4>
		<input id="tag1" type="text" name="tag1" size="20" title="태그1 입력" maxlength="10" class="text"/>
		<input id="tag2" type="text" name="tag2" size="20" title="태그2 입력" maxlength="10" class="text"/>
		<input id="tag3" type="text" name="tag3" size="20" title="태그3 입력" maxlength="10" class="text"/>
		<input id="tag4" type="text" name="tag4" size="20" title="태그4 입력" maxlength="10" class="text"/>
		<input id="tag5" type="text" name="tag5" size="20" title="태그5 입력" maxlength="10" class="text"/>
		
	<h4>*행사주최자 입력</h4>
		<input id="host" type="text" name="host" size="20" title="행사주최자 입력" maxlength="10" class="text"/>
		
	<h4>*행사명 입력</h4>
		<input id="ename" type="text" name="ename" size="100" title="행사명 입력" maxlength="50" class="text"/>
		
	<h4>*행사 시작일 입력</h4>
		<input id="begin" type="text" name="beginStr" size="20" title="행사 시작일 입력" maxlength="20" class="DatePicker"/>
		
	<h4>*행사 종료일 입력</h4>
		<input id="end" type="text" name="endStr" size="20" title="행사 종료일 입력" maxlength="20" class="DatePicker"/>
		
	<h4>*행사 위치 입력</h4>
		<input id="location" type="text" name="location" size="20" title="행사 위치 입력" maxlength="20" class="text"/>
		<input type="button" name="searchLocation" value="위치검색" onclick="locCheck()">
	<h4>*행사 이미지 첨부</h4>
		<input type="file" name="upload">
	
        <input id="lat" type="hidden" name="lat" size="5" title="위도" maxlength="3" class="text"/>
        <input id="lng" type="hidden" name="lng" size="5" title="경도" maxlength="3" class="text"/>
    	
		<input type="submit" value="글쓰기" >
		<input type="reset" value="다시작성">
  		<input type="button" value="목록보기" OnClick="window.location='list.do'">
	</form>

</body>
</html>