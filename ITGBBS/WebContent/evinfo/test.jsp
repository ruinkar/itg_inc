<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>온오프믹스 :: 모임문화 플랫폼</title>
	<meta name="keywords" content="onoffmix, event, 온오프믹스, 모임, 행사, 번개, 이벤트" />
	<meta name="description" content="온오프믹스 - 모임문화 플랫폼 / ONOFFMIX - Everything You Meet" />
	<meta name="author" content="ONOFFMIX Inc. (webmaster@onoffmix.com)" />
	<meta property="fb:app_id" content="177423549023365" />	<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
	<link rel="shortcut icon" type="image/x-icon" href="http://static.onoffmix.com/images3/favicon/favicon.ico" />
			<link rel="alternate" type="application/rss+xml" title="온오프믹스 모임정보" href="http://onoffmix.com/rss" />
		<link rel="canonical" href="http://onoffmix.com/event/add" />
		<!-- CSS Style -->
	<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css2/base.css" />
	<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css2/fontset-standard.css" />
	<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css3/owl.carousel.css" />

	<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css3/headfoot.css?2015060501" /><link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css3/exception.css" /><link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css3/base.css" />
<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css3/eventSummaryCommon.css" />
<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css3/adminWrite.css" />	<!--[if IE 6]>
	<link rel="stylesheet" type="text/css" href="http://static.onoffmix.com/css2/ie6only.css" />
	<script type="text/javascript" src="http://static.onoffmix.com/js2/DD_belatedPNG.js"></script>
	<script type="text/javascript">DD_belatedPNG.fix('.logo');</script>
	<![endif]-->
	<!--[if lt IE 8]>
	<script type="text/javascript" src="http://static.onoffmix.com/js/json2.js"></script>
	<![endif]-->

	<!-- Variable Set -->
	<script type='text/javascript'>
		var base_siteIdx = '0';
		var base_siteUrl = 'onoffmix.com';
		var base_sslUrl = 'onoffmix.com';
		var base_sslPort = '443';
		var base_apiUrl = 'api.onoffmix.com';
		var base_http = 'http://onoffmix.com';
		var base_https = 'https://onoffmix.com:443';
		var base_httpStatic = 'http://static.onoffmix.com';
		var base_httpMobile = 'http://m.onoffmix.com';
		var mPath_member = '/_/member/';
		var base_area = '';
		var url_login = '/account/login';
		var url_marketCart = '/account/market/cart';
		var defaultImageAdvert = 'http://static.onoffmix.com/images3/default/eventBanner_440.jpg';
		if (location.href.match(/^https:\/\//)) {
			location.href = location.href.replace(/^https:\/\//, 'http://').replace(':' + base_sslPort, '');
		}
	</script>
	<!-- General Script -->
	<script type="text/javascript" src="http://static.onoffmix.com/js/jquery-1.10.2.js"></script>
		<script type="text/javascript" src="http://static.onoffmix.com/js/jquery.browser.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js/jquery-ui-1.10.3.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js/jquery.fancybox-1.3.3.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js/jquery.qtip-2.1.1.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js/jquery.ui.selectmenu.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js2/jquery.tmpl.min.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js2/jquery.lazyload.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js2/jquery.cookie.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js3/owl.carousel.min.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js2/common.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js3/common.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js/siteLink.js"></script>
	<script type="text/javascript" src="http://static.onoffmix.com/js2/calendar.js"></script>
	<script type="text/javascript" src="http://m.onoffmix.com/js/mobile.js?20150201"></script>
	<!--[If IE]>
	<script type="text/javascript" src="http://static.onoffmix.com/js3/jquery.placeholder.js"></script>
	<![endif]-->

	<script type="text/javascript" src="/_/jquery-validate/jquery.validate.js"></script>
<script type="text/javascript" src="/_/jquery-validate/additional-methods.js"></script>
<script type="text/javascript" src="/_/jquery-validate/localization/messages_ko.js"></script>
<script type="text/javascript" src="/_/webeditor/SE2.3.4.O10204/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="/_/swfupload/uploadify/jquery.uploadify-3.2.1.js"></script>
<script type="text/javascript" src="http://static.onoffmix.com/js3/jquery.keyfilter.js"></script>
<script type="text/javascript" src="http://static.onoffmix.com/js2/jquery.ui.timebox.js"></script>
<script type="text/javascript" src="http://static.onoffmix.com/js2/jquery.ui.emailbox.js"></script>
<script type="text/javascript" src="http://static.onoffmix.com/js3/jquery.ui.doubleDatepicker.js"></script>
<script type="text/javascript" src="http://static.onoffmix.com/js/jquery.form.js"></script>
<script type="text/javascript" src="http://openapi.map.naver.com/openapi/naverMap.naver?ver=2.0&key=b101526c83e0d93deb6d612454d24e4a"></script>
<script type="text/javascript" src="http://static.onoffmix.com/js2/map2.js"></script>
<script type="text/javascript" src="http://static.onoffmix.com/js3/event/adminWrite.js"></script>
<script type="text/javascript">makeMAP(127.035448,37.503237,true)</script>
<script type="text/javascript">var event_emailParticipant = "/event/0/manage/email";</script>
<script type="text/javascript" src="http://static.onoffmix.com/js2/map.google.js"></script>
<script type="text/javascript">try{eventDraft=[{"proc":"createBaseEvent","eventIdx":"0","banner":"","eventPreviewUrl":"\/event\/preview\/0","bannerUrl":"http:\/\/static.onoffmix.com\/images2\/bannerPreset\/thumbnail_01.jpg","bannerDelete":"0","category":"85","title":"aaa","bannerSelection":"http:\/\/static.onoffmix.com\/images2\/bannerPreset\/thumbnail_01.jpg","abstract":"\ubaa8\uc784 \ub0b4\uc6a9\uc744 \uac04\ub2e8\ud788 \uc694\uc57d\ud558\uc5ec \uc785\ub825\ud574 \uc8fc\uc138\uc694.","content":"<br>","isFree":"0","wayOfPayment":["Card"],"incomingBankCode":"00","incomingBankNumber":"","incomingBankOwner":"","totalFunding":"0","eventEndDateInUse":"y","eventStartDateTime":"2016-06-30 18:30","eventEndDateTime":"2016-06-30 19:00","eventStartDateTime_date":"2016-06-30","eventStartDateTime_time":"18:30","eventEndDateTime_date":"2016-06-30","eventEndDateTime_time":"19:00","recruitStartDateInUse":"y","recruitStartDateTime":"2016-06-29 18:30","recruitEndDateTime":"2016-06-30 18:00","recruitStartDateTime_date":"2016-06-29","recruitStartDateTime_time":"18:30","recruitEndDateTime_date":"2016-06-30","recruitEndDateTime_time":"18:00","location":"\uc815\ud655\ud55c \uc7a5\uc18c\uba85\uc744 \uc785\ub825\ud574 \uc8fc\uc138\uc694.","tm128x":"","tm128y":"","mapX":"127.035448","mapY":"37.503237","locality":"\uc11c\uc6b8\ud2b9\ubcc4\uc2dc","sublocality1":"\uac15\ub0a8\uad6c","sublocality2":"\uc5ed\uc0bc\ub3d9","isExposed":"1","oc":"0","ownerPhone_head":"010","ownerPhone_body":"8864","ownerPhone_tail":"8849","ownerEmail":"zeenux@naver.com"}];eventDraft=(eventDraft.length==1)?eventDraft[0]:eventDraft;eventDraftTimestamp="1467191893";}catch(e){}</script>
	
</head>
<body class="onoffmix">
<div class="skipNavi">
	<a href="#content">본문 바로가기</a>
</div>
<div id="messagequeue"></div>
<div id="dialogBox"></div>
<script type="text/x-query-tmpl" id="tmpl-noneToday"><ul class="todayEvent noneEvent">
	<li></li>
</ul></script><script type="text/x-query-tmpl" id="tmpl-15headerSearch"><li class="recommendationSearch"><span class="bulSearch"></span><a href="${defaultLink}" target="_blank">${defaultComment}</a></li></script><script type="text/x-query-tmpl" id="tmpl-15header"><div class="headerBannerImg">
  <div class="positionArea">
    <p><a href="${defaultLink}" target="_blank"><img src="${defaultImage}" alt="${defaultComment}" /></a></p>
  </div>
</div></script><script type="text/x-query-tmpl" id="tmpl-15mainTop"><li><a href="${defaultLink}" class="bannerImgArea" target="_blank"><img src="${defaultImage}" alt="${defaultComment}"/></a></li></script><script type="text/x-query-tmpl" id="tmpl-15mainTopRoller"><li>
  <a href="${defaultLink}" target="_blank"><span class="positionArea"><span class="borderArea"></span><img src="${additionalImage}" alt="${defaultComment}" width="29" /></span>
  <span class="textArea" title="${defaultComment}">${defaultComment}</span></a>
</li></script><script type="text/x-query-tmpl" id="tmpl-15mainRank"><li class="last">
  <a href="${defaultLink}">
    <p class="positionArea">
      <span class="number ad">AD</span>
      <span class="borderArea"></span>
      <img src="${defaultImage}" alt="${defaultComment}"/>
      <span class="text">${defaultComment}</span>
    </p>
  </a>
</li></script><script type="text/x-query-tmpl" id="tmpl-15mainSide"><li><a href="${defaultLink}" target="_blank"><img src="${defaultImage}" alt="${defaultComment}"/></a></li></script><script type="text/x-query-tmpl" id="tmpl-15mainToday"><ul class="todayEvent {{if isAttending}}event-flag-attending{{/if}} {{if isPinned}}event-flag-pinned{{/if}} ${cssClass}" _idx="${idx}">
	<li class="eventThumbnail"><a href="${defaultLink}" target="_blank"><img src="${defaultImage}" alt="${defaultComment}" width="220" height="220" class="thumbnail" /></a></li>
	<li class="eventTitle"><a href="${defaultLink}" class="eventLink" title="${defaultComment}" target="_blank">${defaultComment}</a></li>
	<li class="eventBottomArea">
		<ul>
			<li class="eventPin"><a href="#pin"><span class="heart">찜</span></a><span class="pinNumber">${pinned}</span></li>

		{{if _isOnline}}
			{{if _isFuture}}{{! 모집 시작일이 미래인 경우 }}
				<li class="eventPersonnel"><a href="${defaultLink}" class="eventButton" target="_blank">
					<span>모집 {{html _remainTimeStart}}</span>
					<span class="entered">모임상세보기</span>
				</a></li>
			{{else _isPast}}{{! 모집 종료일이 과거인 경우 }}
				<li class="eventPersonnel"><span class="disable">등록 마감</span></li>
			{{else isAttending}}{{! 이미 모임에 참여된 경우 }}
				<li class="eventPersonnel"><a href="/rsvp/edit/${idx}" class="eventButton edit" target="_blank">참여정보 수정</a></li>
			{{else _isRecruiting}}
			{{if _isShowProgress}}{{! 참여가능 인원이 표시되는 경우 }}
				{{if _remainsZero}}{{! '온오프믹스 접수' 로 모집중인 경우 (참여가능 인원이 0명) }}
					<li class="eventPersonnel"><a href="/rsvp/attend/${idx}" class="eventButton" target="_blank">
					  <span>정원 도달</span>
					  <span class="entered">대기자등록</span>
					</a></li>
				{{else _remainsLT1000}}{{! '온오프믹스 접수' 로 모집중인 경우 (참여가능 인원이 999명 이하) }}
					<li class="eventPersonnel"><a href="/rsvp/attend/${idx}" class="eventButton" target="_blank">
					  <span><strong>${_remains}</strong>명 참여가능</span>
					  <span class="entered">참여하기</span>
					</a></li>
				{{else _remainsGTE1000}}{{! '온오프믹스 접수' 로 모집중인 경우 (참여가능 인원이 1000명 이상) }}
					<li class="eventPersonnel"><a href="/rsvp/attend/${idx}" class="eventButton" target="_blank">
					  <span><strong>999+</strong>명 참여가능</span>
					  <span class="entered">참여하기</span>
					</a></li>
				{{/if}}
			{{else}}
				{{if _remainsZero}}{{! '온오프믹스 접수' 로 모집중인 경우 (참여가능 인원이 0명) }}
					<li class="eventPersonnel"><a href="/rsvp/attend/${idx}" class="eventButton" target="_blank">
					  <span>정원 도달</span>
					  <span class="entered">대기자등록</span>
					</a></li>
				{{else}}
					<li class="eventPersonnel"><a href="/rsvp/attend/${idx}" class="eventButton" target="_blank">
					  <span>참여가능</span>
					  <span class="entered">참여하기</span>
					</a></li>
				{{/if}}
			{{/if}}
        {{/if}}
    {{else _isOutsideAndField}}{{! '외부접수' 와 '현장접수' 가 동시선택된 모임인 경우 }}
        <li class="eventPersonnel"><span class="disable">외부/현장 접수</span></li>
    {{else _isOutside}}{{! '외부접수' 모임인 경우 }}
        <li class="eventPersonnel"><span class="disable">외부 접수</span></li>
    {{else _isField}}{{! '현장접수' 모임인 경우 }}
        <li class="eventPersonnel"><span class="disable">현장 접수</span></li>
    {{/if}}
    </ul>
  </li>
  {{! FIXME }}
  <li class="eventGraph">
    <div class="eventGraphBar">
      <div class="eventStandby" style="width:${_widthStandby}%">
        <div class="eventAttend" style="width:${_widthAttend}%">
        </div>
      </div>
    </div>
  </li>
</ul>
</script><script type="text/x-query-tmpl" id="tmpl-15mainWing"><li>
  <a href="${defaultLink}" target="_blank">
    <p class="positionArea">
      <span class="borderBox"></span>
      <img src="${defaultImage}" alt="${defaultComment}" width="90" height="130">
    </p>
  </a>
</li></script><script type="text/x-query-tmpl" id="tmpl-15mainBottom"><li>
  <a href="${defaultLink}" target="_blank">
    <p class="positionArea">
      <span class="borderBox"></span>
      <img src="${defaultImage}" width="460" height="100" alt="${defaultComment}" />
    </p>
  </a>
</li></script><script type="text/x-query-tmpl" id="tmpl-15mainBranding"><li class="item">
	<div class="imgArea">
		<a href="${defaultLink}" target="_blank">
		<span class="borderArea"></span>
		<img src="${defaultImage}" width="216" height="125" /></a>
	</div>
	<p class="eventTitle"><a href="${defaultLink}" target="_blank">${defaultComment}</a></p>
</li></script><script type="text/x-query-tmpl" id="tmpl-15mainFocus"><li><a href="${defaultLink}" target="_blank" title="${defaultComment}">
	<span class="borderArea"></span>
	<img src="${defaultImage}" alt="${defaultComment}" width="75" height="75" /></a></li>
</script><script type="text/x-query-tmpl" id="tmpl-15mainRecommend"><li>
	<div class="imgArea"><a href="${defaultLink}" target="_blank"><span class="borderArea"></span><img src="${defaultImage}" width="75" height="75"/></a></div>
	<p class="eventTitle"><a href="${defaultLink}" target="_blank" title="${defaultComment}">${defaultComment}</a></p>
	<span class="eventDate">${timespan}</span>
	<span class="paymentType ${class_isFree}">${text_isFree}</span>
</li>
</script><script type="text/x-query-tmpl" id="tmpl-15eventMainSingle"></script><script type="text/x-query-tmpl" id="tmpl-15eventViewSide"><a class="eventLink" href='${defaultLink}' target='${defaultTarget}'>
  <div class="photoBorder"><img src="${defaultImage}" width="234" border="0" alt="${defaultComment}"/></div>
</a></script><script type="text/x-query-tmpl" id="tmpl-15eventViewBar"><div class="barBanner"><a href="${defaultLink}" target="${defaultTarget}"><img src="${defaultImage}" alt="${defaultComment}" width="664" /></a></div></script><script type="text/x-query-tmpl" id="tmpl-15eventViewAd"><a class="eventLink" href='${defaultLink}' target='${defaultTarget}'>
  <div class="photoBorder"><img src="${defaultImage}" width="265" border="0" alt="${defaultComment}" /></div>
</a></script><script type="text/x-query-tmpl" id="tmpl-15eventViewToast"><dl class="issue">
  <dt class="banner">
    <a href="${defaultLink}">
      <img src="${defaultImage}"/>
      <div class="bannerBorder"></div>
    </a>
  </dt>
  <dd class="subject"><a title="${defaultComment}" href="${defaultLink}">${defaultComment}</a></dd>
  <dd class="description">${additionalComment}</dd>
</dl></script><script type="text/x-query-tmpl" id="tmpl-15mainService"><li><a href="${defaultLink}" class="placeLink" target="_blank"><img src="${defaultImage}" width="221" height="82" alt="${defaultComment}" /></a></li></script><script type="text/x-query-tmpl" id="tmpl-15eventCreateBefore"><p class="serviceBanner">
  <a href="${defaultLink}" target="_blank"><img src="${defaultImage}" alt="${defaultComment}" /></a>
</p>
</script><script type="text/x-query-tmpl" id="tmpl-15eventCreateResult"><li class="${cssClass}"><a href="${defaultLink}" target="${defaultTarget}"><img src="${defaultImage}" alt="${defaultComment}" /></a></li></script><script type="text/x-query-tmpl" id="tmpl-15mainBranchEvent"><li>
  <a href="${defaultLink}" target="_blank">
    <p class="positionArea">
      <span class="borderArea"></span>
      <img src="${defaultImage}" alt="${defaultComment}"/>
      <span class="title ellipsis">${defaultComment}</span>
    </p>
  </a>
</li></script><script type="text/x-query-tmpl" id="tmpl-15mainBranchPlace"><li class="oneImg">
  <a href="${defaultLink}" target="_blank">
    <p class="positionArea">
      <span class="borderArea"></span>
      <img src="${defaultImage}" alt="${defaultComment}"/>
      <span class="title ellipsis">${defaultComment}</span>
      <span class="people ellipsis">{{html additionalComment}}</span>
    </p>
  </a>
</li></script><script type="text/x-query-tmpl" id="tmpl-15mainBranchMarket"><li class="oneImg">
  <a href="${defaultLink}" target="_blank">
    <p class="positionArea">
      <span class="borderArea"></span>
      <img src="${defaultImage}" alt="${defaultComment}"/>
      <span class="title ellipsis">${defaultComment}</span>
      <span class="price ellipsis">{{html additionalComment}}</span>
    </p>
  </a>
</li></script><script type="text/x-query-tmpl" id="tmpl-15eventViewToday"><dl class="issue ${cssClass}">
  <dt class="banner">
    <a href="${defaultLink}">
      <img src="${defaultImage}" alt="${defaultComment} 대표이미지"/>
      <div class="bannerBorder"></div>
    </a>
  </dt>
  <dd class="subject"><a title="${defaultComment}" href="${defaultLink}"><span class="dot2x2">▪</span>${defaultComment}</a></dd>
  <dd class="description">${additionalTimespan}</dd>
</dl></script>    <script type="text/javascript">
      // $.tmpl(key, ...) 형태로 사용할 템플릿을 미리 컴파일
      $(function() {
        $.template && $.each( {"noneToday":"tmpl.noneToday.txt","15headerSearch":"tmpl.15headerSearch.txt","15header":"tmpl.15header.txt","15mainTop":"tmpl.15mainTop.txt","15mainTopRoller":"tmpl.15mainTopRoller.txt","15mainRank":"tmpl.15mainRank.txt","15mainSide":"tmpl.15mainSide.txt","15mainToday":"tmpl.15mainToday.txt","15mainWing":"tmpl.15mainWing.txt","15mainBottom":"tmpl.15mainBottom.txt","15mainBranding":"tmpl.15mainBranding.txt","15mainFocus":"tmpl.15mainFocus.txt","15mainRecommend":"tmpl.15mainRecommend.txt","15eventMainSingle":"tmpl.15eventMainSingle.txt","15eventViewSide":"tmpl.15eventViewSide.txt","15eventViewBar":"tmpl.15eventViewBar.txt","15eventViewAd":"tmpl.15eventViewAd.txt","15eventViewToast":"tmpl.15eventViewToast.txt","15mainService":"tmpl.15mainService.txt","15eventCreateBefore":"tmpl.15eventCreateBefore.txt","15eventCreateResult":"tmpl.15eventCreateResult.txt","15mainBranchEvent":"tmpl.15mainBranchEvent.txt","15mainBranchPlace":"tmpl.15mainBranchPlace.txt","15mainBranchMarket":"tmpl.15mainBranchMarket.txt","15eventViewToday":"tmpl.15eventViewToday.txt"}, function(key,val) {
          var id='#tmpl-'+key;
          $.template(key, $(id));
        });
      });
    </script>
      <script type="text/javascript">
    // 모임정보가 출력된 페이지의 공통 스크립트
    $(function() {
            // 찜 상태 변경 호출
      var pinCall = null;
      $(document).on('click', '.todayEvent .eventBottomArea .eventPin a',  function(event) {
        event.preventDefault();
        var self = $(this);
        var item = self.closest('ul.todayEvent');
        var idx = parseInt( item.attr('_idx') );
        var pinNum = self.parent().find('span.pinNumber');
        var args = {
          url: base_apiUrl+'/event/pin/toggle'
          ,output: 'json'
          ,eventIdx: idx
        };
        if (item.hasClass('event-flag-pinned')) {
          args['url'] = base_apiUrl+'/event/pin/delete';
        } else {
          args['url'] = base_apiUrl+'/event/pin/add';
        }
        pinCall && pinCall.abort();
        pinCall = $.ajax({
          url: '/_/xmlProxy/xmlProxy.ofm'
          ,type: 'POST'
          ,data: args
          ,error: function(xhr, status, error) {
            if (status == 'timeout') {
              alert('서버와의 연결이 원활하지 않습니다. 잠시후에 다시 시도해주세요.');
            } else if (status == 'parsererror') {
              alert('서버의 동작이 원활하지 않습니다. 잠시후에 다시 시도해주세요.');
            }
          }
          ,success: function(data, status, xhr) {
            if (!data || !data.error) return false;
            if (data.error.code == 1) { alert(data.error.message); return false; }
            // 찜 목록 변경
            if (item.hasClass('event-flag-pinned')) {
              item.removeClass('event-flag-pinned');
              pinNum.text(Number(pinNum.text())-1);
            } else {
              item.addClass('event-flag-pinned');
              pinNum.text(Number(pinNum.text())+1);
            }
          }
          ,complete: function(xhr, status) {
          }
          ,dataType: 'json'
          ,timeout: 5000
        });
      });
          });
  </script>
  	<!--[if lte IE 6]>
	<table class="header">
		<thead>
		<tr class="ie6">
			<td class="left"></td>
			<td class="header-body">
				<div class="wrap">
					<p><strong>브라우저를 업그레이드</strong> 하면 개인정보와<br/>악성소프트웨어로 부터 컴퓨터를 안전하게 보호 할 수<br/>있으며 사이트 이용이 원활하게 이루어 질 수 있습니다.</p>
					<a class="upgrade" target="_blank" href="http://windows.microsoft.com/ko-KR/internet-explorer/download-ie" title="업그레이드 하기">업그레이드 하기</a><a class="close" href="#close" title="닫기">닫기</a>
				</div>
			</td>
			<td class="right"></td>
		</tr>
		</thead>
	</table>
	<![endif]-->
	<div id="header">
		<div class="headerArea">
			<div class="gnbMenu">
				<ul class="siteMenu">
					<li class="first"><a href="/event">모임</a></li>
					<li><a href="/place">플레이스</a></li>
					<li class="last"><a href="/market">마켓</a></li>
				</ul>
				<ul class="serviceMenu">
																	<li><a href="/account/logout">로그아웃</a></li>
																											<li class="btnMypage"><a href="/account/mypage"><span class="menuMypage">마이페이지</span></a></li>
					<li><a href="/service/">서비스안내</a></li>
					<li class="last"><a href="/cs/"><span class="menuCustomercenter">고객센터</span></a></li>
				</ul>
			</div>
						<div class="layerDetailMypage">
				<ul>
										<li><a href="/account/edit">회원정보수정</a></li>
					<li><a href="/account/pass">비밀번호변경</a></li>
					<li><a href="/account/event">모임참여내역</a></li>
					<li><a href="/account/payment">결제내역</a></li>
					<li><a href="/account/market">마켓이용내역</a></li>
									</ul>
			</div>
			<div class="logoSearchArea">
				<h1><a href="/"><img src="http://static.onoffmix.com/images3/global/logoOnoffmix.gif" alt="ONOFFMIX" /></a></h1>
				<fieldset>
					<legend>검색영역</legend>
					<ul class="searchArea">
						<li>
							<div>
								<form name="globalSearchForm" action="/event" method="GET">
									<input type="text" id="searchInput" title="키워드로 모임을 검색하세요" name="s" accesskey="s" />
									<input type="submit" class="btnSearch" value="검색" />
								</form>
							</div>
						</li>
						<li class="recommendationSearch"><span class="bulSearch"></span><a href="/cs/a/12977?url=http%3A%2F%2Fonoffmix.com%2Fevent%2F71605" target="_blank">미래플랜 프로젝트 1Day 워크샵</a></li>					</ul>
				</fieldset>
				<script type="text/x-jquery-tmpl" class="searchTemplate">
				<li class='ui-menu-item'>
					<p>
						<span class="img">
							<a href="${url}">
								<span class="positionArea">
									<span class="borderArea"></span>
									<img src="${thumbnail}" width="68" alt="" />
								</span>
							</a>
						</span>
						<span class="title"><a href="${url}">${title}</a></span>
						<span class="date">${data}</span>
					</p>
				<li>
				</script>
				<script type="text/x-jquery-tmpl" class="searchMoreTemplate">
					<li class='ui-menu-item last'>
						<p class="searchMoreArea">
							<span><a href="/event?s=${s}">검색결과 더보기</a></span>
						</p>
					<li>
				</script>
				<div class="headerBannerImg">
  <div class="positionArea">
    <p><a href="/cs/a/12984?url=http%3A%2F%2Fonoffmix.com%2Fevent%2F71841" target="_blank"><img src="http://cfile1.onoffmix.com/attach/xx7Sw2yuEHZljlOrNwV3MbwJeVhXkNwR" alt="[KBS1TV 명견만리 플러스] 디자인 싱킹 4부작 무료 강연 신청!!" /></a></p>
  </div>
</div>			</div>
		</div>
	</div>
<script type="text/javascript">
// http://phpjs.org/functions/htmlspecialchars/
function htmlspecialchars(string, quote_style, charset, double_encode) {   var optTemp = 0,     i = 0,     noquotes = false;   if (typeof quote_style === 'undefined' || quote_style === null) {     quote_style = 2;   }   string = string.toString();   if (double_encode !== false) {     string = string.replace(/&/g, '&amp;');   }   string = string.replace(/</g, '&lt;')     .replace(/>/g, '&gt;');   var OPTS = {     'ENT_NOQUOTES': 0,     'ENT_HTML_QUOTE_SINGLE': 1,     'ENT_HTML_QUOTE_DOUBLE': 2,     'ENT_COMPAT': 2,     'ENT_QUOTES': 3,     'ENT_IGNORE': 4   };   if (quote_style === 0) {     noquotes = true;   }   if (typeof quote_style !== 'number') {     quote_style = [].concat(quote_style);     for (i = 0; i < quote_style.length; i++) {       if (OPTS[quote_style[i]] === 0) {         noquotes = true;       } else if (OPTS[quote_style[i]]) {         optTemp = optTemp | OPTS[quote_style[i]];       }     }     quote_style = optTemp;   }   if (quote_style & OPTS.ENT_HTML_QUOTE_SINGLE) {     string = string.replace(/'/g, '&#039;');   }   if (!noquotes) {     string = string.replace(/"/g, '&quot;');   }   return string; }

  // 모임정보 출력
  function _print_event(e,extraClass) {
    if ($.isEmptyObject(e)) return '';
    if ($.isArray(extraClass)) extraClass = extraClass.join(' ');
    else if (typeof extraClass != 'string') extraClass = '';
    // 비밀 모임일 경우, 출력에 필요한 정보를 임의로 지정
    if (e.isSecret == 'y') {
      e.totalCapacity = e.totalCapacity || 0;
      e.totalAttend = e.totalAttend || 0;
      e.totalStandby = e.totalStandby || 0;
      e.eventStartDateTime = e.eventStartDateTime || '';
      e.eventEndDateTime = e.eventEndDateTime || '';
      e.recruitStartDateTime = e.recruitStartDateTime || '';
      e.recruitEndDateTime = e.recruitEndDateTime || '';
      e.location = e.location || '';
      e.wayOfRegistration = e.wayOfRegistration || ''; // was advance
    }
    // 값 검사하여 전처리
    var _now = time();
    if ('title' in e) {
      e.unquoted_title = String(e.title).replace(/&lt;/g,'<').replace(/&gt;/g,'>');
      e.quoted_title = htmlspecialchars(e.unquoted_title,'ENT_QUOTES');
    } else {
      e.title = e.unquoted_title = e.quoted_title = '';
    }
    if (!('bannerUrl' in e) || e.bannerUrl == null || e.bannerUrl == '') {
      e.bannerUrl = 'http://static.onoffmix.com/images2/default/thumbnail_null.jpg';
      extraClass = extraClass + ' event-flag-bannerless';
    }
    if ('isFeatured' in e && e.isFeatured == 'y') {
      extraClass = extraClass + ' event-flag-hot';
    }
    if ('isFree' in e && e.isFree == 'n') {
      //extraClass = extraClass + ' event-flag-charging';
    }
    if ('categoryIdx' in e && e.categoryIdx == 23
     && 'isFree' in e && e.isFree == 'n'
     && 'usePayment' in e && e.usePayment == 'y'
     && 'wayOfRegistration' in e && e.wayOfRegistration.search('advance')>-1
    ) {
      var isFunding = true;
      extraClass = extraClass + ' event-flag-funding';
    } else {
      var isFunding = false;
    }
    if (extraClass.search('event-mode-mini')==-1 || extraClass.search('event-flag-hot')>-1) {
      extraClass = extraClass.replace('event-flag-bannerless','');
    }
    if (_now < strtotime(e.recruitStartDateTime)) {
      extraClass = extraClass + ' event-flag-notyet';
    } else if (strtotime(e.eventEndDateTime) < _now) {
      extraClass = extraClass + ' event-flag-finished';
    } else if (strtotime(e.recruitEndDateTime) < _now) {
      extraClass = extraClass + ' event-flag-ended';
    }
    // 출력 부품
    var output_action = '<li class="event-action">';
    if (e.wayOfRegistration.search('advance')>-1) {
      // 후원금 모금용 출력의 경우 일부 차이 있음
      if (isFunding) {
        // 모집시작 전
        output_action = output_action + '<a class="event-action-notyet" title="모금 등록이 아직 시작되지 않았습니다."><span class="narrow">모금시작전</span><span class="wide">본 모임은 '+_relativeTime(e.recruitStartDateTime)+'에 모금이 시작됩니다.</span></a>';
        // 모임종료 후 (모집종료 보다 협소한 영역이므로 먼저 검사해야 함)
        output_action = output_action + '<a class="event-action-finished"><span class="narrow">모금종료</span><span class="wide">모금이 종료 되었습니다.</span></a>';
        // 모집종료 후
        output_action = output_action + '<a class="event-action-ended" title="모든 모금이 마감되었습니다.">모금마감</a>';
        // 등록 후 - 모임 정보만으로는 참가상태를 파악할 수 없음. 찜 상태와 마찬가지로 스크립트 상에서 처리해야 함
        output_action = output_action + '<a class="event-action-attending highlight" title="모금에 참여 하였습니다.">모금완료</a>';
      } else {
        // 모집시작 전
        output_action = output_action + '<a class="event-action-notyet" title="모임 등록이 아직 시작되지 않았습니다."><span class="narrow">등록시작전</span><span class="wide">본 모임은 '+_relativeTime(e.recruitStartDateTime)+'에 등록이 시작됩니다.</span></a>';
        // 모임종료 후 (모집종료 보다 협소한 영역이므로 먼저 검사해야 함)
        output_action = output_action + '<a class="event-action-finished"><span class="narrow">모임종료</span><span class="wide">모임이 종료 되었습니다.</span></a>';
        // 모집종료 후
        output_action = output_action + '<a class="event-action-ended" title="모든 등록이 마감되었습니다.">등록마감</a>';
        // 등록 후 - 모임 정보만으로는 참가상태를 파악할 수 없음. 찜 상태와 마찬가지로 스크립트 상에서 처리해야 함
        output_action = output_action + '<a class="event-action-attending highlight" title="모임에 참여 하였습니다.">등록완료</a>';
      }
      // 참여하기
      output_action = output_action + '<a class="event-action-attend" href="'+'/rsvp/attend/${eventIdx}'.replace('${eventIdx}',e.idx)+'"><span class="timestamp" _timestamp="'+strtotime(e.recruitEndDateTime)+'" _prefix="마감 &lt;span class=\'highlight\'&gt;" _suffix="&lt;/span&gt;" _direction="reverse"><!-- 평시에 보이고 mouseover 시에 숨겨짐 --></span>참여하기</a>';
    } else if (e.wayOfRegistration.search('field')>-1 && e.wayOfRegistration.search('outside')>-1) {
      output_action = output_action + '<a class="event-action-field event-action-outside"><span class="narrow"><span class="highlight">외부</span>, <span class="highlight">현장</span></span><span class="wide">본 모임은 <span class="highlight">외부접수</span>, <span class="highlight">현장등록</span> 모임입니다.</span></a>';
      extraClass = extraClass + ' event-flag-field event-flag-outside';
    } else if (e.wayOfRegistration.search('field')>-1) {
      output_action = output_action + '<a class="event-action-field"><span class="narrow highlight">현장등록</span><span class="wide">본 모임은 <span class="highlight">현장에서 모임등록</span>을 받습니다.</span></a>';
      extraClass = extraClass + ' event-flag-field';
    } else if (e.wayOfRegistration.search('outside')>-1) {
      output_action = output_action + '<a class="event-action-outside"><span class="narrow highlight">외부접수</span><span class="wide">본 모임은 <span class="highlight">외부접수</span> 모임입니다.</span></a>';
      extraClass = extraClass + ' event-flag-outside';
    }
    output_action = output_action + '<a class="event-action-pin" href="#pin">찜</a></li>';
    // 그래프 너비 계산
    if (isFunding) {
      if (e.totalFunded == 0 || e.totalFunding == 0) {
        graph_width_attend = 0;
      } else {
        if (e.totalFunded*1 > e.totalFunding*1) e.totalFunded_forRate = e.totalFunding;
        else e.totalFunded_forRate = e.totalFunded;
        graph_width_attend = e.totalFunded_forRate / e.totalFunding * 100;
        if (graph_width_attend > 100) graph_width_attend = 100;
      }
      var output_graph = '<li class="event-graph"><div class="event-graph-bar">';
      output_graph = output_graph + '<div class="event-capacity-attend" style="width:'+graph_width_attend+'%'+(graph_width_attend==0?';display:none':'')+'"><span>모금현황</span>';
      output_graph = output_graph + '</div></div>';
      output_graph = output_graph + '<div class="event-graph-text event-mode-full">* 총 목표금액 <span class="colon">:</span> <span class="number event-capacity-total">'+e.totalFunding.number_format()+'</span>명 <span class="bar">|</span> 현재모금금액 <span class="number event-capacity-attend">'+e.totalFunded.number_format()+'</span>원</div><div class="event-graph-text event-mode-mini">* ';
      // 모집시작 전
      output_graph = output_graph + '<span class="event-graph-text-notyet" title="모금 등록이 아직 시작되지 않았습니다.">모금 시작전</span>';
      // 모집 진행중
      output_graph = output_graph + '<span class="event-graph-text-ongoing" title="모금이 진행중입니다.">모금 진행중</span>';
      // 모집종료 후
      output_graph = output_graph + '<span class="event-graph-text-ended" title="모든 모금이 마감되었습니다.">모금 마감</span>';
      output_graph = output_graph + ' / &nbsp;현재 <span class="number">'+(e.totalFunding>0?Math.ceil(e.totalFunded/e.totalFunding*100).number_format():e.totalFunding)+'%</span>달성</div></li>';
    } else {
      e.totalSum = e.totalAttend*1+e.totalStandby*1;
      if (e.totalSum == 0) {
        graph_width_sum = 0;
        graph_width_attend = 0;
      } else {
        if (e.totalSum > e.totalCapacity) e.totalSum = e.totalCapacity;
        graph_width_sum = e.totalSum / e.totalCapacity * 100;
        if (graph_width_sum > 100) graph_width_sum = 100;
        graph_width_attend = e.totalAttend / e.totalSum * 100;
        if (graph_width_attend > 100) graph_width_attend = 100;
      }
      var output_graph = '<li class="event-graph"><div class="event-graph-bar">';
      output_graph = output_graph + '<div class="event-capacity-standby" style="width:'+graph_width_sum+'%'+(graph_width_sum==0?';display:none':'')+'"><span>대기자현황</span>';
      output_graph = output_graph + '<div class="event-capacity-attend" style="width:'+graph_width_attend+'%'+(graph_width_attend==0?';display:none':'')+'"><span>참여자현황</span>';
      output_graph = output_graph + '</div></div></div>';
      output_graph = output_graph + '<div class="event-graph-text event-mode-full">* 총 모집인원 <span class="colon">:</span> <span class="number event-capacity-total">'+e.totalCapacity.number_format()+'</span>명 <span class="bar">|</span> 현재참여자 <span class="number event-capacity-attend">'+e.totalAttend.number_format()+'</span>명 <span class="bar">|</span> 대기 <span class="number event-capacity-standby">'+e.totalStandby.number_format()+'</span>명</div><div class="event-graph-text event-mode-mini">* 현재 <span class="number">'+((e.totalCapacity-e.totalAttend)>0?(e.totalCapacity-e.totalAttend).number_format():0)+'</span>명 참여 가능</div></li>';
    }
    var _eventTimespan = _relativeTimespan(e.eventStartDateTime,e.eventEndDateTime,false);
    var _eventTimespanEscaped = _eventTimespan.replace(/([0-9]+)/g, '<span class="number">$1</span>');
    var _recruitTimespan = _relativeTimespan(e.recruitStartDateTime,e.recruitEndDateTime,false);
    var _recruitTimespanEscaped = _recruitTimespan.replace(/([0-9]+)/g, '<span class="number">$1</span>');
    if (extraClass.search('event-mode-compressed')>-1) {
      if (isFunding) {
        // 모금은 모집기간만
        var output_detail = '<li class="event-schedule">기간 : <span title="'+_recruitTimespan+'">'+_recruitTimespanEscaped+'</span></li>';
        // 모금은 장소 대신 목표금액
        output_detail = output_detail + '<li class="event-location">목표 <span class="colon">:</span> <span><b>'+e.totalFunding.number_format()+'</b> 원</span></li>';
      } else {
        var output_detail = '<li class="event-schedule">기간 : <span title="'+_eventTimespan+'">'+_eventTimespanEscaped+'</span></li><li class="event-schedule">등록 <span class="colon">:</span> <span title="'+_recruitTimespan+'">'+_recruitTimespanEscaped+'</span></li>';
        output_detail = output_detail + '<li class="event-location">장소 <span class="colon">:</span> <span title="'+$('<span/>').text(e.location).html()+'">'+e.location+'</span></li>';
      }
    // } else if (extraClass.search('event-mode-view')>-1) { // event-mode-view 형태는 스크립트에서 처리되지 않음
    } else if(extraClass.search('event-mode-view')>-1) {
      if (e.categoryIdx == 23) {
        // 모금은 모집기간만
        var output_detail = '<li class="event-schedule">모집기간 : <span title="'+_recruitTimespan+'">'+_recruitTimespanEscaped+'</span></li>';
        // 모금은 장소 대신 목표금액
        output_detail = output_detail + '<li class="event-location">목표금액 <span class="colon">:</span> <span><b>'+e.totalFunding.number_format()+'</b> 원</span></li>';
      } else {
        var output_detail = '<li class="event-schedule">모임기간 : <span title="'+_eventTimespan+'">'+_eventTimespanEscaped+'</span></li><li class="event-schedule">참여신청 <span class="colon">:</span> <span title="'+_recruitTimespan+'">'+_recruitTimespanEscaped+'</span></li>';
        output_detail = output_detail + '<li class="event-location">모임장소 <span class="colon">:</span> <span title="'+$('<span/>').text(e.location).html()+'">'+e.location+'</span></li>';
      }     
    } else {
      if (e.isSecret == 'y' && $.isEmptyObject(e.groups)) {
        var output_detail = '<li class="event-schedule">(비밀모임)</li>';
      } else {
        if (isFunding) {
          var output_detail = '<li class="event-schedule">기간 <span class="colon">:</span> <span title="'+$('<span/>').text(_recruitTimespan).html()+'">'+_recruitTimespanEscaped+'</span></li>';
          output_detail = output_detail + '<li class="event-location">목표 <span class="colon">:</span> <span><b>'+e.totalFunding.number_format()+'</b> 원</span></li>';
        } else {
          var output_detail = '<li class="event-schedule">기간 <span class="colon">:</span> <span title="'+$('<span/>').text(_eventTimespan).html()+'">'+_eventTimespanEscaped+'</span></li>';
          output_detail = output_detail + '<li class="event-location">장소 <span class="colon">:</span> <span title="'+$('<span/>').text(e.location).html()+'">'+e.location+'</span></li>';
        }
      }
    }
    // 출력
    if (e.isShowProgress&&e.isShowProgress!='y') output_graph='';
    var output = '<ul class="event-summary '+extraClass+'" _idx="'+e.idx+'"><li class="event-banner"><a class="event-link" href="'+e.eventUrl+'" target="_blank"><img src="'+e.bannerUrl+'" alt="'+e.unquoted_title+'" /><div class="event-banner-border"></div><span class="event-flag-hot"></span></a></li>';
    output = output + '<li class="event-title"><a class="event-link" href="'+e.eventUrl+'" target="_blank" title="'+e.unquoted_title+'">'+e.quoted_title+'</a></li>';
    if (extraClass.search('event-mode-mini')>-1) {
      output = output + output_action + output_graph + output_detail;
    } else if (extraClass.search('event-mode-compressed')>-1) {
      output = output + output_detail + output_action + output_graph;
    } else if (extraClass.search('event-mode-digest')>-1) {
      output = output + output_action;
    } else if (extraClass.search('event-mode-smallDigest')>-1) {
      //추가 출력 없음
    } else { // 지정 없거나 혹은 event-mode-full
      output = output + output_action + output_detail + output_graph;
    }
    output = output + '<li class="event-box-fixer"><!-- --></li></ul>';
    return output;
  } // _print_event

  // 참여 목록 변수 기본 설정
  if (typeof involvedEvents == 'undefined') involvedEvents = [];
  // 참여 상태 설정 (전체 출력 뒤에 후처리)
  function _postprocessInvolvedEvents(target) {
    if (involvedEvents.length == 0) return;
    if (typeof target == 'undefined') {
      $('.event-summary').each(function(index, obj) {
        var idx = parseInt( $(obj).attr('_idx') );
        $(obj).toggleClass('event-flag-attending', $.inArray(idx,involvedEvents)>-1);
      });
    } else {
      $(target).each(function(index, obj) {
        var idx = parseInt( $(obj).attr('_idx') );
        $(obj).toggleClass('event-flag-attending', $.inArray(idx,involvedEvents)>-1);
        // 개별 변경일 경우 (찜내역 페이지에서 제거 용도로 사용)
        $(obj).trigger('event-flag-changed');
      });
    }
  }
  // 찜 목록 변수 기본 설정
  if (typeof pinnedEvents == 'undefined') pinnedEvents = [];
  // 찜 상태 설정 (전체 출력 뒤에 후처리)
  function _postprocessPinnedEvents(target) {
    if (pinnedEvents.length == 0) return;
    if (typeof target == 'undefined') {
      $('.event-summary').each(function(index, obj) {
        var idx = parseInt( $(obj).attr('_idx') );
        $(obj).toggleClass('event-flag-pinned', $.inArray(idx,pinnedEvents)>-1);
      });
    } else {
      $(target).each(function(index, obj) {
        var idx = parseInt( $(obj).attr('_idx') );
        $(obj).toggleClass('event-flag-pinned', $.inArray(idx,pinnedEvents)>-1);
        // 개별 변경일 경우 (찜내역 페이지에서 제거 용도로 사용)
        $(obj).trigger('event-flag-changed');
      });
    }
  }
  // 모임정보가 출력된 페이지의 공통 스크립트
  $(function() {
    // 모임 상태 초기 설정
    _postprocessInvolvedEvents();
    _postprocessPinnedEvents();
    // 찜 상태 변경 호출
    var pinCall = null;
    $(document).on('click','.event-summary .event-action .event-action-pin',function(event) {
      event.preventDefault();
      var self = $(this);
      var idx = parseInt( self.closest('.event-summary').attr('_idx') );
      var args = {
        url: base_apiUrl+'/event/pin/toggle'
        ,output: 'json'
        ,eventIdx: idx
      };
      var posInList = $.inArray(idx,pinnedEvents);
      if (posInList>-1) {
        args['url'] = base_apiUrl+'/event/pin/delete';
      } else {
        args['url'] = base_apiUrl+'/event/pin/add';
      }
      pinCall && pinCall.abort();
      pinCall = $.ajax({
        url: '/_/xmlProxy/xmlProxy.ofm'
        ,type: 'POST'
        ,data: args
        ,error: function(xhr, status, error) {
          if (status == 'timeout') {
            alert('서버와의 연결이 원활하지 않습니다. 잠시후에 다시 시도해주세요.');
          } else if (status == 'parsererror') {
            alert('서버의 동작이 원활하지 않습니다. 잠시후에 다시 시도해주세요.');
          }
        }
        ,success: function(data, status, xhr) {
          if (!data || !data.error) return false;
          if (data.error.code == 1) { alert(data.error.message); return false; }
          // 찜 목록 변경
          if (posInList>-1) {
            delete pinnedEvents[posInList];
          } else {
            pinnedEvents[pinnedEvents.length] = idx;
          }
          // 찜 목록 변경에 따른 후처리
          _postprocessPinnedEvents( self.closest('.event-summary') );
        }
        ,complete: function(xhr, status) {
        }
        ,dataType: 'json'
        ,timeout: 5000
      });
    });
  // 참여상태 표시
  $('.event-graph-bar').on('mouseover','.event-capacity-attend',function(event) {
    $(event.target).children('span').show();
    return false;
  }).on('mouseout','.event-capacity-attend',function(event) {
    $(event.target).children('span').hide();
    return false;
  });
  $('.event-graph-bar').on('mouseover','.event-capacity-standby',function(event) {
    var left = $(event.target).children('.event-capacity-attend').width();
    if (left > 0) left = left + 1;
    $(event.target).children('span').css('margin-left', left).show();
    return false;
  }).on('mouseout','.event-capacity-standby',function(event) {
    $(event.target).children('span').hide();
    return false;
  });
});
</script>
<div class="content">
	<form action="/event/add" method="post" encType="multipart/form-data" class="innerBorder " name="writeForm" data-hpp-max="300000"
	      data-hpp-alert="그룹의 금액이 &lt;strong&gt;30만원 이상의 경우&lt;/strong&gt;에는 휴대전화 결제 설정이&lt;br /&gt;불가하여 휴대전화 결제 설정 배제 처리 됩니다.&lt;br /&gt;자세한 사항은 &lt;a href=&quot;/cs/faq/?fs=%ED%9C%B4%EB%8C%80%ED%8F%B0&quot; target=&quot;_blank&quot;&gt;FAQ&lt;/a&gt;를 확인해 주세요">
		<input type="hidden" name="proc" value="createBaseEvent"/>
		<input type="hidden" name="eventIdx" value="0"/>
		<input type="hidden" name="banner" value=""/>
		<input type="hidden" name="eventPreviewUrl" value="/event/preview/0" target="_blank"/>
		<input type="hidden" name="bannerUrl" value=""/>
		<input type="hidden" name="bannerDelete" value="0"/>

		<h2 class="title">모임설정</h2>

		<div class="roundBox firstStep">
			<div class="firstCore">
				<div class="title">
					<h3 class="title">step.1 모임 기본 정보입력</h3>

					<div class="menu">
						<a class="firstStep" href="#firstStep">STEP.1</a><a class="secondStep" href="#secondStep">STEP.2</a><a class="lastStep" href="#lastStep">STEP.3</a>
					</div>
				</div>
			</div>
			<div class="core category">
				<div class="input">
					<div class="subCore category">
						<h4 class="subTitle">카테고리 / 제목 입력 <span class="star">*</span></h4>
						<select class="category" name="category">
							<option value="">카테고리 선택</option>
							<option value="85">교육</option><option value="86">강연</option><option value="87">세미나/컨퍼런스</option><option value="88">문화/예술</option><option value="89">방송/연예</option><option value="90">취미활동</option><option value="91">소모임/친목행사</option><option value="92">공모전</option><option value="93">전시/박람회</option><option value="94">패션/뷰티</option><option value="95">이벤트/파티</option><option value="97">여행</option><option value="23">후원금 모금</option><option value="96">기타</option>						</select><input id="title" type="text" name="title" value="모임제목 입력" title="모임제목 입력" maxlength="64" class="text"/>

						<div class="lengthMsg">&nbsp;</div>
					</div>
				</div>
				<div class="advice focus">
					<p class="subAdvice">
						<strong>카테고리를 선택</strong>하고 <strong>모임제목</strong>을 입력해주세요.
						<br/>
						<br/>
						카테고리에 맞게 설정하시면 개설 후 검색이나<br/>
						카테고리별로 보기 편하고 쉽게 찾을 수 있습니다.<br/>
						<br/>
					</p>
				</div>
			</div>
			<div class="core">
				<div class="input">
					<div class="subCore banner noBanner">
						<h4 class="subTitle">대표 이미지 <span class="star">*</span></h4>

						<div class="innerBanner">
							<img src="http://static.onoffmix.com/images2/default/thumbnail_null.jpg" default="http://static.onoffmix.com/images2/default/thumbnail_null.jpg" alt="대표이미지"/>

							<div class="bannerBorder">
								<div class="changeBox">
                  <span>
                    <a class="change" id="changeUserPhoto" href="#changeUserPhoto">사진변경</a>
                    <a class="delete" href="#deleteUserPhoto">삭제하기</a>
                  </span>
									&nbsp;
								</div>
							</div>
						</div>
						<a class="recommend" href="#recommenBox">추천이미지 보기</a>

						<div class="recommendBox none">
							<p class="closeRecommend"><span class="closeBtn"></span></p>
							<ul>
								<li class="first">
									<label for="banner-recommend-1" class="innerBanner">
										<img src="http://static.onoffmix.com/images2/bannerPreset/thumbnail_01.jpg" border="0" alt="추천이미지1 초대합니다"/>

										<div class="bannerBorder"><!-- --></div>
										<input id="banner-recommend-1" type="radio" name="bannerSelection" value="http://static.onoffmix.com/images2/bannerPreset/thumbnail_01.jpg"/>
									</label>
								</li
								>
								<li class="second">
									<label for="banner-recommend-2" class="innerBanner">
										<img src="http://static.onoffmix.com/images2/bannerPreset/thumbnail_02.jpg" border="0" alt="추천이미지2 우리 만나요~"/>

										<div class="bannerBorder"><!-- --></div>
										<input id="banner-recommend-2" type="radio" name="bannerSelection" value="http://static.onoffmix.com/images2/bannerPreset/thumbnail_02.jpg"/>
									</label>
								</li
								>
								<li class="third">
									<label for="banner-recommend-3" class="innerBanner">
										<img src="http://static.onoffmix.com/images2/bannerPreset/thumbnail_03.jpg" border="0" alt="추천이미지3 함께해요"/>

										<div class="bannerBorder"><!-- --></div>
										<input id="banner-recommend-3" type="radio" name="bannerSelection" value="http://static.onoffmix.com/images2/bannerPreset/thumbnail_03.jpg"/>
									</label>
								</li>
							</ul><span class="imgAdvice">대표 이미지가 없다면 <br/>온오프믹스에서<br/>제공하는 <ins>추천 이미지</ins>를 선택해 주세요.</span>
						</div>
					</div>
					<div class="subCore abstract">
						<h4 class="subTitle">요약내용 입력 <span class="star">*</span></h4>
						<textarea id="abstract" class="text" title="모임 내용을 간단히 요약하여 입력해 주세요." name="abstract"></textarea>
					</div>
				</div>
				<div class="advice">
					<p class="subAdvice">
						모임 특성에 맞는 이미지로 업로드 해주시고 <br/>
						대표 이미지가 없을 경우 온오프믹스에서 <br/>
						추천하는 이미지를 선택해 사용할 수 있습니다. <br/>
						<br/>
						이미지 등록에 대한 안내는 <a href="/cs/faq/host#167" class="guideSite" target="_blank">FAQ</a> 를 참고하세요.
					</p>

					<p class="subAdvice abstract">
						개설하는 모임의 주요내용을 참여자들이 <br/>
						쉽게 알 수 있도록 <strong>요약하여 입력</strong>해 주세요.
					</p>
				</div>
			</div>
			<div class="core contents">
				<div class="input write">
					<div class="subCore">
						<h4 class="subTitle">상세내용 입력 <span class="star">*</span></h4>

						<div class="editor">
							<textarea id="content" class="content" name="content"></textarea>
							<button class="attach" id="attachToContent">사진 / 파일 첨부하기</button>
						</div>
					</div>
				</div>
				<div class="advice">
					<p class="subAdvice">
						개설하는 모임의 <strong>상세내용을 입력</strong>하고 편집기를<br/>
						이용해 다양한 형태의 내용을 입력해 주세요.<br/>
						<br/>
						사진/파일 첨부에 대한 안내는 <a href="/cs/faq/host#168" class="guideSite" target="_blank">FAQ</a> 를 참고하세요.
					</p>
				</div>
			</div>
			<div class="core registration">
				<div class="input">
					<div class="subCore">
						<h4 class="subTitle">참여자 등록방법 설정 <span class="star">*</span></h4>
						<span class="tip">* 개설 후 <strong>참여 등록 방법 변경은 불가능</strong>하며 변경을 원하실 경우 모임을 새로 개설해야 하니 신중히 선택해주세요.</span>
						<label for="advance"><input id="advance" type="checkbox" class="checkbox" value="advance" name="wayOfRegistration[]"/> 온오프믹스를 통한 참여 등록</label>
						<label for="field"><input id="field" type="checkbox" class="checkbox" value="field" name="wayOfRegistration[]"/> 모임 현장에서 직접 참여 등록</label>
						<label class="outside" for="outside"><input id="outside" type="checkbox" class="checkbox" value="outside" name="wayOfRegistration[]"/> 외부 참여 등록</label><input type="text" class="text disabled" id="outsideUrl" name="outsideRegistrationUrl"
						                                                                                                                                                              value="외부참여 등록만 선택한 경우 URL주소 입력이 가능합니다." titleEnabled="외부참여 URL주소가 있다면 입력해 주세요 (사이트, 카페, 블로그 등)"
						                                                                                                                                                              titleDisabled="외부참여 등록만 선택한 경우 URL주소 입력이 가능합니다." title="외부참여 등록만 선택한 경우 URL주소 입력이 가능합니다."/>
					</div>
				</div>
				<div class="advice">
					<p class="subAdvice">
						개설하려는 모임의 <strong>참여자 등록 방법</strong>을 선택해<br/> 주세요.<br/>
						<br/>
						개설은 하지만 참여 등록을 온오프믹스가 아닌<br/>
						외부페이지나 별도의 다른 등록 방법을 원하시면<br/>
						외부 참여 등록을 선택해 주시고 사이트 주소가<br/>
						있으시면 입력창에 입력하세요.<br/>
						<br/>
						영문형식(한글 도메인 불가)의 사이트 주소만<br/>
						가능하며, 개설 이후에는 주소를 변경하실 수<br/>
						없습니다.
					</p>
				</div>
			</div>
			<div class="core isFree">
				<div class="input">
					<div class="subCore isFree">
						<h4 class="subTitle">유/무료 선택 <span class="star">*</span></h4>
						<!-- <input class="noChecked" type="radio" name="isFree" value="" /> -->
						<input id="free" class="radio" type="radio" name="isFree" value="1"/><label for="free">무료모임</label><input id="pay" class="radio" type="radio" name="isFree" value="0"/><label for="pay">유료모임</label>
					</div>
				</div>
				<div class="advice">
					<p class="subAdvice">
						모임의 <strong>유/무료</strong>를 선택해주세요.<br/>
						<br/>
						개설 이후에는 변경할 수 없습니다.
					</p>
				</div>
			</div>
			<div class="core groups">
				<div class="input">
					<div class="subCore usePayment usePayment1" style="display:none">
						<h4 class="subTitle">결제방식 선택 <span class="star">*</span></h4>
						<input class="radio" type='radio' name='usePayment' id='usePayment1' value='1' disabled="disabled" checked="checked"/><label for='usePayment1'>온오프믹스 결제서비스 이용</label>
						<input class="radio" type='radio' name='usePayment' id='usePayment0' value='0' disabled="disabled"/><label for='usePayment0'>개설자 통장입금 결제</label>						<span class="tip" style="display: block;">* 온오프믹스 결제서비스를 선택하면, 모임 개설 완료 후에 <strong>결제 방식을 변경하실 수 없습니다.</strong></span>
							<span class="multilineTip">* 온오프믹스는 세금계산서를 발행하지 않으며 세무신고의 책임은 개설자에게 있습니다.<br />
								자세한 내용은 <a href="/cs/faq/host#244" target="_blank">FAQ</a>를 확인하세요.
							</span>
						<div class="innerCore">
							<dl class="usePayment1">
								<dt>온라인 결제</dt>
								<dd>
									<input type='checkbox' name='wayOfPayment[]' id='wayOfPayment3' value='Card' checked='checked' 									/><label for='wayOfPayment3'>신용카드</label
									><input type='checkbox' name='wayOfPayment[]' id='wayOfPayment1' value='DirectBank' 									/><label for='wayOfPayment1'>실시간 계좌이체</label
									><input type='checkbox' name='wayOfPayment[]' id='wayOfPayment2' value='VBank' 									/><label for='wayOfPayment2'>가상계좌</label>
								</dd>
								<dt>오프라인 결제</dt>
								<dd>
									<input type='checkbox' name='wayOfPayment[]' id='wayOfPayment4' class="wayOfPayment4" value='FieldCard' 									/><label for='wayOfPayment4' class="wayOfPayment4">온오프믹스 지원 현장결제 (도우미 + 카드단말기 지원)</label
									><input type='checkbox' name='wayOfPayment[]' id='wayOfPayment0' value='Field' 									/><label for='wayOfPayment0'>모임 행사장 현금결제</label>
								</dd>
								<dt>모바일 결제</dt	>
								<dd>
									<input type='checkbox' name='wayOfPayment[]' id='wayOfPayment5' value='HPP' 									/><label for='wayOfPayment5'>휴대전화</label>
								</dd>
								<dd class="tip">
									<ul>
										<li>* 결제수단별 <strong>수수료와 정산시기는 상이하며</strong> 자세한 사항은 <strong>결제/정산 규정</strong> 안내를 확인하세요.
											<a class="tooltip" href="/legal/paymentAgreement" target="_blank" title="결제서비스 이용안내 입니다.&lt;br /&gt;자세히 보려면 클릭 해 주세요.">?</a></li>
										<li>* 휴대전화 결제의 경우 결제 수단의 특성으로 인하여 결제 진행시 제약이 있을 수 있습니다.<br />
											자세한 내용은 <a href="/cs/faq/?fs=%ED%9C%B4%EB%8C%80%ED%8F%B0" target="_blank">FAQ</a>를 확인하세요.
										</li>
									</ul>
								</dd>
							</dl>
							<!-- .usePayment1 end -->
							<dl class="usePayment0">
								<dd>
									<label for="incomingBankCode" class="bankCode">은행명</label
									><select id="incomingBankCode" name="incomingBankCode">
																					<option value="00">거래은행을 선택해 주세요</option>
																					<option value="03">기업은행</option>
																					<option value="04">국민은행</option>
																					<option value="05">외환은행</option>
																					<option value="07">수협중앙회</option>
																					<option value="11">농협중앙회</option>
																					<option value="20">우리은행</option>
																					<option value="23">SC제일은행</option>
																					<option value="31">대구은행</option>
																					<option value="32">부산은행</option>
																					<option value="34">광주은행</option>
																					<option value="37">전북은행</option>
																					<option value="39">경남은행</option>
																					<option value="48">신협</option>
																					<option value="53">한국씨티은행</option>
																					<option value="71">우체국</option>
																					<option value="81">하나은행 (하나,외환)</option>
																					<option value="88">신한은행 (신한,조흥)</option>
																			</select
									><label for="incomingBankNumber" class="bankNumber">계좌번호</label
									><input id="incomingBankNumber" class="text" type="text" name="incomingBankNumber" value="" maxlength="24"
									/><label for="incomingBankOwner" class="bankOwner">예금주</label
									><input id="incomingBankOwner" class="bankOwner text" type="text" name="incomingBankOwner" value="" maxlength="16"/>
								</dd>
								<dd class="tip">* 참여자의 <strong>세금관련 처리와 취소/환불</strong>에 대한 모든 <strong>책임권한은 개설자에게</strong> 있습니다.</dd>
							</dl>
							<!-- .usePayment0 end -->
						</div>
						<!-- .innerCore end -->
					</div>
					<!-- .subCore.usePayment end -->
					<div class="subCore funding">
						<h4 class="subTitle"><label for="totalFunding" class="totalFunding">목표금액 설정</label> <span class="star">*</span></h4><input id="totalFunding" class="text mask-pint totalFunding" maxlength="9" type="text" name="totalFunding" value=""/>원
					</div>
					<div class="subCore groups">
						<h4 class="subTitle">그룹설정 <span class="star">*</span></h4>
						<table width="100%" cellpadding="0" cellspacing="0">
							<tbody id="groupManage" class="disabled">
							<tr>
								<th class="group_name">접수 그룹명</th>
								<th class="group_num">참여인원</th>
								<th class="group_type">참여선정 방법</th>
								<th class="group_sum">참가비용</th>
								<th class="group_member">동반인원</th>
								<th></th>
							</tr>
															<tr class="group">
									<td class="name">
										<input type="hidden" class="groupIdx" value="0" name="groupIdx[0]"/>
										<input type="hidden" value="1" name="groupisShowAttend[0]"/>
										<input type="hidden" value="1" name="groupisShowStandby[0]"/>
										<input type="hidden" value="0" name="groupisShowPrivate[0]"/>
										<label for="groupName[0]" class="displayNone">그룹명 입력</label><input id="groupName[0]" type="text" class="text groupName" name="groupName[0]" value="기본그룹" maxlength="16"/>
									</td>
									<td class="num">
										<label for="groupCapacity[0]" class="displayNone">참여인원 입력</label><input maxlength="4" type="text" class="text groupCapacity mask-pint" id="groupCapacity[0]" value="" name="groupCapacity[0]"/>명
									</td>
									<td class="type">
										<select name="groupAuthorizeType[0]" class="line groupAuthorizeType">
											<option value="orderOfArrival" selected="selected">선착순</option>
											<option value="selection" >개설자선정</option>
										</select>
									</td>
									<td class="sum">
										<label for="groupExpense[0]" class="displayNone">참여금액 입력</label><input type="text" maxlength="8" class="text groupExpense mask-pint" id="groupExpense[0]" value=""
										                                                                                 name="groupExpense[0]" disabled="disabled" />원
									</td>
									<td class="member">
										<select name="groupMemberPerAttend[0]" class="line groupMemberPerAttend">
											<option value="1">없음</option><option value="2">본인포함 2명</option><option value="3">본인포함 3명</option><option value="4">본인포함 4명</option><option value="5">본인포함 5명</option><option value="6">본인포함 6명</option><option value="7">본인포함 7명</option><option value="8">본인포함 8명</option><option value="9">본인포함 9명</option><option value="10">본인포함 10명</option><option value="15">본인포함 15명</option><option value="20">본인포함 20명</option><option value="25">본인포함 25명</option><option value="30">본인포함 30명</option><option value="35">본인포함 35명</option><option value="40">본인포함 40명</option>										</select>
									</td>
									<td>
																			</td>
								</tr>
															<script class="template group" type="x-jquery-tmpl">
                <tr class="group">
                  <td class="name">
                    <input type="hidden" class="groupIdx" value="${idx}" name="groupIdx[${key}]" />
                    <input type="hidden" value="${attend}" name="groupisShowAttend[${key}]" />
                    <input type="hidden" value="${standby}" name="groupisShowStandby[${key}]" />
                    <input type="hidden" value="${priv}" name="groupisShowPrivate[${key}]" />
                    <input type="text" value="${name}" class="text groupName" id="groupName[${key}]" name="groupName[${key}]"  maxlength="16" />
                  </td>
                  <td class="num">
                    <input maxlength="4" type="text" class="text groupCapacity mask-pint" id="groupCapacity[${key}]" value="${capacity}" name="groupCapacity[${key}]" />명
                  </td>
                  <td class="type">
                    <select name="groupAuthorizeType[${key}]" class="line groupAuthorizeType" value="${authorize}">
                      <option {{if $item.checkUsePayment(1)==0}}selected="selected"{{/if}} value="orderOfArrival">선착순</option>
                      <option {{if $item.checkUsePayment(0)==0}}selected="selected"{{/if}} value="selection">개설자선정</option>
                    </select>
                  </td>
                  <td class="sum">
                    <input type="text" maxlength="8" class="text groupExpense mask-pint" id="groupExpense[${key}]" value="${expense}" name="groupExpense[${key}]"
                    {{if $item.modifiable()==0}}disabled="disabled"{{/if}} />원
                  </td>
                  <td class="member">
                    <select name="groupMemberPerAttend[${key}]" class="line groupMemberPerAttend">
                      <option value="1">없음</option><option value="2">본인포함 2명</option><option value="3">본인포함 3명</option><option value="4">본인포함 4명</option><option value="5">본인포함 5명</option><option value="6">본인포함 6명</option><option value="7">본인포함 7명</option><option value="8">본인포함 8명</option><option value="9">본인포함 9명</option><option value="10">본인포함 10명</option><option value="15">본인포함 15명</option><option value="20">본인포함 20명</option><option value="25">본인포함 25명</option><option value="30">본인포함 30명</option><option value="35">본인포함 35명</option><option value="40">본인포함 40명</option>                    </select>
                  </td>
                  <td>
                  {{if this.data.removable!=0}}<a trid="${key}" href="#delete" class="remove" title="삭제">삭제</a>{{/if}}
                  </td>
                </tr>


								</script>
							</tbody>
							<tfoot>
							<tr>
								<td colspan="6">
									<a href="#groupAdd" class="add">그룹추가</a>
								</td>
							</tr>
							</tfoot>
						</table>
					</div>
					<!-- .subSore.groups end -->
					<div class="lastCore">
						<div class="saveMsg"></div>
						<div class="action">
															<a href="#secondStep" class="next button">다음단계</a><a class="temp button" href="#temp"><span>임시저장</span></a>
													</div>
					</div>
					<!-- .lastCore end -->
				</div><!-- .input end --><div class="advice">
					<p class="subAdvice usePayment isTaxFree" style="display:none">
						개설자 통장입금 결제를 선택할 경우 통장정보는<br/>
						개설 완료 후 <strong>모임관리</strong> / <strong>결제기능 설정</strong>에서<br/>
						입력 가능합니다.
						<br/>
						<br/>온오프믹스 지원 현장결제는 별도의<br/>
						비용이 발생합니다. (도우미 + 카드단말기 지원)<br/>
						자세한 내용은 <a class="featurePayment" href="/service/feature/payment/" target="_blank">FAQ</a> 에서 확인하세요.<br/>
						<br/>온오프믹스 결제서비스를 선택하면<br/>
						개설을 완료한 이후에 개설자 통장입금 방식으로<br/>
						변경하실 수 없습니다.
					</p>

					<p class="subAdvice funding">
						<strong>후원금 모금으로</strong> 모임을 개설 하시나요?<br/>
						총 <strong>목표금액</strong>을 설정 해 주세요.(숫자 입력)
					</p>

					<p class="subAdvice groups">
						그룹별로 <strong>참여인원</strong>, <strong>결제금액</strong>을 각각<br/>
						설정할 수 있습니다.<br/>
						<br/>
						접수그룹은 하나일 경우 기본그룹이며<br/>
						두 개 이상 만들 경우 그룹 명을 각각<br/>
						입력해주세요.<br/>
						<br/>
						모임을 선착순 접수 또는 개설자가 선정하는<br/>
						개설자선정 방식으로 접수 받을 것인지를<br/>
						선택해 주세요.<br/>
						<br/>
						그룹을 추가하려면 하단의 <strong>그룹추가</strong> 버튼을<br/>
						눌러주세요.<br/>
						<br/>
						동반인원은 <strong>참여자 본인 포함</strong> 다수의 인원을<br/>
						참여할 수 있도록 설정하는 부분입니다.<br/>
						(예: 5명 설정시 본인 포함 5명까지<br/>
						&nbsp;동반 참여신청 가능)
					</p>
				</div>
			</div>
		</div>
		<!--firstStep end-->
		<div class="roundBox secondStep">
			<div class="firstCore">
				<div class="title">
					<h3 class="title">step.2 일정 / 장소 정보 입력</h3>

					<div class="menu">
						<a class="firstStep" href="#firstStep">STEP.1</a><a class="secondStep" href="#secondStep">STEP.2</a><a class="lastStep" href="#lastStep">STEP.3</a>
					</div>
				</div>
			</div>
			<div class="core eventDate">
				<div class="input">
					<div class="subCore startEvent singleDay">
						<h4 class="subTitle">모임기간 설정 <span class="star">*</span><label class="days" for="eventEndCheck"><input id="eventEndCheck" type="checkbox" class="checkbox" name="eventMultiDay"
						                                                                                                       value="y"  />모임기간이 하루이상일경우</label></h4>

						<div class="dateConfig">
							<input type="hidden" name="eventEndDateInUse" value="y"/>
							<input type="hidden" name="eventStartDateTime" value="2016-07-01 21:30"/>
							<input type="hidden" name="eventEndDateTime" value="2016-07-01 22:00"/>
							<label for="startEventDate" class="displayNone">모임시작 날짜설정</label>
							<input id="startEventDate" class="text datepicker" type="text" name="eventStartDateTime_date" value="2016-07-01"/>
							<select class="date-select" name="eventStartDateTime_time">
								<option value='00:00'>오전 0시 00분 (자정)</option>
<option value='00:30'>오전 0시 30분</option>
<option value='01:00'>오전 1시 00분</option>
<option value='01:30'>오전 1시 30분</option>
<option value='02:00'>오전 2시 00분</option>
<option value='02:30'>오전 2시 30분</option>
<option value='03:00'>오전 3시 00분</option>
<option value='03:30'>오전 3시 30분</option>
<option value='04:00'>오전 4시 00분</option>
<option value='04:30'>오전 4시 30분</option>
<option value='05:00'>오전 5시 00분</option>
<option value='05:30'>오전 5시 30분</option>
<option value='06:00'>오전 6시 00분</option>
<option value='06:30'>오전 6시 30분</option>
<option value='07:00'>오전 7시 00분</option>
<option value='07:30'>오전 7시 30분</option>
<option value='08:00'>오전 8시 00분</option>
<option value='08:30'>오전 8시 30분</option>
<option value='09:00'>오전 9시 00분</option>
<option value='09:30'>오전 9시 30분</option>
<option value='10:00'>오전 10시 00분</option>
<option value='10:30'>오전 10시 30분</option>
<option value='11:00'>오전 11시 00분</option>
<option value='11:30'>오전 11시 30분</option>
<option value='12:00'>오후 0시 00분 (정오)</option>
<option value='12:30'>오후 0시 30분</option>
<option value='13:00'>오후 1시 00분</option>
<option value='13:30'>오후 1시 30분</option>
<option value='14:00'>오후 2시 00분</option>
<option value='14:30'>오후 2시 30분</option>
<option value='15:00'>오후 3시 00분</option>
<option value='15:30'>오후 3시 30분</option>
<option value='16:00'>오후 4시 00분</option>
<option value='16:30'>오후 4시 30분</option>
<option value='17:00'>오후 5시 00분</option>
<option value='17:30'>오후 5시 30분</option>
<option value='18:00'>오후 6시 00분</option>
<option value='18:30'>오후 6시 30분</option>
<option value='19:00'>오후 7시 00분</option>
<option value='19:30'>오후 7시 30분</option>
<option value='20:00'>오후 8시 00분</option>
<option value='20:30'>오후 8시 30분</option>
<option value='21:00'>오후 9시 00분</option>
<option value='21:30' selected='selected'>오후 9시 30분</option>
<option value='22:00'>오후 10시 00분</option>
<option value='22:30'>오후 10시 30분</option>
<option value='23:00'>오후 11시 00분</option>
<option value='23:30'>오후 11시 30분</option>
							</select>
							<span class="space">부터</span>
							<label for="endEventDate" class="displayNone">모임종료 날짜설정</label>
							<input id="endEventDate" class="text datepicker" type="text" name="eventEndDateTime_date" value="2016-07-01" style="display:none" />
							<select class="date-select" name="eventEndDateTime_time">
								<option value='00:00'>오전 0시 00분 (자정)</option>
<option value='00:30'>오전 0시 30분</option>
<option value='01:00'>오전 1시 00분</option>
<option value='01:30'>오전 1시 30분</option>
<option value='02:00'>오전 2시 00분</option>
<option value='02:30'>오전 2시 30분</option>
<option value='03:00'>오전 3시 00분</option>
<option value='03:30'>오전 3시 30분</option>
<option value='04:00'>오전 4시 00분</option>
<option value='04:30'>오전 4시 30분</option>
<option value='05:00'>오전 5시 00분</option>
<option value='05:30'>오전 5시 30분</option>
<option value='06:00'>오전 6시 00분</option>
<option value='06:30'>오전 6시 30분</option>
<option value='07:00'>오전 7시 00분</option>
<option value='07:30'>오전 7시 30분</option>
<option value='08:00'>오전 8시 00분</option>
<option value='08:30'>오전 8시 30분</option>
<option value='09:00'>오전 9시 00분</option>
<option value='09:30'>오전 9시 30분</option>
<option value='10:00'>오전 10시 00분</option>
<option value='10:30'>오전 10시 30분</option>
<option value='11:00'>오전 11시 00분</option>
<option value='11:30'>오전 11시 30분</option>
<option value='12:00'>오후 0시 00분 (정오)</option>
<option value='12:30'>오후 0시 30분</option>
<option value='13:00'>오후 1시 00분</option>
<option value='13:30'>오후 1시 30분</option>
<option value='14:00'>오후 2시 00분</option>
<option value='14:30'>오후 2시 30분</option>
<option value='15:00'>오후 3시 00분</option>
<option value='15:30'>오후 3시 30분</option>
<option value='16:00'>오후 4시 00분</option>
<option value='16:30'>오후 4시 30분</option>
<option value='17:00'>오후 5시 00분</option>
<option value='17:30'>오후 5시 30분</option>
<option value='18:00'>오후 6시 00분</option>
<option value='18:30'>오후 6시 30분</option>
<option value='19:00'>오후 7시 00분</option>
<option value='19:30'>오후 7시 30분</option>
<option value='20:00'>오후 8시 00분</option>
<option value='20:30'>오후 8시 30분</option>
<option value='21:00'>오후 9시 00분</option>
<option value='21:30'>오후 9시 30분</option>
<option value='22:00' selected='selected'>오후 10시 00분</option>
<option value='22:30'>오후 10시 30분</option>
<option value='23:00'>오후 11시 00분</option>
<option value='23:30'>오후 11시 30분</option>
							</select>
							까지
						</div>
					</div>
					<div class="subCore setupTime">
						<h4 class="subTitle">참여신청기간 설정 <span class="star">*</span></h4>

						<div class="dateConfig">
							<input type="hidden" name="recruitStartDateInUse" value="y"/>
							<input type="hidden" name="recruitStartDateTime" value="2016-06-30 21:30"/>
							<input type="hidden" name="recruitEndDateTime" value="2016-07-01 21:00"/>
							<label for="startAcceptDate" class="displayNone">모임등록시작 날짜설정</label>
							<input id="startAcceptDate" class="text datepicker" type="text" name="recruitStartDateTime_date" value="2016-06-30"/>
							<select class="date-select" name="recruitStartDateTime_time">
								<option value='00:00'>오전 0시 00분 (자정)</option>
<option value='00:30'>오전 0시 30분</option>
<option value='01:00'>오전 1시 00분</option>
<option value='01:30'>오전 1시 30분</option>
<option value='02:00'>오전 2시 00분</option>
<option value='02:30'>오전 2시 30분</option>
<option value='03:00'>오전 3시 00분</option>
<option value='03:30'>오전 3시 30분</option>
<option value='04:00'>오전 4시 00분</option>
<option value='04:30'>오전 4시 30분</option>
<option value='05:00'>오전 5시 00분</option>
<option value='05:30'>오전 5시 30분</option>
<option value='06:00'>오전 6시 00분</option>
<option value='06:30'>오전 6시 30분</option>
<option value='07:00'>오전 7시 00분</option>
<option value='07:30'>오전 7시 30분</option>
<option value='08:00'>오전 8시 00분</option>
<option value='08:30'>오전 8시 30분</option>
<option value='09:00'>오전 9시 00분</option>
<option value='09:30'>오전 9시 30분</option>
<option value='10:00'>오전 10시 00분</option>
<option value='10:30'>오전 10시 30분</option>
<option value='11:00'>오전 11시 00분</option>
<option value='11:30'>오전 11시 30분</option>
<option value='12:00'>오후 0시 00분 (정오)</option>
<option value='12:30'>오후 0시 30분</option>
<option value='13:00'>오후 1시 00분</option>
<option value='13:30'>오후 1시 30분</option>
<option value='14:00'>오후 2시 00분</option>
<option value='14:30'>오후 2시 30분</option>
<option value='15:00'>오후 3시 00분</option>
<option value='15:30'>오후 3시 30분</option>
<option value='16:00'>오후 4시 00분</option>
<option value='16:30'>오후 4시 30분</option>
<option value='17:00'>오후 5시 00분</option>
<option value='17:30'>오후 5시 30분</option>
<option value='18:00'>오후 6시 00분</option>
<option value='18:30'>오후 6시 30분</option>
<option value='19:00'>오후 7시 00분</option>
<option value='19:30'>오후 7시 30분</option>
<option value='20:00'>오후 8시 00분</option>
<option value='20:30'>오후 8시 30분</option>
<option value='21:00'>오후 9시 00분</option>
<option value='21:30' selected='selected'>오후 9시 30분</option>
<option value='22:00'>오후 10시 00분</option>
<option value='22:30'>오후 10시 30분</option>
<option value='23:00'>오후 11시 00분</option>
<option value='23:30'>오후 11시 30분</option>
							</select>
							<span class="space">부터</span>
							<label for="endAcceptDate" class="displayNone">모임등록시작 날짜설정</label>
							<input id="endAcceptDate" class="text datepicker" type="text" name="recruitEndDateTime_date" value="2016-07-01"/>
							<select class="date-select" name="recruitEndDateTime_time">
								<option value='00:00'>오전 0시 00분 (자정)</option>
<option value='00:30'>오전 0시 30분</option>
<option value='01:00'>오전 1시 00분</option>
<option value='01:30'>오전 1시 30분</option>
<option value='02:00'>오전 2시 00분</option>
<option value='02:30'>오전 2시 30분</option>
<option value='03:00'>오전 3시 00분</option>
<option value='03:30'>오전 3시 30분</option>
<option value='04:00'>오전 4시 00분</option>
<option value='04:30'>오전 4시 30분</option>
<option value='05:00'>오전 5시 00분</option>
<option value='05:30'>오전 5시 30분</option>
<option value='06:00'>오전 6시 00분</option>
<option value='06:30'>오전 6시 30분</option>
<option value='07:00'>오전 7시 00분</option>
<option value='07:30'>오전 7시 30분</option>
<option value='08:00'>오전 8시 00분</option>
<option value='08:30'>오전 8시 30분</option>
<option value='09:00'>오전 9시 00분</option>
<option value='09:30'>오전 9시 30분</option>
<option value='10:00'>오전 10시 00분</option>
<option value='10:30'>오전 10시 30분</option>
<option value='11:00'>오전 11시 00분</option>
<option value='11:30'>오전 11시 30분</option>
<option value='12:00'>오후 0시 00분 (정오)</option>
<option value='12:30'>오후 0시 30분</option>
<option value='13:00'>오후 1시 00분</option>
<option value='13:30'>오후 1시 30분</option>
<option value='14:00'>오후 2시 00분</option>
<option value='14:30'>오후 2시 30분</option>
<option value='15:00'>오후 3시 00분</option>
<option value='15:30'>오후 3시 30분</option>
<option value='16:00'>오후 4시 00분</option>
<option value='16:30'>오후 4시 30분</option>
<option value='17:00'>오후 5시 00분</option>
<option value='17:30'>오후 5시 30분</option>
<option value='18:00'>오후 6시 00분</option>
<option value='18:30'>오후 6시 30분</option>
<option value='19:00'>오후 7시 00분</option>
<option value='19:30'>오후 7시 30분</option>
<option value='20:00'>오후 8시 00분</option>
<option value='20:30'>오후 8시 30분</option>
<option value='21:00' selected='selected'>오후 9시 00분</option>
<option value='21:30'>오후 9시 30분</option>
<option value='22:00'>오후 10시 00분</option>
<option value='22:30'>오후 10시 30분</option>
<option value='23:00'>오후 11시 00분</option>
<option value='23:30'>오후 11시 30분</option>
							</select>
							까지
						</div>
					</div>
				</div>
				<div class="advice">
					<p class="subAdvice startEvent">
						개설하려는 모임의 <strong>기간</strong>을 설정해 주세요.<br/>
						<br/>
						모임기간이 하루 이상일 경우 체크박스를 선택하면<br/>
						모임 시작일과 종료일 설정이 가능합니다.
					</p>

					<p class="subAdvice setupTime">
						모임에 참여하려는 참여자의 <strong>참여 신청기간</strong>을<br/>
						설정합니다.<br/>
						(참여자는 신청기간이 끝나면 해당 모임에 등록을<br/>
						할 수 없습니다.)
					</p>
				</div>
			</div>
			<div class="core place">
				<div class="input">
					<div class="subCore location">
						<h4 class="subTitle">모임 장소 설정 <span class="star">*</span></h4>
						<input class="location text" type='text' name='location' id='location' size='' maxlength='64' value='' minlen='3' required alias='장소를' title="정확한 장소명을 입력해 주세요."/>
					</div>
					<div class="subCore map">
						<div class="mapSearch">
							<input id="POIword" title="시, 도, 구, 동 단위로 위치를 입력해 주세요." class="text" type="text" value=""/><input class="search button" type="button" value=""/><br/>

							<div class="search result">
								<select id="SearchResult" style="display:none" MULTIPLE>
								</select>
							</div>
						</div>
						<div class="map holder">
							<div id='mapzone' style="width:644px; height:360px; display:block;"></div>
							<input type="hidden" name='tm128x' id="tm128x"/>
							<input type="hidden" name='tm128y' id="tm128y"/>
							<input type="hidden" name='mapX' id="lng" size='' maxlength='64' value='127.035448' required alias='지도좌표_X_를' confirm='123.'/>
							<input type="hidden" name='mapY' id="lat" size='' maxlength='64' value='37.503237' required alias='지도좌표_Y_를' confirm='123.'/>
							<input type="hidden" name="locality" id="sido"/>
							<input type="hidden" name="sublocality1" id="gugun"/>
							<input type="hidden" name="sublocality2" id="dong"/>
						</div>
						<!-- .map.holder end -->
					</div>
											<div class="subCore lend">
							<h4 class="subTitle">온오프믹스 장소 추천</h4><a class="recommend" href="/place" target="_blank">장소 추천 더보기</a>

							<div class="tip">모임장소가 없으시다면 <strong>온오프믹스에서 추천해 드리는 장소</strong>를 이용해 보세요. <br/>
								다양한 형태의 공간을 제공해 드리고
								<ins>모임에 필요한 편의와 설비들도 지원</ins>
								해 드리니 지금 바로 확인해 보세요.
							</div>
							<div class="list">
																	<ul class="place-item ">
										<li class="place-banner">
											<a class="innerBanner" href="/place/203" target="_blank"><img src="http://cfile1.onoffmix.com/thumbnail/MO7NWPJQ0NbGwi50TAAZHSgrVM55ldH3" alt="(사)한국청년회의소 대회의실 장소 대표이미지"/>

												<div class="bannerBorder"></div>
											</a>
										</li>
										<li class="place-title">
											<a class="event-link" href="/place/203" title="(사)한국청년회의소 대회의실" target="_blank">(사)한국청년회의소 대회의실</a>
										</li>
										<li class="place-max">
											수용인원 : <strong>120</strong>명
										</li>
									</ul>
																	<ul class="place-item ">
										<li class="place-banner">
											<a class="innerBanner" href="/place/314" target="_blank"><img src="http://cfile1.onoffmix.com/thumbnail/em7FIRei5SNdOek9ATT9SgicRmdWkqbG" alt="메이아일랜드 압구정점 10-12인 블록 장소 대표이미지"/>

												<div class="bannerBorder"></div>
											</a>
										</li>
										<li class="place-title">
											<a class="event-link" href="/place/314" title="메이아일랜드 압구정점 10-12인 블록" target="_blank">메이아일랜드 압구정점 10-12인 블록</a>
										</li>
										<li class="place-max">
											수용인원 : <strong>12</strong>명
										</li>
									</ul>
																	<ul class="place-item ">
										<li class="place-banner">
											<a class="innerBanner" href="/place/224" target="_blank"><img src="http://cfile1.onoffmix.com/thumbnail/xqBpQhRmeOzgXeBzIcKauZa99fzINtYU" alt="(주)와하코리아 강남점 장소 대표이미지"/>

												<div class="bannerBorder"></div>
											</a>
										</li>
										<li class="place-title">
											<a class="event-link" href="/place/224" title="(주)와하코리아 강남점" target="_blank">(주)와하코리아 강남점</a>
										</li>
										<li class="place-max">
											수용인원 : <strong>20</strong>명
										</li>
									</ul>
																	<ul class="place-item ">
										<li class="place-banner">
											<a class="innerBanner" href="/place/175" target="_blank"><img src="http://cfile1.onoffmix.com/thumbnail/LycrumYNWrcCfsZ5SnloPR1tBkD2tYmN" alt="르호봇 합정-홍대 코워킹 회의실(소) 장소 대표이미지"/>

												<div class="bannerBorder"></div>
											</a>
										</li>
										<li class="place-title">
											<a class="event-link" href="/place/175" title="르호봇 합정-홍대 코워킹 회의실(소)" target="_blank">르호봇 합정-홍대 코워킹 회의실(소)</a>
										</li>
										<li class="place-max">
											수용인원 : <strong>4</strong>명
										</li>
									</ul>
																	<ul class="place-item last">
										<li class="place-banner">
											<a class="innerBanner" href="/place/189" target="_blank"><img src="http://cfile1.onoffmix.com/thumbnail/OhiW4CQu3DWS1hxWE9mVCFpDQgjixF02" alt="홍대합정 봄아카데미 B룸(8인실) 장소 대표이미지"/>

												<div class="bannerBorder"></div>
											</a>
										</li>
										<li class="place-title">
											<a class="event-link" href="/place/189" title="홍대합정 봄아카데미 B룸(8인실)" target="_blank">홍대합정 봄아카데미 B룸(8인실)</a>
										</li>
										<li class="place-max">
											수용인원 : <strong>8</strong>명
										</li>
									</ul>
															</div>
						</div><!-- .subCore.lend end -->
									</div>
				<div class="advice">
					<p class="subAdvice location">
						참여자들이 장소를 명확히 알 수 있도록<br/>
						<strong>장소명을 입력</strong>해 주세요.
					</p>

					<p class="subAdvice map">
						모임 장소 위치를 지도에 표시하기 위해 <br/>
						<strong>지도 위치 설정</strong>을 해 주세요.<br/>
						<br/>
						설정은 지역명이나 주요명칭을 기입하여<br/>
						지정 할 수 있습니다. <br/>
						<br/>
						시, 도, 구, 동 단위로 설정할 수 있습니다.<br/>
						<br/>
						지도를 클릭하고 핀을 이동하여 위치를<br/>
						지정할 수도 있습니다.<br/>
						<br/>
						간혹 주소정보를 불러오지 못해<br/>
						지역카테고리 범주에 속하지 못할 수 있습니다.<br/>
					</p>
											<p class="subAdvice lend">

						</p>
									</div>
			</div>
			<div class="lastCore">
				<div class="saveMsg"></div>
				<div class="action">
											<a href="#firstStep" class="prev button">이전</a><a href="#lastStep" class="next button">다음단계</a><a class="temp button" href="#temp"><span>임시저장</span></a>
									</div>
			</div>
		</div>
		<!--secondStep end-->
		<div class="roundBox lastStep">
			<div class="firstCore">
				<div class="title">
					<h3 class="title">step.3 부가 정보 입력</h3>

					<div class="menu">
						<a class="firstStep" href="#firstStep">STEP.1</a><a class="secondStep" href="#secondStep">STEP.2</a><a class="lastStep" href="#lastStep">STEP.3</a>
					</div>
				</div>
			</div>
			<div class="core publicAdmin">
				<div class="input">
					<div class="subCore public">
						<h4 class="subTitle">공개 설정 <span class="star">*</span></h4>
						<table>
							<tr>
								<th>온오프믹스 모임 목록에 노출</th>
								<td><label for="open1"><input id="open1" class="open radio" type="radio" name="isExposed" value="1" checked="checked"/>노출함</label></td>
								<td><label for="close1"><input id="close1" class="close radio" type="radio" name="isExposed" value="0"/>노출안함</label></td>
							</tr>
							<tr>
								<th>모임 공개 여부</th>
								<td><label for="open"><input id="open" type="radio" class="radio" name="oc" value="0" checked="checked"/>공개 모임</label></td>
								<td><label for="close" class="close"><input id="close" type="radio" class="radio" name="oc" value="1"/>비공개 모임</label
									><input id="eventPw" title="비밀번호 입력" type="text" class="text outfocus" name="eventPw" value="" disabled="disabled"/></td>
							</tr>
						</table>
					</div>
										<div class="subCore admin">
						<h4 class="subTitle">연락처 및 알림 설정 <span class="star">*</span></h4>
						<table width="100%">
							<tr class="admin_num">
								<th>개설자 전화번호 입력</th>
								<td>
									<label for="ownerPhone" class="displayNone">전화번호 앞부분 입력</label>
									<input class="text mask-pint" type="text" name="ownerPhone_head" id="ownerPhone" value="010" size="4" maxlength="4"/>
									<label for="ownerPhoneBody" class="displayNone">전화번호 중간부분입력</label>
									<input id="ownerPhoneBody" class="mask-pint text" type="text" name="ownerPhone_body" value="8864" size="4" maxlength="4"/>
									<label for="ownerPhoneTail" class="displayNone">전화번호 뒷부분 입력</label>
									<input id="ownerPhoneTail" class="text mask-pint" type="text" name="ownerPhone_tail" value="8849" size="4" maxlength="4"/>
								</td>
							</tr>
							<tr class="admin_email">
								<th>개설자 이메일 입력</th>
								<td>
									<input title="개설자 이메일 입력" id="email" class="text" type="text" name="ownerEmail" value="zeenux@naver.com"/>
									<!--<input type="hidden" id="checkEmail" name="checkEmail" value="" equal="0" alias="이메일 중복확인이 되지 않았습니다."/>-->
								</td>
							</tr>
															<tr class="admin_notify">
									<th>모임개설 알림 설정</th>
									<td>
																																<input type="checkbox" class="checkbox" name="postSns[]" value="facebook" id="post_to_facebook"  /><label for="post_to_facebook"><span
												class="facebook"></span></label>
																																																				<input type="checkbox" class="checkbox" name="postSns[]" value="twitter" id="post_to_twitter"  /><label for="post_to_twitter"><span
												class="twitter"></span></label>
																																																				<input type="checkbox" class="checkbox" name="postSns[]" value="kakao" id="post_to_kakao"  /><label for="post_to_kakao"><span class="kakao"></span></label>
																													</td>
								</tr>
													</table>
					</div>
				</div>
				<div class="advice">
					<p class="subAdvice public">
						온오프믹스에 모임을 노출할 것인지 여부를 <br/>
						선택해 주시고 <strong>노출 안함을 선택하면<br/>
							온오프믹스내에 모임이 표시되지 않습니다.</strong> <br/>
						<br/>
						모임을 <strong>비공개</strong>로 설정 할 경우 <strong>비밀번호</strong>를<br/>
						입력 하시고 모임페이지에 비밀번호를 입력해야<br/>
						모임에 접근이 가능합니다.
					</p>
										<p class="subAdvice admin">
						연락처는 개설자의 전화번호, 이메일을 정확히<br/>
						입력해 주셔야 하며 모임에 대한 문의나 정보를<br/>
						공유할 수 있습니다.<br/>
						<br/>
						개설자의 SNS정보를 선택하여 모임개설의 여부를<br/>
						개설과 동시에 바로 SNS로 알릴 수 있습니다.
					</p>
				</div>
			</div>
			<div class="lastCore">
				<div class="saveMsg"></div>
				<div class="action">
					<a href="#secondStep" class="prev button">이전</a><input type="submit" class="confirm button" value="최종확인"/><a class="temp button" href="#temp"><span>임시저장</span></a>
				</div>
				<script class="template confirm" type="text/x-jquery-tmpl">
					<div class="layer">
						<h4 class="layerTitle">${title}</h3>
						<div class="layerContent">
							{{html $item.event()}}
							<div class="isFree">
								<dd>본 모임은 <strong>${isFree}</strong>모임입니다.
							</div>
							{{if wayOfRegistration != ''}}
							<div class="outUrl" ${style}>
								<dl>
									<dt>외부 참여 URL</dt>
									<dd><a href="${wayOfRegistration}" class="outLink" target="_blank">${wayOfRegistration}</a></dd>
								</dl>
							</div>
							{{else}}
							<div class="group">
								<dl>
									<dt>그룹</dt>
									<dd>{{html $item.group()}}</dd>
								</dl>
							</div>
							{{/if}}
							<div class="admin">
								<dl>
									<dt>개설자 전화번호</dt>
									<dd>${number}</dd>
									<br />
									<dt>개설자 이메일</dt>
									<dd>${email}</dd>
								</dl>
							</div>
						</div>
						<div class="guide">
							설정한 정보가 모두 맞으면 <strong>개설완료</strong>를 눌러주시고<br />
							내용 수정을 원하시면 <strong>다시 돌아가기</strong>를 눌러주세요
						</div>
						<div class="box">
							<a class="close button" href="#close">다시 돌아가기</a><input class="button confirm" value="개설완료" type="submit" /><input type="submit" class="preview button" value="미리보기" />
						</div>
						<p class="serviceBanner">
  <a href="/cs/a/3967?url=http%3A%2F%2Fwww.onoffmix.com%2Fservice%2Fpartner%2Fcircleconnection%2F" target="_blank"><img src="http://cfile1.onoffmix.com/attach/rbKVUeiZ4xOktE6dW1NvfJMQKVRLt4nO" alt="제휴서비스 소개" /></a>
</p>
					</div>
					</script>
			</div>
		</div>
		<!--lastStep end-->
	</form>
	<!--innerBorder end-->
</div>
<div class="footer">
	<div class="centerFooter">
				<div class="informations">
			<div class="linkArea">
				<p class="link">
					<a class="first link" href="http://corp.onoffmix.com/html/main/" target="_blank">회사소개</a>
					<span class="separator">|</span>
					<a class="link" href="/legal/agreement" target="_blank">서비스약관 및 정책</a>
					<span class="separator">|</span>
					<a class="link" href="/legal/privacy" target="_blank"><b>개인정보취급방침</b></a>
					<span class="separator">|</span>
					<a class="link" href="/service/advert/website/banner" target="_blank">광고문의</a>
					<span class="separator">|</span>
					<a class="link" href="http://onoffmix.com/ir/" target="_blank">투자정보</a>
					<span class="separator">|</span>
					<a class="link" href="/cs/inquire/" target="_blank">문의하기</a>
					<span class="separator">|</span>
					<a class="link" href="/cs/suggest/" target="_blank">제안하기</a>
					<span class="separator">|</span>
					<a class="link" href="/cs/" target="_blank">고객센터</a>
				</p>
			</div>
			<div class="info">
				<strong>(주) 온오프믹스</strong> <!--em>대표 양준철</em-->
			</div>
			<div class="detail">
				<em>대표이사 양준철</em>
				<span class="separator">|</span>
				<div class="officer">개인정보관리책임자 이상규</div>
				<span class="separator">|</span>
				<div class="code">사업자등록번호 <span class="number">221-81-34988</span></div>
				<span class="separator">|</span>
				<div class="business">통신판매업 신고번호 제<span class="number">2015</span>-서울서초-<span class="number">0928</span>호</div>
			</div>
			<div class="contact">
				<div class="address">
					<address>서울특별시 서초구 신반포로 <span class="letNumber">45</span>길 <span class="letNumber">22</span> 은양빌딩 <span class="letNumber">5</span>층</address>
				</div>
			</div>
			<div class="contact">
				<span class="separator">|</span>
				<span class="label">Tel</span> <span class="number">02-6080-5579</span>
				<span class="separator">|</span>
				<span class="label">Fax</span> <span class="number">02-6280-8089</span>
				<span class="separator">|</span>
				<span class="label">Email</span> : <a class="email" href="mailto:webmaster@onoffmix.com">webmaster@onoffmix.com</a>
			</div>
			<p class="bottom">
				<span>온오프믹스는 통신판매중개자이며 모임에 대한 당사자 및 주최자가 아닙니다. 따라서 온오프믹스는 등록된 모임에 대하여 책임을 지지 않습니다.</span>
				copyright &copy; <strong>ONOFFMIX.COM</strong>, All Rights Reserved.
			</p>
		</div>
		<div class="certification">
			<a href="https://support.childfund.or.kr/online/onlineSupportView.do?boardSearch.bdIsId=10000038&searchKey=&searchText=&currentPage=1&rowPerPage=5" class="emblem" target="_blank"><img src="http://static.onoffmix.com/images3/misc/logo_love.png" width="73" height="90" alt="SHARE THE LOVE 어린이재단" /></a>
		</div>
	</div>
</div><!-- .footer end -->

	<!-- Google Tag Manager -->
	<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TMSKZ8"
	                  height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
	<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
			new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
			j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
			'//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
		})(window,document,'script','dataLayer','GTM-TMSKZ8');</script>
	<!-- End Google Tag Manager -->

<script type="text/javascript" src="http://static.onoffmix.com/js3/logger/gnb.js"></script>
<div id="calendarBox"></div><!-- 달력 position:absolute가 다른 position:relative와 겹치지 않도록 최하단에 유지할 것 -->

<script type="text/javascript" src="http://t.onoffmix.com/t.js?r=http%3A%2F%2Fonoffmix.com%2F" async></script>
<noscript><img src="http://t.onoffmix.com/t.gif?r=http%3A%2F%2Fonoffmix.com%2F" width="0" height="0" alt="" /></noscript>

</body>
</html>
<!-- 204 -->
