<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String contextPath = request.getContextPath();
%>

<center>
<ul class="nav nav-pills nav-stacked">
   <li><a href="<%=contextPath%>/evinfo/list.do">행사 정보</a></li>
   <li><a href="<%=contextPath%>/review/list.do">리뷰 정보</a></li> 
   <li><a href="<%=contextPath%>/free/list.do">자유게시판</a></li>
   <li><a href="<%=contextPath%>/rank.do">활동랭킹</a></li>
</ul>
<c:choose>
<c:when test="${not empty sessionScope.userLoginInfo}">
 이름 : ${sessionScope.userLoginInfo.id}<br>
<a href="../login/deleteSession.do">로그아웃</a>       
</c:when>
<c:otherwise>
        <form name="loginForm" method="post"
		action="../login/makeSession.do">
		<table>
			<tr height="40px">
				<td>유저ID</td></tr>
				<tr height="40px">
				<td><input type="text" name="id"></td></tr>
			<tr height="40px">
				<td>패스워드</td></tr>
            <tr height="40px">
            	<td><input type="password" name="password"></td></tr>
		</table>
		<table><tr>
				<td align="center"><input type="submit" value="로그인"></td>
				<td align="center"><input type="reset" value="리셋"></td>
			</tr>
		</table>
		        
	</form>
    </c:otherwise>
</c:choose> 
</center>