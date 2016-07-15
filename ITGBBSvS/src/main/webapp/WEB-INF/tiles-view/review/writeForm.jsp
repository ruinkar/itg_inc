<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>게시판</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<script>
	$(function() {
	})
</script>
</head>
<body bgcolor="#e0ffff">
	<center>
		<b> 글쓰기 </b><br>
		<!-- onSubmit → submit 버튼 클릭 -->
		<spring:hasBindErrors name="command"/>
		<form:errors path="command"/>
		<form  enctype="multipart/form-data" method="post" name="writeForm" action="writeForm.do"
			onsubmit="return writeSave()"> 
			<!-- hidden -->
			<input type="hidden" name="num" value="${num}"> <input
				type="hidden" name="category" value="2">

			<table width="400" border="1" cellspacing="0" cellpadding="0"
				bgcolor="#e0ffff" align="center">
				<tr>
					<td align="right" colspan="2" bgcolor="#b0e0e6"><a
						href="list.do"> 글목록</a></td>
				</tr>
				<tr>
					<td width="70" bgcolor="#b0e0e6" align="center">이 름</td>
					<td width="330"><input type="text" size="10" maxlength="10"
						name="writer" value="${sessionScope.userLoginInfo.id}"></td>
				</tr>
				<tr>
					<td width="70" bgcolor="#b0e0e6" align="center">제 목</td>
					<td width="330">
						<!-- 신규 게시물 --> <input type="text" size="40" maxlength="50"
						name="title">
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="#b0e0e6" align="center">행사명</td>
					<td width="330">
						<!-- 신규 게시물 --> <input type="text" size="40" maxlength="50"
						name="evtitle"> <input type="hidden" size="40"
						maxlength="50" name="evnum" value="1"> <input
						type="button" value="행사찾기" onClick="eventCheck()">
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="#b0e0e6" align="center">태그</td>
					<td width="330">
						<!-- 신규 게시물 --> 
						<input type="text" size="5" maxlength="5" name="tag1"> 
						<input type="text" size="5" maxlength="5" name="tag2"> 
						<input type="text" size="5" maxlength="5" name="tag3"> 
						<input type="text" size="5" maxlength="5" name="tag4"> 
						<input type="text" size="5" maxlength="5" name="tag5">

					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="#b0e0e6" align="center">점수</td>
					<td width="330"><input type="text" size="8" maxlength="12"
						name="rating"></td>
				</tr>

				<tr>
					<td width="70" bgcolor="#b0e0e6" align="center">내 용</td>
					<td width="330"><textarea name="acontent" rows="13" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td width="70" bgcolor="#b0e0e6" align="center">첨부파일</td>
					<td width="330"><input type="file" name="upload">
						<p></td>
				</tr>
				<tr>
					<td colspan=2 bgcolor="#b0e0e6" align="center"><input
						type="submit" value="글쓰기"> <input type="reset"
						value="다시작성"> <input type="button" value="목록보기"
						OnClick="window.location='list.do'"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>