
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
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
<title>OKKY - 커뮤니티</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="http://okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="http://okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="http://okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet">
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




			<!-- <div class="test1"> -->
			<div class="sidebar sidebar-category"
				style="background-color: #5d2c96">

				<a href="javascript://" class="sidebar-header"> <i
					class="fa fa-bars sidebar-header-icon"></i>
				</a>

				<h1>
					<div class="logo">
						<a href="/ITGBBS/free/list.do"><img
							src="http://okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png"
							alt="OKKY" title="OKKY" /></a>
					</div>
				</h1>

				<ul id="search-google-icon"
					class="nav nav-sidebar nav-sidebar-search-wrapper">
					<li class="nav-sidebar-search"><a href="javascript://"
						class="link" id="search-google" data-toggle="popover"
						data-trigger="click"><i class="fa fa-search"></i></a></li>
				</ul>

				<form id="search-google-form" name="searchMain"
					class="nav-sidebar-form" action="http://www.google.com/search">
					<div class="input-group">
						<input type="text" name="qt" class="form-control input-sm"
							placeholder="Google 검색" /> <input type="hidden" name="q" /> <span
							class="input-group-btn">
							<button class="btn btn-default btn-sm" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</span>
					</div>
				</form>

				<div class="nav-user nav-sidebar">



					<ul class="nav nav-sidebar">
						<li data-toggle="tooltip" data-container="body" title="로그인"><a
							href="/login/auth?redirectUrl=%2Farticles%2Fcommunity"
							class="link"><i class="fa fa-sign-in"></i> <span
								class="nav-sidebar-label">로그인</span></a></li>
						<li data-toggle="tooltip" data-container="body" title="회원가입"><a
							href="/user/register" class="link"><i class="fa fa-user"></i>
								<span class="nav-sidebar-label">회원가입</span></a></li>
					</ul>

				</div>

				<ul class="nav nav-sidebar nav-main">

					<li data-toggle="tooltip" data-placement="right"
						data-container="body" title="Q&A"><a
						href="/articles/questions" class="link"><i
							class="nav-icon fa fa-database"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

					<li data-toggle="tooltip" data-placement="right"
						data-container="body" title="Tech"><a href="/articles/tech"
						class="link"><i class="nav-icon fa fa-code"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

					<li class="active" data-toggle="tooltip" data-placement="right"
						data-container="body" title="커뮤니티"><a
						href="/articles/community" class="link"><i
							class="nav-icon fa fa-comments"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

					<li data-toggle="tooltip" data-placement="right"
						data-container="body" title="칼럼"><a href="/articles/columns"
						class="link"><i class="nav-icon fa fa-quote-left"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

					<li data-toggle="tooltip" data-placement="right"
						data-container="body" title="Jobs"><a href="/articles/jobs"
						class="link"><i class="nav-icon fa fa-group"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

				</ul>

				<ul class="nav nav-sidebar nav-bottom">
					<li data-toggle="tooltip" data-placement="right"
						data-container="body" title="Github Issues"><a
						href="https://github.com/okjsp/okky/issues" class="link"
						target="_blank"><i class="fa fa-github"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Github
								Issues</span></a></li>
				</ul>
			</div>


			<!-- <div class="test2"> -->
			<div class="sidebar-category-nav" style="background-color: #5d2c96">
				<h3 class="sub-title">커뮤니티</h3>
				<ul class="nav">
					<li><a href="/articles/community" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">All</span> <span
							class="nav-indicator nav-selected"><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/notice" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">공지사항</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/life" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/forum" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span
							class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/gathering" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/promote" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

				</ul>
			</div>

			<div id="list-article" class="content scaffold-list" role="main">
				<div class="nav" role="navigation">
				<a href="/ITGBBS/free/writeForm.do"
						class="create btn btn-success btn-wide pull-right"><i
						class="fa fa-pencil"></i>새 글 쓰기</a>
				
<!-- 					<form action="/writeForm.do?writer='hhh'">
					<i class="fa fa-pencil"><input type="submit" value="새 글 쓰기"/></i></form> -->
						


					<h4>커뮤니티</h4>
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
									<div class="list-tag clearfix">
										<span class="list-group-item-text article-id">#334499</span> <a
											href="/articles/life"
											class="list-group-item-text item-tag label label-info"><i
											class="fa fa-comments"></i> 사는얘기</a>

									</div>

									<h5 class="list-group-item-heading ">
										<a href="/ITGBBS/free/okkyFreeArticle.jsp">게시판에 저장된 글이
											없습니다.</a>
									</h5>
								</div>

								<div class="list-summary-wrapper clearfix">

									<div class="list-group-item-summary clearfix">
										<ul>
											<li class="item-icon-disabled"><i
												class="item-icon fa fa-comment "></i> 0</li>
											<li class="item-icon-disabled"><i
												class="item-icon fa fa-thumbs-up"></i> 0</li>
											<li class=""><i class="item-icon fa fa-eye"></i> 23</li>
										</ul>
									</div>

								</div>

								<div class="list-group-item-author clearfix">
									<div class='avatar avatar-list clearfix '>
										<a href='/user/info/3493' class='avatar-photo'><img
											src='//www.gravatar.com/avatar/904f71d814b2fb4a43c93284d5c8dea9?d=identicon&s=30' /></a>
										<div class="avatar-info">
											<a class="nickname" href="/user/info/3493">msb0</a>
											<div class="activity">
												<span class="fa fa-flash"></span> 293
											</div>
											<div class="date-created timeago"
												title="2016-06-27 11:54:27.0">2016-06-27 11:54:27.0</div>
										</div>
									</div>
								</div>
							</li>

						</c:if>
						<c:if test="${count > 0}">
							<c:forEach var="article" items="${articleList}">

								<li class="list-group-item  list-group-no-note clearfix">

									<div class="list-title-wrapper clearfix">
										<div class="list-tag clearfix">
											<span class="list-group-item-text article-id"> <c:out
													value="${number}" /> <c:set var="number"
													value="${number-1}" />
											</span> <a href="/articles/life"
												class="list-group-item-text item-tag label label-info"><i
												class="fa fa-comments"></i>자유게시판(사는얘기)</a>

										</div>

										<h5 class="list-group-item-heading ">
											<a
												href="/ITGBBS/free/content.do?anum=${article.anum}&pageNum=${currentPage}">${article.title}</a>
										</h5>
									</div>

									<div class="list-summary-wrapper clearfix">

										<div class="list-group-item-summary clearfix">
											<ul>
												<li class="item-icon-disabled"><i
													class="item-icon fa fa-comment "></i> 0</li>
												<li class="item-icon-disabled"><i
													class="item-icon fa fa-thumbs-up"></i> 0</li>
												<li class=""><i class="item-icon fa fa-eye"></i>${article.readcount}
													%></li>
											</ul>
										</div>

									</div>

									<div class="list-group-item-author clearfix">
										<div class='avatar avatar-list clearfix '>
											<a href='/user/info/3493' class='avatar-photo'><img
												src='//www.gravatar.com/avatar/904f71d814b2fb4a43c93284d5c8dea9?d=identicon&s=30' /></a>
											<div class="avatar-info">
												<a class="nickname" href="/user/info/3493">${article.writer}</a>
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

					<ul class="pagination pagination-sm">

						<!--페이징 처리: 이번블럭, 현재블럭, 다음블럭  -->
						<c:if test="${count > 0}">
							<!--1. 총페이지 구하기  -->
							<c:set var="pageCount"
								value="${count/pageSize+(count%pageSize==0?0:1)}" />
							<!-- 2. 시작페이지(1), 끝페이지(주로 10) -->
							<fmt:parseNumber var="result" value="${currentPage/blockSize}"
								integerOnly="true" />
							<c:set var="startPage" value="${result*blockSize+1}" />
							<c:set var="endPage" value="${startPage+blockSize-1}" />

							<c:if test="${endPage > pageCount}">
								<c:set var="endPage" value="${pageCount}" />;
	</c:if>


							<!-- //이전블럭 -->
							<c:if test="${startPage > blockSize}">
								<li class="prev disabled"><span>&laquo;</span></li>
							</c:if>

							<!-- //현재블럭 [이전] 11 12 13 14 .. 20 -->
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<li><a href="list.jsp?pageNum=${i}" class="step">${i}</a></li>
							</c:forEach>

							<!-- //다음블럭  ...23일 경우 -->
							<c:if test="${endPage < pageCount}">
								<li><a href="list.jsp?pageNum=${startPage+blockSize}"
									class="step"><span>...</span></li>
							</c:if>
						</c:if>
						<li><a
							href="/articles/community?offset=72020&amp;max=20&amp;sort=id&amp;order=desc"
							class="step">3602</a></li>
						<li class="next"><a
							href="/articles/community?offset=20&amp;max=20&amp;sort=id&amp;order=desc"
							class="step">&raquo;</a></li>
					</ul>

				</div>
			</div>


			<div class="right-banner-wrapper">



				<div class="google-ad">
					<script async
						src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
					<!-- okjspad_160x600 -->
					<ins class="adsbygoogle"
						style="display: inline-block; width: 160px; height: 600px"
						data-ad-client="ca-pub-8103607814406874" data-ad-slot="6573675943"></ins>
					<script>
                            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
				</div>
			</div>
			<div id="footer" class="footer" role="contentinfo">
				<div class="row">
					<div class="col-sm-6">
						<div style="float: left; margin-right: 10px;">
							<img
								src="http://okky.kr/assets/okky_logo_footer-afc30f99f303854f15a531d9089a1d50.png" />
						</div>
						<div>
							<a href="/intro/about">About OKKY</a> | <a href="/user/privacy"
								data-toggle="modal" data-target="#userPrivacy">개인정보보호</a> | <a
								href="https://github.com/okjsp/okky" target="_blank">Github</a>
							v0.8.1 <br /> @ 2015 <a href="http://www.ebrain.kr"
								target="_blank">eBrain Management</a>
						</div>
					</div>
					<div class="sponsor-banner col-sm-6">
						<a href="http://www.aspose.com" target="_blank"><img
							src="http://okky.kr/assets/spb_aspose-b744b6a8815d38b3c945904a1267b583.png" /></a>
						<a href="http://www.hanbit.co.kr" target="_blank"><img
							src="http://okky.kr/assets/spb_hb2-b6666fbb2c4778a64b386e89e0b4dd9f.png" /></a>
						<a href="http://alert.cidow.com" target="_blank"><img
							src="http://okky.kr/assets/spb_alert-5415d4607b9b8831cea9f7b59edf49c6.png" /></a>
						<a href="http://www.80port.com" target="_blank"><img
							src="http://okky.kr/assets/spb_port80-276554688f11177fae25fb25fbb538b4.png" /></a>
					</div>
				</div>


			</div>
		</div>
	</div>
	<script>
            var contextPath = "", encodedURL = "%2Farticles%2Fcommunity";
        </script>
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


	<script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-6707625-5', 'auto');
            ga('send', 'pageview');

        </script>


	<div id="userPrivacy" class="modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

	<div id="userAgreement" class="modal" tabindex="-1" role="dialog"
		aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

</body>
</html>
