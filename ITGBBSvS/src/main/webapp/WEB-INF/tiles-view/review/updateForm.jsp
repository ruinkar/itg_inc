<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<<<<<<< HEAD

=======
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#e0ffff">
<jsp:include page="../template/slideMenu.html" flush="false" />
>>>>>>> refs/heads/goombei02
<center><b>글수정</b>
<br>
<spring:hasBindErrors name="command"/>
<form:errors path="command"/>
<form method="post" enctype="multipart/form-data" name="writeForm" 
           action="updateForm.do?anum=${article.anum}&pageNum=${pageNum}" onsubmit="return writeSave()">
<input type="hidden" size="10" maxlength="10" name="anum" value="${article.anum}">
<table width="400" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">
  <tr>
                    
                    <td width="70" bgcolor="#b0e0e6" align="center">이 름</td>
                    <td width="330"><input type="text" size="10" maxlength="10" name="writer" value="${article.writer}"></td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">제 목</td>
                    <td width="330">
                        <!-- 신규 게시물 --> 
                        <input type="text" size="40" maxlength="50"name="title" value="${article.title}">
                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">행사명</td>
                    <td width="330">
                        <!-- 신규 게시물 --> 
                        <input type="text" size="40" maxlength="50" name="evtitle" value="${article.evtitle}"> 
                        <input type="hidden" size="40" maxlength="50" name="evnum" value="${article.evnum}">
                        <input type="button" value="행사찾기" onClick="eventCheck()">
                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">태그</td>
                    <td width="330">
                        <!-- 신규 게시물 --> 
                        <input type="text" size="5" maxlength="5" name="tag1" value="${article.tag1}"> 
                        <input type="text" size="5" maxlength="5" name="tag2" value="${article.tag2}"> 
                        <input type="text" size="5" maxlength="5" name="tag3" value="${article.tag3}"> 
                        <input type="text" size="5" maxlength="5" name="tag4" value="${article.tag4}"> 
                        <input type="text" size="5" maxlength="5" name="tag5" value="${article.tag5}">

                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">점수</td>
                    <td width="330">
                    <input type="text" size="8" maxlength="12" name="rating" value="${article.rating}"></td>
                </tr>

                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">내 용</td> 
                    <td width="330"><textarea name="acontent" rows="13" cols="40">${article.acontent}</textarea>
                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">첨부파일</td>
                    <td width="330">
                    <input type="hidden" name="afile" value="${article.afile}">
                    <input type="file" name="upload">
				    <c:if test="${!empty article.afile }">
				        (${article.afile })파일이 등록되어 있습니다.<br>
				    </c:if>
    
                </tr>
  <tr>      
   <td colspan=2 bgcolor="#b0e0e6" align="center"> 
     <input type="submit" value="글수정" >
     <input type="reset" value="다시작성">
     <input type="button" value="목록보기" 
       onclick="document.location.href='list.do?pageNum=${pageNum}'">
   </td>
 </tr>
 </table>
</form>     
  
