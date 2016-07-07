<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>시작페이지</title>
</head>
<body>
	<form name="send" method="post" action="OpenMap.jsp">
		<h1>첫번째 주소 테스트</h1>
		<input type="text" name="address1"> <br>
<!-- 		<h1>두번째 주소 테스트</h1>
		<input type="text" name="address2"> <br> -->
		<input type="button" value="주소 전송" onclick="submit()">
	</form>
</body>
</html>