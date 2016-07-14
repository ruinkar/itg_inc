<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#e0ffff">
<jsp:include page="../template/slideMenu.html" flush="false" />
<center><b>글수정</b>
<br>
<form method="post" name="writeForm" action="updatePro.do?pageNum=${pageNum}" onsubmit="return writeSave()">
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
                        <input type="hidden" size="40" maxlength="50" name="evnum" value="1">
                        <input type="button" value="행사찾기" onClick="eventCheck()">
                    </td>
                </tr>
                <tr>
                    <td width="70" bgcolor="#b0e0e6" align="center">태그</td>
                    <td width="330">
                        <!-- 신규 게시물 --> 
                        <input type="text" size="5" maxlength="5" name="tag1" value="${article.tag1}"> 
                        <input type="text" size="5" maxlength="5" name="tag2" value="${article.tag1}"> 
                        <input type="text" size="5" maxlength="5" name="tag3" value="${article.tag1}"> 
                        <input type="text" size="5" maxlength="5" name="tag4" value="${article.tag1}"> 
                        <input type="text" size="5" maxlength="5" name="tag5" value="${article.tag1}">

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
                    <td width="330"><input type="text" size="8" maxlength="12"
                        name="afile" value="${article.afile}"></td>
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
</body>
</html>      
