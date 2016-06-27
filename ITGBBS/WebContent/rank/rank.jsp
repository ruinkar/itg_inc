<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#e0ffff">
<b>랭크(전체 유저 수:${count})</b>
<table border="1" width="400">

<c:if test="${count == 0}">
	<tr>
		<th align = "center">
		회원이 없습니다.
		</th>
	</tr>
</c:if>

<c:if test="${count > 0}"> 
  <tr height="30" bgcolor="#b0e0e6">
    <!-- id name nick email thumbnail mpoint fkey gkey -->
    <td align="center"  width="50"  >프로필 이미지</td> 
    <td align="center"  width="250" >닉네임</td> 
    <td align="center"  width="100" >mpoint</td>
  </tr>
  
<!-- 실제 레코드를 출력하는 부분(for) -->
  <c:forEach var="member" items="${list}">
    
   <tr height="30" onmouseover="this.style.backgorundColor='while'" onmouseout="this.style.backgroundColor='#e0ffff'">
    <td align="center"  width="50" >${member.thumbnail}</td>
    <td  width="250" >
	
    <a href="content.do?num=${member.nick}&pageNum=${currentPage}">
    ${member.nick}</a>
    
    <td align="center"  width="50" >${member.thumbnail}</td>
    <td  width="250" >
   </tr>
  </c:forEach>
</c:if>

</table>
</body>
</html>