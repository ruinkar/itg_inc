<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="legacy.model.*"%>

<html>
<head>
<title>게시판</title>
</head>
<body>
	<div class="view_wrap">
		<h3 align="center">${barticle.title}</h3>
		<div class="info_sec">
			<p class="img">
				<a href="http://www.korecabusan.com" target="_blank" title="새창 열림">
					<img src="${earticle.eimg}" width="115px" alt="" />
				</a> 
			</p>
			<div class="txt">
				<dl>
					<h3>주최/주관</h3>
					<dd>${earticle.host}</dd>
					<h3>기간</h3>
					<dd>${earticle.begin}</dd>
					~
					<dd>${earticle.end}</dd>
					<h3>시간</h3>
					<dd>정보없음</dd>
					<h3>장소</h3>
					<dd>${earticle.location}</dd>
					<h3>전화</h3>
					<dd>051-740-8200</dd>
					<h3>팩스</h3>
					<dd>051-740-7640</dd>
					<h3>홈페이지</h3>
					<dd>
						<a href="http://www.korecabusan.com" target="_blank" title="새창 열림">http://www.korecabusan.com&nbsp;</a>
					</dd>
					<h3>관람료</h3>
					<dd>무료</dd>
					<h3>글내용</h3>
					<dd>${barticle.acontent}</dd>
				</dl>
			</div>
		</div>
		<div class="detail_sec">
			
		</div>
	</div>
	<input type="button" value="수정하기" OnClick="" >
	<input type="button" value="목록보기" OnClick="window.location='list.do'">
</body>