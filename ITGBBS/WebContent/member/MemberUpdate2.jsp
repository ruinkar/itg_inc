<%@ page contentType="text/html;charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="member.*,model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원수정</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<script language="JavaScript" src="prototype.js"></script>
<script language="JavaScript" src="searchWord.js"></script>
</head>
<body bgcolor="#996600">
	<br>
	<br>
	<table align="center" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center" valign="middle" bgcolor="#FFFFCC">
				<table border="1" cellspacing="0" cellpadding="2" align="center">
					<form name="regForm" method="post" action="MemberUpdateProc2.do">
						<tr align="center" bgcolor="#996600">
							<td colspan="3"><font color="#FFFFFF"><b>회원 수정</b></font></td>
						</tr>
						<tr>
							<td width="16%">아이디</td>
							<td width="57%">${id}</td>
						</tr>
						<tr>
							<td>패스워드</td>
							<td><input type="password" name="password" size="15">
							</td>
						</tr>
						<tr>
							<td>패스워드 확인</td>
							<td><input type="password" name="repassword" size="15">
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" size="15"
								value="${mto.name}"></td>
						</tr>
						<tr>
							<td>닉네임</td>
							<td><input type="text" name="nick" size="15"
								value="${mto.nick}"></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="text" name="email" size="27"
								value="${mto.email}"></td>
						</tr>
						<tr>
							<td colspan="3" align="center"><input type="button"
								value="회원수정" onclick="submit()"> &nbsp; &nbsp; &nbsp;
								&nbsp; &nbsp; &nbsp; <input type="reset" value="다시쓰기"></td>
						</tr>
					</form>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
