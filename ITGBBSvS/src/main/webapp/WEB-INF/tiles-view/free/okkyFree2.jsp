<%-- <%@page import="org.apache.jasper.tagplugins.jstl.core.If"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- okky 자유게시판 레이아웃(http://okky.kr/articles/community) -->


<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="ko" class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="http://okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="http://okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="http://okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
<!-- <link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet"> -->
<meta property="og:image"
	content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">

<link rel="stylesheet"
	href="http://okky.kr/assets/application-178a471b205e52821f985abddea1ac34.css" />

<!--[if lt IE 9]>
            <script src="http://okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
        <![endif]-->


<meta name="layout" content="main">


</head>
<body>
	<div class="layout-container">
		<div class="main ">

			<div id="list-article" class="content scaffold-list" role="main">
				<div class="nav" role="navigation">
					<a href="writeForm.do"
						class="create btn btn-success btn-wide pull-right"><i
						class="fa fa-pencil"></i>새 글 쓰기</a>

					<!-- 					<form action="/writeForm.do?writer='hhh'">
					<i class="fa fa-pencil"><input type="submit" value="새 글 쓰기"/></i></form> -->


					<div class="category-filter-wrapper">
						<form action="/articles/community" method="get"
							name="category-filter-form" id="category-filter-form">
							<div class="category-filter-query pull-right">
								<div class="input-group input-group-sm">
									<input type="search" name="query" class="form-control"
										placeholder="검색어" value="" /> <span class="input-group-btn">
										<button type="submit" class="btn btn-default">
											<i class="fa fa-search"></i>
										</button>

									</span>
								</div>
							</div>
							<ul class="list-sort pull-left">
								<li><a href="/articles/community?sort=id&amp;order=desc"
									data-sort="id" data-order="desc"
									class="category-sort-link active">최신순</a></li>
								<li><a
									href="/articles/community?sort=voteCount&amp;order=desc"
									data-sort="voteCount" data-order="desc"
									class="category-sort-link ">추천순</a></li>
								<li><a
									href="/articles/community?sort=noteCount&amp;order=desc"
									data-sort="noteCount" data-order="desc"
									class="category-sort-link ">댓글순</a></li>
								<li><a
									href="/articles/community?sort=scrapCount&amp;order=desc"
									data-sort="scrapCount" data-order="desc"
									class="category-sort-link ">스크랩순</a></li>
								<li><a
									href="/articles/community?sort=viewCount&amp;order=desc"
									data-sort="viewCount" data-order="desc"
									class="category-sort-link ">조회순</a></li>
							</ul>
							<input type="hidden" name="sort" id="category-sort-input"
								value="id" /> <input type="hidden" name="order"
								id="category-order-input" value="desc" />
						</form>
					</div>

				</div>
				<div class="panel panel-default">

					<!-- Table -->

					<ul class="list-group">


						<c:if test="${count==0}">
							<li class="list-group-item  list-group-no-note clearfix">

								<div class="list-title-wrapper clearfix">

									<h5 class="list-group-item-heading ">
										<a href="/ITGBBS/free/okkyFreeArticle.jsp">게시판에 저장된 글이
											없습니다.</a>
									</h5>
								</div>
							</li>

						</c:if>
						<c:if test="${count > 0}">
							<c:forEach var="article" items="${list}">

								<li class="list-group-item  list-group-no-note clearfix">

									<div class="list-title-wrapper clearfix">
										<div class="list-tag clearfix">
											<span class="list-group-item-text article-id"><!--
											--><c:out value="#${article.anum}" /><c:set var="number" value="${article.anum}" />
											</span> <a href="#" class="list-group-item-text item-tag label label-info">
											<i class="fa fa-comments"></i>${article.tag1}</a>
										</div>

										<h5 class="list-group-item-heading ">
											<a href="content.do?anum=${article.anum}">${article.title}</a>
										</h5>
									</div>

									<div class="list-summary-wrapper clearfix">

										<div class="list-group-item-summary clearfix">
											<ul>
												<li class="item-icon-disabled"><i
													class="item-icon fa fa-comment "></i> 0</li>
												<li class="item-icon-disabled"><i
													class="item-icon fa fa-thumbs-up"></i> 0</li>
												<li class=""><i class="item-icon fa fa-eye"></i>${article.readcount}</li>
											</ul>
										</div>

									</div>

									<div class="list-group-item-author clearfix">
										<div class='avatar avatar-list clearfix '>
											<a href="${pageContext.request.contextPath}/memberInfo.do?id=${article.writer}" class='avatar-photo'><img
												src="itgUtil.imgCheck(${article.writer}, 40})" /></a>
											<div class="avatar-info">
												<a class="nickname" href="${pageContext.request.contextPath}/memberInfo.do?id=${article.writer}">${article.writer}</a>
												<div class="activity">
													<span class="fa fa-flash"></span> 293
												</div>
												<div class="date-created timeago"
													title="2016-06-27 11:54:27.0">${article.adate}</div>
											</div>
										</div>
									</div>
								</li>
							</c:forEach>
						</c:if>
					</ul>
				</div>


				<div class="text-center">

					<ul class="pagination pagination-sm">${pagingHtml}</ul>

				</div>
			</div>


		</div>
	</div>
	
	<script
		src="http://okky.kr/assets/application-196466c60cf4e718162e141a5acdf612.js"
		type="text/javascript"></script>
	<script
		src="http://okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js"
		type="text/javascript"></script>


	<script>
		$(function() {
			$('.category-sort-link').click(function(e) {
				$('#category-sort-input').val($(this).data('sort'));
				$('#category-order-input').val($(this).data('order'));
				e.preventDefault();
				$('#category-filter-form')[0].submit();
			});
		});
	</script>

</body>
</html>
