<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
// int count = (Integer)request.getAttribute("count");
// → ${count}
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#e0ffff">
<center><b>글목록(전체 글:${count})</b>
<table width="700">
<tr>
  <td align="right" bgcolor="#b0e0e6">
  <a href="writeForm.do">글쓰기</a>
  </td>
</table>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">

<c:if test="${count == 0}">
	<tr>
		<td align = "center">
		게시물이 없습니다.
		</td>
	</tr>
</c:if>

<c:if test="${count > 0}"> 
  <tr height="30" bgcolor="#b0e0e6"> 
   <td align="center"  width="50"  >번 호</td> 
   <td align="center"  width="250" >제   목</td> 
   <td align="center"  width="100" >작성자</td>
   <td align="center"  width="150" >작성일</td> 
   <td align="center"  width="50" >조 회</td> 
   <td align="center"  width="100" >IP</td>
  </tr>
  
<!-- 실제 레코드를 출력하는 부분(for) -->
  <c:forEach var="article" items="${articleList}">
    
   <tr height="30">
    <td align="center"  width="50" ><%--=article.getNum() --%>${article.num}</td>
    <td  width="250" >
    
	<c:if test="${article.re_level > 0}"><!-- 답변글 -->
	  <c:set var="wid" value="${7 * article.re_level}"/> <!-- 7, 14, 21, 28 -->
	  <img src="images/level.gif" width="<%--=wid --%>${wid}" height="16">
	  <img src="images/re.gif">
	</c:if>
	
	<c:if test="${article.re_level == 0}">
	  <img src="images/level.gif" width="${wid}<%--=wid --%>" height="16">
	</c:if>
	
    <a href="content.do?num=${article.num}&pageNum=${currentPage}">
    ${article.subject}</a>
    
    <c:if test="${article.readcount > 20}">
      <img src="images/hot.gif" border="0"  height="16"> 
    </c:if>
    </td>
    
    <td align="center"  width="100">
      <a href="mailto:${article.email}">${article.writer}</a></td>
    <td align="center"  width="150">
      <fmt:formatDate value="${article.reg_date}" pattern="yyyy-MM-dd HH:mm"/>
    </td>
    <td align="center"  width="50">${article.readcount}</td>
    <td align="center" width="100" >${article.ip}</td>
   </tr>
  </c:forEach>
</c:if>

</table>

<c:if test="${count > 0}">
  <!-- <c:set var="startPage" value="${(currentPage - 1) / blockSize * blocksize + 1}"/> -->
  <fmt:parseNumber var="result" value="${(currentPage - 1) / blockSize}" integerOnly="true"/>
  <c:set var="startPage" value="${result * blockSize + 1}"/>
  <c:set var="endPage" value="${startPage + blockSize - 1}"/>
  <c:set var="endPage" value="${endPage>pageCount ? pageCount : endPage}"/>
  <!-- 이전 블럭 → 11 → 10 -->
  <c:if test="${startPage>blockSize}">
	<a href="list.do?pageNum=${startPage - blockSize}">[이전]</a>
	<!-- [이전] 11 12 13...20 -->
  </c:if>
  <!-- 현재 블럭 -->
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
	<a href="list.do?pageNum=${i}">[${i}]</a>
  </c:forEach>
	
  <c:if test="${endPage<pageCount}">
	<a href="list.do?pageNum=${startPage + blockSize}">[다음]</a>
  </c:if>
  
</c:if>

</center>
</body>
</html>