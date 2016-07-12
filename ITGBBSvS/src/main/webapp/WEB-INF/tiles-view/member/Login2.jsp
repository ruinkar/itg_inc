<%@page contentType="text/html;charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 
 로그인전 ->로그인창
 로그인후 ->로그인해서 들어가 있는 모습
-->
<html>
<head>
<title>Simple LogIn</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="prototype.js"></script>
<script language="JavaScript" src="script.js"></script>
</head>
<body bgcolor="#996600" topmargin="100">
<center>
<br><br><br>


<c:if test="${!empty id}">
<b><c:out value="${id}"/></b>님 환영합니다.<p>
제한된 기능을 사용할 수 가 있습니다.<p>
<a href="MemberUpdate2.do?id=${id}">회원수정</a>
<a href="DelCheckForm2.do?id=${id}">회원탈퇴</a>
<a href="Logout2.do">로그아웃</a>
</c:if>


<c:if test="${empty id}">
<table width="75%" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#660000" bgcolor="#FFFF99">
  <tr bordercolor="#FFFF99"> 
    <td height="190" colspan="7"> 
	   <form name="login" method="post" action="LoginProc.do">
        <table width="50%" border="1" align="center" cellspacing="0" cellpadding="0">
          <tr bordercolor="#FFFF66"> 
            <td colspan="2"><div align="center">Log in</div></td>
          </tr>
          <tr > 
            <td width="47%"><div align="center">ID</div></td>
            <td width="53%"><div align="center"> 
                <input type="text" name="id">
              </div></td>
          </tr>
          <tr> 
            <td><div align="center">Password</div></td>
            <td><div align="center"> 
                <input type="password" name="password">
              </div></td>
          </tr>
          <tr> 
            <td colspan="2"><div align="center"> 
                <input type="submit" value="로그인">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input type="button" value="회원가입"
				onclick="memberReg()">
              </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</c:if>
</center>
</body>
</html>