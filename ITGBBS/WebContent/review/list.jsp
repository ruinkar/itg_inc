
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
<title>게시판</title>
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
							href="/ITGBBS/member/Login2.jsp"
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
					<li><a href="/ITGBBS/free/list.do" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">tick TALK</span> <span
							class="nav-indicator nav-selected"><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/ITGBBS/evinfo/eventMain.jsp" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">IT Event</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/ITGBBS/index.jsp" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">IT Event Review</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/forum" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">TEST1</span> <span
							class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/gathering" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">TEST2</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

					<li><a href="/articles/promote" class="link"><span
							class="nav-sidebar-label nav-sidebar-category-label">TEST3</span>
							<span class="nav-indicator "><span
								class="nav-selected-dot"></span></span></a></li>

				</ul>
			</div>

<!-- 임시 레이아웃  -->
<div style="background-color:#ffffff">
<center>
<b>글목록(전체 글:${count})</b>
<table width="700">
<tr>
  <td align="right" bgcolor="#b0e0e6">
  <a href="writeForm.do">글쓰기</a>
  </td>
</table>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">

<c:if test="${count == 0}">
	<tr>
		<td align = "center">
		게시물이 없습니다.
		</td>
	</tr>
</c:if>

<c:if test="${count > 0}"> 
  <tr height="30" bgcolor="#b0e0e6"> 
   <td align="center"  width="50"  >번 호</td> 
   <td align="center"  width="250" >제   목</td> 
   <td align="center"  width="100" >작성자</td>
   <td align="center"  width="150" >작성일</td> 
   <td align="center"  width="50" >조 회</td> 
   <td align="center"  width="100" >IP</td>
  </tr>
  
<!-- 실제 레코드를 출력하는 부분(for) -->
  <c:forEach var="article" items="${articleList}">
    
   <tr height="30">
    <td align="center"  width="50" ><%--=article.getNum() --%>${article.anum}</td>
    <td  width="250" >
    
    <a href="content.do?anum=${article.anum}&pageNum=${currentPage}">
    ${article.title}</a>
    </td>
    
    <td align="center"  width="100">${article.writer}</td>
    <td align="center"  width="150">
      <fmt:formatDate value="${article.adate}" pattern="yyyy-MM-dd HH:mm"/>
    </td>
    <td align="center"  width="50">${article.readcount}</td>
    <td align="center" width="100" >${article.ip}</td>
   </tr>
  </c:forEach>
</c:if>
</table>


<c:if test="${count > 0}">
  <!-- <c:set var="startPage" value="${(currentPage - 1) / blockSize * blocksize + 1}"/> -->
  <fmt:parseNumber var="result" value="${(currentPage - 1) / blockSize}" integerOnly="true"/>
  <c:set var="startPage" value="${result * blockSize + 1}"/>
  <c:set var="endPage" value="${startPage + blockSize - 1}"/>
  <c:set var="endPage" value="${endPage>pageCount ? pageCount : endPage}"/>
  <!-- 이전 블럭 → 11 → 10 -->
  <c:if test="${startPage>blockSize}">
    <a href="list.do?pageNum=${startPage - blockSize}">[이전]</a>
    <!-- [이전] 11 12 13...20 -->
  </c:if>
  <!-- 현재 블럭 -->
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
    <a href="list.do?pageNum=${i}">[${i}]</a>
  </c:forEach>
    
  <c:if test="${endPage<pageCount}">
    <a href="list.do?pageNum=${startPage + blockSize}">[다음]</a>
  </c:if>
  
</c:if>

</center>
</div>



<!-- 임시 레이아웃  -->

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
