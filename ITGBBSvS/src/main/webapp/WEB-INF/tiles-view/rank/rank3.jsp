<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>게시판</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<style>
* {
	margin: 0;
	text-decoration: none;
}

tr, div {
	display:block;
}

tr:nth-child(even) {
	background: #123456;
}

tr:nth-child(odd) {
	background: #654321;
}

.line_highrank {
	margin: auto;
	background : #888888;
	text-align: center;
	background: #888888;
}

.line_highrank:nth-child(even) {
	background: #444444;
}

.rank_other {
	margin: auto;
}

.member_high:nth-child(odd) {
	background: #123456;
}

.member_high:nth-child(even) {
	background: #654321;
}

</style>
<script>
	$(function() {
		var line_highrank_css = {
			width : rank.div_rank_width,
			height : rank.height_window / 4
		}

		$(".line_highrank").css(line_highrank_css);
		$(".line_highrank").each();
		$(".rank_other").css('width', rank.div_rank_width);
		$(".member_high").each(rank.high_child);
	});

	var rank = {};
	rank.div_rank_width = $(window).width() * 3 / 5;
	rank.height_window = $(window).height();
	rank.width_th = 250;
	rank.width_temp = $(window).width() / 4;
	rank.width_window = rank.width_th > 250 ? rank.width_temp : rank.width_th;

	rank.high_child = function() {
		$(this).css("float", "left");
		$(this).width($(this.parentNode).width() / 4);
		$(this).height($(this.parentNode).height() );
	};
</script>
</head>
<body bgcolor="#e0ffff">
	<div class="line_highrank">
		<div class="member_high"></div>
	</div>
	<div class="line_highrank">
		<div class="member_high"></div>
		<div class="member_high"></div>
	</div>
	<div class="line_highrank">
		<div class="member_high"></div>
		<div class="member_high"></div>
		<div class="member_high"></div>
	</div>
	<div class="line_highrank">
		<div class="member_high"></div>
		<div class="member_high"></div>
		<div class="member_high"></div>
		<div class="member_high"></div>
	</div>
	<b align="center">랭크(전체 유저 수:${count})</b>
	<table class="rank_other">

		<c:if test="${count == 0}">
			<tr>
				<td align="center">회원이 없습니다.</td>
			</tr>
		</c:if>

		<c:if test="${count > 0}">
			<!-- 실제 레코드를 출력하는 부분(for) -->
			<c:forEach var="member" items="${list}">
				<!-- id name nick email thumbnail mpoint fkey gkey -->

				<tr>
					<td>
						${member.thumbnail} 
						<a href="#">${member.nick}</a>
						${member.thumbnail}
					</td>
				</tr>
			</c:forEach>
		</c:if>

	</table>
</body>
</html>