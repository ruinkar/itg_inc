<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c"
          uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Simple LogIn</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#5d2c96" topmargin="100">
<center>
<c:set var="error" value="로그인에 실패하셨습니다.!"/>
<b><c:out value="${error}"/><p>
<c:set var="identify" 
      value="아이디 및 비밀번호를 다시 확인하시기 바랍니다."/>
<c:out value="${identify}"/><p></b> 
<input type="button" value="다시쓰기" 
 onclick="history.back()">
</center>
</body>
</html>