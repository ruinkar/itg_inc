<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">



</head>

<body bgcolor="#e0ffff">
<jsp:include page="/template/slideMenu.html" flush="false" />
<center>      
<b>글내용 보기</b>
<br>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">  
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">글번호</td>
    <td align="center" width="125" align="center">${article.anum}</td>
    <td align="center" width="125" bgcolor="#b0e0e6">조회수</td>
    <td align="center" width="125" align="center">${article.readcount}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">작성자</td>
    <td align="center" width="125" align="center">${article.writer}</td>
    <td align="center" width="125" bgcolor="#b0e0e6" >작성일</td>
    <td align="center" width="125" align="center">${article.adate}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">글제목</td>
    <td align="center" width="375" align="center" colspan="5">${article.title}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" align="center" bgcolor="#b0e0e6">행사명</td>
    <td align="center" width="125" align="center" colspan="5">${article.evtitle}</td>
  </tr>
  <tr>
<td align="center" width="125" align="center">태그</td>
    <td align="center" width="125" align="center">${article.tag1}</td>
    <td align="center" width="125" align="center">${article.tag2}</td>
    <td align="center" width="125" align="center">${article.tag3}</td>
    <td align="center" width="125" align="center">${article.tag4}</td>
    <td align="center" width="125" align="center">${article.tag5}</td>
                </tr>
                <tr>
<td align="center" width="125" align="center">점수</td>
    <td align="center" width="125" align="center">${article.rating}</td>
                </tr>
  <tr>
  	<!-- <pre>태그 사용 : 웹 상에 불러올 때, 줄바꿈을 만나면 <br>태그로 변환해서 불러오던 메서드 대신  -->
    <td align="center" width="125" bgcolor="#b0e0e6">글내용</td>
    <td align="left" width="375" colspan="5"><pre>${article.acontent}</pre></td>
  </tr>
  <tr height="30">      
    <td colspan="6" bgcolor="#b0e0e6" align="center" > 
	  <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.do?anum=${article.anum}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
	  <input type="button" value="글삭제" 
       onclick="document.location.href='deleteForm.do?anum=${article.anum}&pageNum=${pageNum}'">
	   &nbsp;&nbsp;&nbsp;&nbsp;
       <input type="button" value="글목록" 
       onclick="document.location.href='list.do?pageNum=${pageNum}'">
    </td>
  </tr>
</table>
<br><br><br><br>
<form method="post" name="replyform" action="replyPro.do"
            onsubmit="return writeSave()">
<input type="hidden" name="writer" value="aaa">
  <input type="hidden" name="anum" value="${article.anum}">
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="#e0ffff" align="center">
<c:if test="${replyNum == 0}">
<tr height="30">
<td align="center" width="500" bgcolor="#b0e0e6" colspan="4">덧글이 없습니다.</td>
</tr>
</c:if>
<c:forEach var="reply" items="${repliesList}">
<tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">${reply.writer}</td>
    <td align="left" width="250" colspan="2">${reply.acontent}</td>
  </tr>
</c:forEach>

<tr height="30">
    <td align="center" width="125" bgcolor="#b0e0e6">작성자</td>
    <td align="left" width="250" colspan="2"><textarea name="acontent" rows="13" cols="40"></textarea></td>
    <td align="center" width="125" bgcolor="#b0e0e6"><input type="submit" value="덧글달기"></td>
  </tr>
  </table>
  
</form>
</center>
</body>
</html>