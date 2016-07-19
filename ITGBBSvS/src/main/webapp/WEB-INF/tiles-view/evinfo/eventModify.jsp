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
        <form  enctype="multipart/form-data" method="post" name="writeForm" action="updateForm.do">
	<input type="hidden" size="10" maxlength="10" name="writer" value="${sessionScope.userLoginInfo.id}">
    <input type="hidden" size="10" maxlength="10" name="anum" value="${barticle.anum}">
    <input type="hidden" size="10" maxlength="10" name="evnum" value="${earticle.evnum}">
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
        <br><br><br>
        <input type="submit" value="수정하기" >
        <input type="button" value="목록보기" OnClick="window.location='list.do'">
        <br><br><br>
	</form>

</body>
</html>