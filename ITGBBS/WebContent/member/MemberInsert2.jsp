<%@page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c"
          uri="http://java.sun.com/jsp/jstl/core" %>
<HTML>
 <HEAD>
  <TITLE> 회원가입확인 </TITLE>
 </HEAD>

 <BODY bgcolor="#FFFFCC">
  <br><br>
  <center>
  <c:set var="flag" value="${requestScope.flag}"/>
  <c:choose>
    <c:when test="${flag==true}">
    <c:set var="register" value="회원가입을 축하드립니다."/>
       <c:out value="${register}"/><br>
       <a href=Login.do>로그인</a>
	</c:when>
	<c:otherwise>
	<c:set var="Error" value="다시 확인하고 입력요망!"/>
      <c:out value="${Error}"/><br>
       <a href=Register2.do>다시가입</a>
	</c:otherwise>
  </c:choose>
  </center>
 </BODY>
</HTML>
