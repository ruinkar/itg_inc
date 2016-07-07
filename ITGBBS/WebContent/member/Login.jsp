<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:set var="mem_id" value="${sessionScope.idKey}" />
<html>
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
<title>OKKY - All That Developer</title>
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

			<div class="sidebar" style="background-color: #522c96">

				<a href="javascript://" class="sidebar-header"> <i
					class="fa fa-bars sidebar-header-icon"></i>
				</a>

				<h1>
					<div class="logo">
						<a href="/">ITG</a>
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



				<c:if test="${empty mem_id}">
					<div class="nav-user nav-sidebar">
						<ul class="nav nav-sidebar">
							<li><a
								href="/login/auth?redirectUrl=%2Flogin%2Fauth%3FredirectUrl%3D%252F"
								class="link"><i class="fa fa-sign-in"></i> <span
									class="nav-sidebar-label">로그인</span></a></li>
							<li><a href="/user/register" class="link"><i
									class="fa fa-user"></i> <span class="nav-sidebar-label">회원가입</span></a></li>
						</ul>

					</div>
				</c:if>
				<c:if test="${!empty mem_id}">
					<div class="nav-user nav-sidebar">
						<div class='avatar avatar-medium clearfix '>
							<a href='/user/info/45866' class='avatar-photo'><img
								src='//www.gravatar.com/avatar/736cef0c3fe2fa3ba90107182474c6d5?d=identicon&s=40' /></a>
							<div class="avatar-info">
								<a class="nickname" href="/user/info/45866">${mem_id}</a>
								<div class="activity block">
									<span class="fa fa-flash"></span> 0
								</div>
							</div>
						</div>

						<div class="nav-user-action">
							<div class="nav-user-func">
								<a href="javascript://" id="user-func" data-toggle="popover"
									data-trigger="click" tabindex="0"> <i id="user-func-icon"
									class="fa fa-cog"></i>
								</a>
							</div>
							<div class="nav-user-func">
								<a href="javascript://" id="user-notification"
									data-toggle="popover" data-trigger="click" tabindex="0"> <i
									id="user-notification-icon" class="fa fa-bell"></i> <span
									id="user-notification-count" class="badge notification"
									style="display: none;">0</span>
								</a>
							</div>
						</div>
						<form action="/logout/index" method="post" style="display: none;">
							<input type="submit" name="logoutButton" value="logoutButton"
								id="logoutButton" />
						</form>

						<script id="setting-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-footer clearfix" id="user-func-popover">
                        <label href="" for="logoutButton" class="popover-btn"><i class="fa fa-sign-out"></i> 로그아웃</label>
                        <a href="/user/edit" class="popover-btn"><i class="fa fa-user"></i> 정보수정</a>
                    </div>
                </div>
            </script>

						<script id="notification-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title"></h3>
                    <div class="popover-content" id="notification-popover"></div>
                </div>
            </script>

						<script id="search-google-template" type="text/template">
                <div class="popover popover-fixed" role="tooltip"><div class="arrow"></div>
                    <h3 class="popover-title">Google 검색</h3>
                    <div class="popover-content" id="search-google-popover">
                        <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="http://www.google.com/search" onsubmit="searchMain.q.value='site:okky.kr '+searchMain.qt.value;">
                            <div class="input-group">
                                <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
                                <input type="hidden" name="q" />
                                <span class="input-group-btn">
                                    <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
                                </span>
                            </div>
                        </form>
                    </div>
                </div>
            </script>

					</div>
				</c:if>
				<ul class="nav nav-sidebar nav-main">

					<li><a href="/articles/questions" class="link"><i
							class="nav-icon fa fa-database"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>

					<li><a href="/articles/tech" class="link"><i
							class="nav-icon fa fa-code"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>

					<li><a href="/articles/community" class="link"><i
							class="nav-icon fa fa-comments"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>

					<li><a href="/articles/columns" class="link"><i
							class="nav-icon fa fa-quote-left"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>

					<li><a href="/articles/jobs" class="link"><i
							class="nav-icon fa fa-group"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>

				</ul>

				<ul class="nav nav-sidebar nav-bottom">
					<li><a href="https://github.com/okjsp/okky/issues"
						class="link" target="_blank"><i class="fa fa-github"></i> <span
							class="nav-sidebar-label nav-sidebar-category-label">Github
								Issues</span></a></li>
				</ul>
			</div>


			<div id="edit-user" class="content" role="main">
				<h3 class="content-header">로그인</h3>
				<div class="col-md-6 main-block-left">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-header">아이디 로그인</h5>
						</div>

						<form action='LoginProc.do'
							class="form-signin form-user panel-body panel-margin"
							method='POST' autocomplete='off' name="login">


							<input type="hidden" name="redirectUrl" value="/" /> <input
								type="text" name="memberid" id='username'
								class="username form-control input-sm" placeholder="아이디"
								required autofocus> <input type="password"
								name="memberpw" class="password form-control input-sm"
								placeholder="비밀번호" required>
							<div class="checkbox">
								<label> <input type="checkbox" name='remember_me'
									id='remember_me'> 로그인 유지
								</label>
							</div>
							<!-- <button class="btn btn-primary btn-block" type="submit"> -->
							<input type="submit" value="로그인">
							<!-- </button> -->
							<div class="signup-block">
								<a href="/find/user/index">계정 찾기</a> <span
									class="inline-saperator">/</span> <a href="/user/register">회원
									가입</a>
							</div>
						</form>
					</div>
				</div>



				<div class="col-md-6 main-block-right">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h5 class="panel-header">SNS 로그인</h5>
						</div>
						<div class="panel-body panel-margin sns-buttons">
							<a href="/oauth/facebook/authenticate?redirectUrl="
								provider="facebook" class="btn btn-facebook btn-block"><i
								class="fa fa-facebook fa-fw"></i> Facebook 으로 로그인</a> <a
								href="/oauth/google/authenticate?redirectUrl=" provider="google"
								class="btn btn-google btn-block"><i
								class="fa fa-google fa-fw"></i> Google 로 로그인</a>
						</div>
					</div>
				</div>

			</div>

			<script type='text/javascript'>
			<!--
				(function() {
					document.forms['loginForm'].elements['j_username'].focus();
				})();
			// -->
			</script>
		</div>
	</div>
	</div>
	<script>
		var contextPath = "", encodedURL = "%2Flogin%2Fauth%3FredirectUrl%3D%252F";
	</script>
	<script
		src="http://okky.kr/assets/application-196466c60cf4e718162e141a5acdf612.js"
		type="text/javascript"></script>
	<script
		src="http://okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js"
		type="text/javascript"></script>



	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

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