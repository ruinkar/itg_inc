<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String contextPath = request.getContextPath();
%>
<ul>
	<li><a href="<%=contextPath%>/review/list.do">리뷰보기</a></li>
	<li><a href="<%=contextPath%>/review/writeForm.do">리뷰 쓰기</a></li>
</ul>

<c:choose>
<c:when test="${not empty sessionScope.userLoginInfo}">
          <center>
         이름 : ${sessionScope.userLoginInfo.id}
         <br>
        <a href="login/deleteSession.do">로그아웃</a>
        </center>
    </c:when>

<c:otherwise>
        <form name="loginForm" method="post"
		action="login/makeSession.do">
		        
		<table>
			<tr height="40px">
				                
				<td>유저ID</td>                 
				<td><input type="text" name="id"></td>             
			</tr>
			<tr height="40px">
				<td>패스워드</td>                 
				<td><input type="password" name="password"></td>	            
			</tr>
		</table>
		        
		<table>    
			<tr>
				                
				<td align="center"><input type="submit" value="로그인"></td>
				                
				<td align="center"><input type="reset" value="리셋"></td>
			</tr>
		</table>
		        
	</form>
    </c:otherwise>
</c:choose> 