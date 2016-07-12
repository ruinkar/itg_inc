<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" 
          uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>회원가입</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<script language="JavaScript" src="prototype.js"></script>
<script language="JavaScript" src="searchWord.js"></script>
</head>
<body bgcolor="#996600" onLoad="regForm.id.focus()">
<br><br>
<table align="center" border="0" cellspacing="0" cellpadding="5" >
  <tr> 
    <td align="center" valign="middle" bgcolor="#FFFFCC"> 
      <table border="1" cellspacing="0" cellpadding="2"  align="center">
        <form name="regForm" method="post" action="RegisterProc2.do">
          <tr align="center" bgcolor="#996600"> 
            <td colspan="3"><font color="#FFFFFF"><b>회원 가입</b></font></td>
          </tr>
          <tr> 
            <td width="16%">아이디</td>
            <td width="57%"> 
	       <input type="text" name="id" size="15" id="id">
		         <input type="button" value="ID중복확인" 
     onClick="idCheck(this.form.id.value)"></td>
            <td id="ducheck" width="27%">아이디를 적어 주세요.</td>
          </tr>
          <tr> 
            <td>패스워드</td>
            <td> <input type="password" name="password" size="15"> </td>
            <td>패스워드를 적어주세요.</td>
          </tr>
          <tr> 
            <td>패스워드 확인</td>
            <td> <input type="password" name="repassword" size="15"> </td>
            <td>패스워드를 확인합니다.</td>
          </tr>
          <tr> 
            <td>이름</td>
            <td> <input type="text" name="name" size="15"> </td>
            <td>고객실명을 적어주세요.</td>
          </tr>
          <tr> 
            <td>닉네임</td>
            <td> <input type="text" name="nick" size="15"> </td>
            <td>닉네임을 적어주세요.</td>
          </tr>
          <tr> 
            <td>이메일</td>
            <td> <input type="text" name="email" size="27"> </td>
            <td>이메일을 적어주세요.</td>
          </tr>
          <tr> 
            <td colspan="3" align="center"> 
             <input type="button" value="회원가입"   onclick="submit()"> 
              &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
             <input type="reset" value="다시쓰기"> 
            </td>
          </tr>
        </form>
      </table>
    </td>
  </tr>
</table>
</body>
</html>
