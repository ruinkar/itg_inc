<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.0.min.js"></script>

<!-- <script type="text/javascript"
    src="bootstrap-tagsinput-angular.js"></script>
<script type="text/javascript"
    src="bootstrap-tagsinput.js"></script>
<link href="bootstrap-tagsinput.css"rel="stylesheet">
 --><meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="http://okky.kr/assets/application-178a471b205e52821f985abddea1ac34.css" />
<script>
	$(function() {
		$('input').tagsinput('add', 'some tag');
	})
</script>
</head>
<body bgcolor="#e0ffff">
	<div class="layout-container">
		<div class="main ">
			<jsp:include page="/template/slideMenu.html" flush="false" />
			<center>
				<b> 글쓰기 </b><br>
				<!-- onSubmit → submit 버튼 클릭 -->
				<form method="post" name="writeForm" action="writePro.do"
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
								name="writer" value="${writer}"></td>
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
                                <input type="text" value="Amsterdam,Washington,Sydney,Beijing,Cairo" data-role="tagsinput" />
								<input type="text" size="5" maxlength="5" name="tag1">
								<input type="text" size="5" maxlength="5" name="tag1"> 
								<input type="text" size="5" maxlength="5" name="tag2"> 
								<input type="text" size="5" maxlength="5" name="tag3"> 
								<input type="text" size="5" maxlength="5" name="tag4"> 
								<input type="text" size="5" maxlength="5" name="tag5">

							</td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">점수</td>
							<td width="330">
							<input type="text" size="8" maxlength="12" name="rating">
							</td>
						</tr>

						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">내 용</td>
							<td width="330">
							<textarea name="acontent" rows="13" cols="40"></textarea>
							</td>
						</tr>
						<tr>
							<td width="70" bgcolor="#b0e0e6" align="center">첨부파일</td>
							<td width="330"><input type="text" size="20" maxlength="40"
								name="afile"></td>
						</tr>
						<tr>
							<td colspan=2 bgcolor="#b0e0e6" align="center"><input
								type="submit" value="글쓰기"> <input type="reset"
								value="다시작성"> <input type="button" value="목록보기"
								OnClick="window.location='list.do'"></td>
						</tr>
					</table>
				</form>
		</div>
	</div>
</body>
</html>