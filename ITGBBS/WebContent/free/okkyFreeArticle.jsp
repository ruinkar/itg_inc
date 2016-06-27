<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 오키자유게시판 상세보기   http://okky.kr/article/334602
	기능구현
	1. 댓글 작성(작성하고 바로 현 페이지 하단에 보임(ajax), )
	2. -->

<!--[if lt IE 7 ]> <html lang="ko" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="ko" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="ko" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="ko" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="ko" class="no-js"><!--<![endif]-->
	<head>
        <meta charset="utf-8">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>OKKY - 정보처리기사 실기시험 마치고 나니 살맛나네요.</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="http://okky.kr/assets/favicon-4ddd8035b72404da5a8c298cbaacad86.ico" type="image/x-icon">
		<link rel="apple-touch-icon" href="http://okky.kr/assets/icon_57x57-5611bd33d9f2b2d84c22219e248455b6.png">
		<link rel="apple-touch-icon" sizes="114x114" href="http://okky.kr/assets/icon_114x114-b2b627dfde8a040fe54fd257244ba191.png">
        <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <meta property="og:image" content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">
        
        <link rel="stylesheet" href="http://okky.kr/assets/application-178a471b205e52821f985abddea1ac34.css"/>

        <!--[if lt IE 9]>
            <script src="http://okky.kr/assets/libs/html5-ca664f64318d191265abf57fdf467aec.js" type="text/javascript" ></script>
        <![endif]-->

        
		<meta name="layout" content="main">
		
        
        <meta property="og:type" content="article">
        <meta property="og:site_name" content="OKKY">
        <meta property="og:url" content="http://okky.kr/article/334602">
        <meta property="og:image" content="http://okky.kr/assets/okky_logo_fb-cea175ff727ef14a4d8be0e68cff730a.png">
        
        <meta property="og:description" content=" okky 유저님들 중에 정보처리기사 없는 분들에게 강추. &#160;  비전공자여서 이론에 대한 배움의 갈증을 해결하고 싶은데 너무 바쁘시다면, 이 자격증 준비하면서 없는 시간 쪼개서 약간의 이론을 습득할 수 있습니다.   허나  전자계산기  고비와 실기  주관식 전환 이라는 두 고비가 자리하고 있지만, 자격증을 획득하고 나면 연봉인상에 도움도 된다고 들었거든요.">
        <meta property="og:title" content="OKKY | 정보처리기사 실기시험 마치고 나니 살맛나네요.">
    
	</head>
	<body>
        <div class="layout-container">
            <div class="main ">
                

        


<div class="sidebar sidebar-category">

    <a href="javascript://" class="sidebar-header">
        <i class="fa fa-bars sidebar-header-icon"></i>
    </a>
    
    <h1><div class="logo"><a href="/"><img src="http://okky.kr/assets/okjsp_logo-467f1484e489ca1133e6320083e1fb9f.png" alt="OKKY" title="OKKY"/></a></div></h1>

    <ul id="search-google-icon" class="nav nav-sidebar nav-sidebar-search-wrapper">
        <li class="nav-sidebar-search"><a href="javascript://" class="link" id="search-google" data-toggle="popover" data-trigger="click"><i class="fa fa-search"></i></a></li>
    </ul>

    <form id="search-google-form" name="searchMain" class="nav-sidebar-form" action="http://www.google.com/search">
        <div class="input-group">
            <input type="text" name="qt" class="form-control input-sm" placeholder="Google 검색" />
            <input type="hidden" name="q" />
            <span class="input-group-btn">
                <button class="btn btn-default btn-sm" type="submit"><i class="fa fa-search"></i></button>
            </span>
        </div>
    </form>

    <div class="nav-user nav-sidebar">
        
            
                <div class='avatar avatar-medium clearfix '><a href='/user/info/45019' class='avatar-photo'><img src='//www.gravatar.com/avatar/d6ee80eb5a45fd4131a4b75d48df792b?d=identicon&s=40'/></a> </div>
            
            <div class="nav-user-action">
                <div class="nav-user-func">
                    <a href="javascript://" id="user-func" data-toggle="popover" data-trigger="click" tabindex="0">
                        <i id="user-func-icon" class="fa fa-cog"></i>
                    </a>
                </div>
                <div class="nav-user-func">
                    <a href="javascript://" id="user-notification" data-toggle="popover" data-trigger="click" tabindex="0">
                        <i id="user-notification-icon" class="fa fa-bell" ></i>
                        <span id="user-notification-count" class="badge notification" style="display:none;">0</span>
                    </a>
                </div>
            </div>
            <form action="/logout/index" method="post" style="display:none;" ><input type="submit" name="logoutButton" value="logoutButton" id="logoutButton" /></form>

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

    <ul class="nav nav-sidebar nav-main">
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="Q&A"><a href="/articles/questions" class="link"><i class="nav-icon fa fa-database"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Q&A</span></a></li>
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="Tech"><a href="/articles/tech" class="link"><i class="nav-icon fa fa-code"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Tech</span></a></li>
        
            <li class="active" data-toggle="tooltip" data-placement="right" data-container="body" title="커뮤니티"><a href="/articles/community" class="link"><i class="nav-icon fa fa-comments"></i> <span class="nav-sidebar-label nav-sidebar-category-label">커뮤니티</span></a></li>
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="칼럼"><a href="/articles/columns" class="link"><i class="nav-icon fa fa-quote-left"></i> <span class="nav-sidebar-label nav-sidebar-category-label">칼럼</span></a></li>
        
            <li  data-toggle="tooltip" data-placement="right" data-container="body" title="Jobs"><a href="/articles/jobs" class="link"><i class="nav-icon fa fa-group"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Jobs</span></a></li>
        
    </ul>

    <ul class="nav nav-sidebar nav-bottom">
        <li data-toggle="tooltip" data-placement="right" data-container="body" title="Github Issues"><a href="https://github.com/okjsp/okky/issues" class="link" target="_blank"><i class="fa fa-github"></i> <span class="nav-sidebar-label nav-sidebar-category-label">Github Issues</span></a></li>
    </ul>
</div>


<div class="sidebar-category-nav">
<h3 class="sub-title">커뮤니티</h3>
<ul class="nav">
    <li><a href="/articles/community" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">All</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    
        <li><a href="/articles/notice" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">공지사항</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    
        <li><a href="/articles/life" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">사는얘기</span> <span class="nav-indicator nav-selected"><span class="nav-selected-dot"></span></span></a></li>
    
        <li><a href="/articles/forum" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">포럼</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    
        <li><a href="/articles/gathering" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">정기모임/스터디</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    
        <li><a href="/articles/promote" class="link"><span class="nav-sidebar-label nav-sidebar-category-label">학원/홍보</span> <span class="nav-indicator "><span class="nav-selected-dot"></span></span></a></li>
    
</ul>
</div>


        <div id="article" class="content" role="main">
            <div class="nav" role="navigation">
                <a href="/articles/life/create" class="create btn btn-success btn-wide pull-right"><i class="fa fa-pencil"></i> 새 글 쓰기</a>

                <h4>사는얘기</h4>
            </div>

            <div class="panel panel-default clearfix">
                <div class="panel-heading clearfix">
                    <div class='avatar avatar-medium clearfix pull-left'><a href='/user/info/45019' class='avatar-photo'><img src='//www.gravatar.com/avatar/d6ee80eb5a45fd4131a4b75d48df792b?d=identicon&s=40'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/45019">큭큭푸푸</a> <div class="activity"><span class="fa fa-flash"></span> 10</div><div class="date-created timeago" title="2016-06-27 17:40:19.0">2016-06-27 17:40:19.0</div></div></div>
                    <div class="content-identity pull-right">
                    <div class="content-identity-count"><i class="fa fa-comment"></i> 0</div>
                        <div class="content-identity-count"><i class="fa fa-eye"></i> 0</div>
                    </div>
                </div>
                <div class="content-container clearfix">
                    <div class="panel-body content-body pull-left">
                        <div class="content-tags">
                            <span class="list-group-item-text article-id">#334602</span>
                            <a href="/articles/life" class="list-group-item-text item-tag label label-info"><i class="fa fa-comments"></i> 사는얘기</a>
                            <a href="/articles/tagged/정보처리기사" class="list-group-item-text item-tag label label-gray">정보처리기사</a> <a href="/articles/tagged/유수" class="list-group-item-text item-tag label label-gray">유수</a> 
                        </div>
                        <h2 class="panel-title">정보처리기사 실기시험 마치고 나니 살맛나네요.</h2>
                        <hr/>
                        <article class="content-text">
                        
                            
                                <p>okky 유저님들 중에 정보처리기사 없는 분들에게 강추.  <br /><span style="line-height:1.42857">비전공자여서 이론에 대한 배움의 갈증을 해결하고 싶은데 너무 바쁘시다면,<br />이 자격증 준비하면서 없는 시간 쪼개서 약간의 이론을 습득할 수 있습니다.</span></p><p>허나 &#39;전자계산기&#39; 고비와 실기 &#39;주관식 전환&#39;이라는 두 고비가 자리하고 있지만, 자격증을 획득하고 나면 연봉인상에 도움도 된다고 들었거든요. 아직 취준생이라 정확하게는 모르겠습니다.^^;;</p><p> 전 정보처리기사 준비하면서 기본적인 알고리즘을 배웠고, <span style="line-height:1.42857">용어들도 많이 익혔어요. 함께 수업듣는 형이 안드로이드 스도쿠앱을 만들어도 그 알고리즘을 이해하지 못했어요. 열심히 설명은 하는데, 코드 흐름을 못따라가겠더라구요. 그런데 지금은 스도쿠 규칙에 맞게 난수를 찍는지, 정답을 비교하는지 큰 흐름은 이해한 답니다. 정보처리기사로 알고리즘 기본기를 뗀 게 아니라, 알고리즘이 뭔지 감을 잡았다고 생각해요. </span></p><p><span style="line-height:1.42857">지금 학원에서 spring을 배우며 프로젝트로 okky 사이트를 벤치마킹해 it 행사 커뮤니티를 만들고 있는데, DB관련 ERD짜고, 정규화 얘기 나왔을 때도 큰 도움이 됐던 것 같아요. 시험준비하며 공부한 내용을 선생님이 다시 한번 강의해주고, 우리는 직접 SQL on delete 옵션에 cascade도 넣어보니, 그냥 수업만 듣는 것보다 더 몰입되더라구요.</span></p><p><span style="line-height:20px">이제 국비 교육 남은 기간은 CRM 솔루션에 대한 공부와 현 프로젝트를 무사히 끝내기 위해 최선을 다할려고 합니다. 저처럼 정보처리기사 시험을 보신 유저분들께는 모두 수고하셨다고 전하고 싶습니다.<br />오늘 하루 수고 많으셨습니다!</span></p><p><br /></p><p><br /></p>
                            
                        
                        </article>

                    </div>

                    <div class="content-function pull-right text-center">
                        <div class="content-function-group">
                            <a href="javascript://" class="note-vote-btn" role="button" data-type="vote" data-eval="false" data-id="1082476"><i  id="note-vote-1082476" class="fa fa-thumbs-up note-vote" data-toggle="tooltip" data-placement="left" title="좋아요"></i></a><div id="content-vote-count-1082476" class="content-count">0</div>
                        </div>
                        <div class="content-function-group article-scrap-wrapper">
                            <a href="javascript://" id="article-scrap-btn" data-type="scrap"><i class="fa fa-bookmark " data-toggle="tooltip" data-placement="left" title="스크랩"></i></a>
                            <div id="article-scrap-count" class="content-count">0</div>
                        </div>
                    </div>
                    <div class="content-function-cog share-btn-wrapper">
                        <div class="dropdown">
                            <a href="http://www.facebook.com/sharer/sharer.php?app_id=1451111438499030&sdk=joey&u=http%3A%2F%2Fokky.kr%2Farticle%2F334602&display=popup&ref=plugin" class="btn-facebook-share"><i class="fa fa-facebook-square fa-fw" data-toggle="tooltip" data-placement="left" title="페이스북 공유"></i></a>
                            
                        </div>

                        
                        <div class="dropdown">
                            <form action="/article/delete/334602" method="post" name="article-delete-form" id="article-delete-form" ><input type="hidden" name="_method" value="DELETE" id="_method" />
                                <div class="dropdown">
                                    <a href="javascript://" data-toggle="dropdown"><i class="fa fa-cog" data-toggle="tooltip" data-placement="left" title="게시물 설정"></i></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="/article/edit/334602" class="edit"><i class="fa fa-edit fa-fw"></i> 수정 </a></li>
                                        
                                            <li><a href="javascript://" id="article-delete-btn"><i class="fa fa-trash-o fa-fw"></i> 삭제 </a></li>
                                        
                                    </ul>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>

            

            <div class="panel panel-default clearfix">
                <!-- List group -->
                <ul class="list-group">
                
                    <li id="note-title" class="list-group-item note-title">
                        <h3 class="panel-title">댓글 <span id="note-count">0</span></h3>
                    </li>
                    
                    <li class="list-group-item note-form clearfix">
                        
                            <form action="/article/addNote/334602" method="post" class="note-create-form" >
                                
                                <div class="content-body panel-body pull-left">
                                    <div style="margin-left: 5px;">
                                        
                                        
                                            <div class='avatar avatar-medium clearfix '><a href='/user/info/45019' class='avatar-photo'><img src='//www.gravatar.com/avatar/d6ee80eb5a45fd4131a4b75d48df792b?d=identicon&s=40'/></a> <div class="avatar-info"><a class="nickname" href="/user/info/45019">큭큭푸푸</a> <div class="activity block"><span class="fa fa-flash"></span> 10</div></div></div>
                                        
                                    </div>
                                    <fieldset class="form">
                                        <input type="hidden" name="note.textType" value="HTML" id="note.textType" />
                                        <textarea name="note.text" id="note-create" placeholder="댓글 쓰기" class="form-control" ></textarea>
                                    </fieldset>
                                </div>
                                <div class="content-function-cog note-submit-buttons clearfix">
                                    <p><a href="javascript://" id="note-create-cancel-btn" class="btn btn-default btn-wide" style="display: none;">취소</a></p>
                                    <input type="submit" name="create" id="btn-create-btn" class="btn btn-success btn-wide" value=" 등록" disabled="disabled" />
                                </div>
                            </form>
                        
                        
                    </li>
                </ul>
            </div>
        </div>

        
            <form action="/article/assent/334602" method="post" name="note-vote-form" id="note-vote-form" ><input type="hidden" name="_method" value="PUT" id="_method" />
            </form>
        
        <form action="/article/unvote/334602" method="post" name="note-unvote-form" id="note-unvote-form" ><input type="hidden" name="_method" value="PUT" id="_method" />
        </form>
        <form action="/article/selectNote/334602" method="post" name="note-select-form" id="note-select-form" ><input type="hidden" name="_method" value="PUT" id="_method" />
        </form>
        <form action="/article/deselectNote/334602" method="post" name="note-deselect-form" id="note-deselect-form" ><input type="hidden" name="_method" value="PUT" id="_method" />
        </form>
        <form action="/article/scrap/334602" method="post" name="article-scrap-form" id="article-scrap-form" >
        </form>

        
	
                <div class="right-banner-wrapper">

                    
                
                    <div class="google-ad">
                        <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
                        <!-- okjspad_160x600 -->
                        <ins class="adsbygoogle"
                             style="display:inline-block;width:160px;height:600px"
                             data-ad-client="ca-pub-8103607814406874"
                             data-ad-slot="6573675943"></ins>
                        <script>
                            (adsbygoogle = window.adsbygoogle || []).push({});
                        </script>
                    </div>
                </div>
                <div id="footer" class="footer" role="contentinfo">
                    <div class="row">
    <div class="col-sm-6">
        <div style="float: left;margin-right: 10px;">
            <img src="http://okky.kr/assets/okky_logo_footer-afc30f99f303854f15a531d9089a1d50.png" />
        </div>
        <div>
            <a href="/intro/about">About OKKY</a>
            | <a href="/user/privacy" data-toggle="modal" data-target="#userPrivacy">개인정보보호</a>
            | <a href="https://github.com/okjsp/okky" target="_blank">Github</a>  v0.8.1
            <br/> @ 2015 <a href="http://www.ebrain.kr" target="_blank">eBrain Management</a>
        </div>
    </div>
    <div class="sponsor-banner col-sm-6">
        <a href="http://www.aspose.com" target="_blank"><img src="http://okky.kr/assets/spb_aspose-b744b6a8815d38b3c945904a1267b583.png" /></a>
        <a href="http://www.hanbit.co.kr" target="_blank"><img src="http://okky.kr/assets/spb_hb2-b6666fbb2c4778a64b386e89e0b4dd9f.png" /></a>
        <a href="http://alert.cidow.com" target="_blank"><img src="http://okky.kr/assets/spb_alert-5415d4607b9b8831cea9f7b59edf49c6.png" /></a>
        <a href="http://www.80port.com" target="_blank"><img src="http://okky.kr/assets/spb_port80-276554688f11177fae25fb25fbb538b4.png" /></a>
    </div>
</div>


                </div>
            </div>
        </div>
        <script>
            var contextPath = "", encodedURL = "%2Farticle%2F334602";
        </script>
        <script src="http://okky.kr/assets/application-196466c60cf4e718162e141a5acdf612.js" type="text/javascript" ></script>
        <script src="http://okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js" type="text/javascript" ></script>
        
            <script src="http://okky.kr/assets/apps/notification-f91d194e3ba2944508aa3af101c4498a.js" type="text/javascript" ></script>
        
        
            <div id="fb-root"></div>
            <script src="http://okky.kr/assets/apps/article-ea46aa62f8c1cced8e0e35a962a7b49c.js" type="text/javascript" ></script>
            
            <script>
                (function(d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id)) return;
                js = d.createElement(s); js.id = id;
                js.src = "//connect.facebook.net/ko_KR/sdk.js#xfbml=1&appId=1539685662974940&version=v2.0";
                fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));
            </script>
        
        
        <script>
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
                (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
                    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-6707625-5', 'auto');
            ga('send', 'pageview');

        </script>


        <div id="userPrivacy" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>

        <div id="userAgreement" class="modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>

    </body>
</html>
