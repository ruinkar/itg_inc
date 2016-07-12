<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"
          uri="http://java.sun.com/jsp/jstl/core"%>
          
<c:set var="loginCheck" value="${requestScope.loginCheck}"/>
  <c:choose>
    <c:when test="${loginCheck==true}">
    <c:set var="idKey" value="${requestScope.id}" scope="session"/>
    <meta http-equiv="Refresh" 
             content="0;url=/ITGBBS/member/Login2.do">
	</c:when>
	<c:otherwise>
	<meta http-equiv="Refresh" 
             content="0;url=/ITGBBS/member/LogError.do">
	</c:otherwise>
  </c:choose>