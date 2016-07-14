<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
// int count = (Integer)request.getAttribute("count");
// → ${count}
%>
<html>
<head>
<title>후기 게시판</title>

<style>
/* * { margin:0px; padding:0px; } */
/* Animation Canvas */
.animation_canvas {
	overflow: hidden;
	position: relative;
	width: 900px;
	height: 400px;
}
.top_pannel{
    overflow: hidden;
    width: 900px;
    height: 400px;
}
.top1st {
	width: 900px;
	height: 400px;
}

.top_text{
    position: absolute;
    top: 30%;
    left: 30%;
    color:gold;
}
/* Slider Panel */
.slider_panel {
	width: 2700px;
	position: relative;
}

.slider_image {
	float: left;
	width: 300px;
	height: 200px;
}

/* Slider Text Panel */
.slider_text_panel {
	position: absolute;
	top: 200px;
	left: 50px;
}

.slider_text {
	position: absolute;
	width: 250px;
	height: 150px;
}

/* Control Panel */
.control_panel {
	position: absolute;
	top: 350px;
	left: 427px;
	height: 13px;
	overflow: hidden;
}

.control_button {
	width: 15px;
	height: 46px;
	position: relative;
	float: left;
	cursor: pointer;
	background: url('/ITGBBSvS/resources/img/point_button.png');
}

.control_button:hover {
	top: -16px;
}

.control_button.active {
	top: -31px;
}
</style>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script>
         $(document).ready(function () {
            // 슬라이더를 움직여주는 함수
            function moveSlider(index) {
                // 슬라이더를 이동합니다.
                var willMoveLeft = -(index * 900);
                $('.slider_panel').animate({ left: willMoveLeft }, 'slow');
                $('.slider_text_panel').animate({ left: willMoveLeft }, 'slow');
                // control_button에 active클래스를 부여/제거합니다.
                $('.control_button[data-index=' + index + ']').addClass('active');
                $('.control_button[data-index!=' + index + ']').removeClass('active');
            }

            // 초기 텍스트 위치 지정 및 data-index 할당
            $('.slider_text').each(function (index) {
                $(this).attr('data-index', index).css('left', index*300);
            });

            // 컨트롤 버튼의 클릭 핸들러 지정 및 data-index 할당
            $('.control_button').each(function (index) {
                $(this).attr('data-index', index);
            }).click(function () {
                var index = $(this).attr('data-index');
                moveSlider(index);
            });
            // 초기 슬라이더 위치 지정
            var randomNumber = Math.round(Math.random() * 1);
            moveSlider(randomNumber);
        }); 
    </script>
        
</head>
<body bgcolor="#e0ffff">
	<center>
		<c:if test="${count > 0}">
			<div class="top_pannel">
				<a class="top1st"
					href="content.do?anum=${firstRank.anum}&pageNum=${currentPage}">
					<img src="${firstRank.afile}" class="top1st" />
					<div class="top_text">
					<h1>${firstRank.title }</h1>
					<p>${firstRank.acontent}</p>
					</div>
				</a>
			</div>
		</c:if>
		<c:if test="${count > 1}">
			<div class="animation_canvas">
				<div class="slider_panel">
					<c:forEach var="ranklist" items="${otherRank}">
						<a href="content.do?anum=${ranklist.anum}&pageNum=${currentPage}">
							<img src="${ranklist.afile}" class="slider_image" />
						</a>
					</c:forEach>
				</div>
				<div class="slider_text_panel">
					<c:forEach var="ranklist" items="${otherRank}">

						<a href="content.do?anum=${ranklist.anum}&pageNum=${currentPage}">
							<div class="slider_text">
								<h1>${ranklist.title}</h1>
								<p>${ranklist.acontent}</p>
							</div>
						</a>
					</c:forEach>

				</div>

				<div class="control_panel">
					<c:forEach var="i" begin="1" end="${makeControlBoxCount}">
						<div class="control_button"></div>
					</c:forEach>
				</div>
			</div>
		</c:if> 
		<b>글목록(전체 글:${count})</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="#b0e0e6"><a href="writeForm.do">글쓰기</a>
				</td>
		</table>
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">

			<c:if test="${count == 0}">
				<tr>
					<td align="center">게시물이 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${count > 0}">
				<tr height="30" bgcolor="#b0e0e6">
					<td align="center" width="50">번 호</td>
					<td align="center" width="250">제 목</td>
					<td align="center" width="100">작성자</td>
					<td align="center" width="150">작성일</td>
					<td align="center" width="50">조 회</td>
					<td align="center" width="100">IP</td>
				</tr>

				<!-- 실제 레코드를 출력하는 부분(for) -->
				<c:forEach var="article" items="${articleList}">

					<tr height="30">
						<td align="center" width="50">
							<%--=article.getNum() --%>${article.anum}</td>
						<td width="250"><a
							href="content.do?anum=${article.anum}&pageNum=${currentPage}">
								${article.title}</a></td>

						<td align="center" width="100">${article.writer}</td>
						<td align="center" width="150"><fmt:formatDate
								value="${article.adate}" pattern="yyyy-MM-dd HH:mm" /></td>
						<td align="center" width="50">${article.readcount}</td>
						<td align="center" width="100">${article.ip}</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 페이징 처리 -->
		${pagingHtml }
<%-- 
		<c:if test="${startPage>blockSize}">
			<a
				href="list.do?pageNum=${startPage-blockSize}&search=${search}&searchtext=${searchtext}">[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a
				href="list.do?pageNum=${i}&search=${search}&searchtext=${searchtext}">
				<c:if test="${currentPage==i}">
					<font color="red"><b> [${i}]</b></font>
				</c:if> <c:if test="${currentPage!=i}">
					<b>[${i}]</b>
				</c:if>
			</a>

		</c:forEach>
		<c:if test="${endPage<pageCount}">
			<a
				href="list.do?pageNum=${startPage+blockSize}&search=${search}&searchtext=${searchtext}">[다음]</a>
		</c:if> --%>
		<!-- 검색어를 추가 -->
		<p>
		<form action="list.do" name="search">
			<select name="keyField">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="all">제목+내용</option>
				<option value="writer">작성자</option>
			</select> 
			<input type="text" name="keyWord" size="15">&nbsp; 
			<input type="submit" value="검색">
		</form>
		<p>
	</center>
</body>
</html>