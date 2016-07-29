<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
<title>OKKY - Article 수정</title>
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
<script>
$(function(){
	$("textarea[name=acontent]").summernote({
		height: 800,
		focus: true
	});
});
</script>


</head>
<%-- <%
	 //1.list.jsp(글쓰기)->신규글 ,2.content.jsp(글상세보기)->답변글
	 int num=0,ref=1,re_step=0,re_level=0;//writePro.jsp
	 //답변글
	 if(request.getParameter("num")!=null){
		 num=Integer.parseInt(request.getParameter("num"));
		 ref=Integer.parseInt(request.getParameter("ref"));
		 re_step=Integer.parseInt(request.getParameter("re_step"));
		 re_level=Integer.parseInt(request.getParameter("re_level"));
		 System.out.println("=content.jsp에서 넘어온값 num="+num);
		 System.out.println("ref="+ref+",re_step=" + re_step +",re_level="+re_level);
	 }
 %> --%>

<body>
	<div class="layout-container">
		<div class="main ">

			<div id="article-create" class="content" role="main">

				<div class="content-header">
					<h3>글 수정하기</h3>
				</div>





				<div class="panel panel-default clearfix">
					<div class="panel-heading clearfix">

						<div class='avatar avatar-medium clearfix pull-left'>
							<a href='/user/info/45019' class='avatar-photo'><img
								src='//www.gravatar.com/avatar/d6ee80eb5a45fd4131a4b75d48df792b?d=identicon&s=40' /></a>
							<div class="avatar-info">
								<a class="nickname" href="/user/info/45019">${article.writer}</a>
								<div class="activity block">
									<span class="fa fa-flash"></span> 0
								</div>
							</div>
						</div>

					</div>
					<div class="panel-body">
						<form action="updatePro.do" method="post"
							id="article-form" class="article-form" role="form"
							onsubmit="return postForm()">
							<input type="hidden" name="SYNCHRONIZER_TOKEN"
								value="d1ce26bf-c69d-4a84-8c6b-7443b058ad46"
								id="SYNCHRONIZER_TOKEN" /> <input type="hidden"
								name="SYNCHRONIZER_URI" value="/articles/community/create"
								id="SYNCHRONIZER_URI" />
							<fieldset class="form">












								<!--    자유게시판 카테고리 div     
		<div class="form-group  has-feedback">
            <div>
                <select id="category" name="categoryCode" class="form-control">
                    <option value="">게시판을 선택해 주세요.</option>
                    
                        <option value="notice"
                                
                                data-external=""
                                data-anonymity="false">
                            공지사항
                        </option>
                    
                        <option value="life"
                                
                                data-external=""
                                data-anonymity="false">
                            사는얘기
                        </option>
                    
                        <option value="forum"
                                
                                data-external=""
                                data-anonymity="false">
                            포럼
                        </option>
                    
                        <option value="gathering"
                                
                                data-external=""
                                data-anonymity="false">
                            정기모임/스터디
                        </option>
                    
                        <option value="promote"
                                
                                data-external=""
                                data-anonymity="false">
                            학원/홍보
                        </option>
                    
                </select>
            </div>
        </div> -->




								<div class="form-group  has-feedback">
									<div>
										<input type="text" name="title" required=""
											value="${article.title}" class="form-control"
											id="title" />
									</div>
								</div>

								<div class="form-group  has-feedback">
									<div>
										<input type="text" name="tagString" value=""
											placeholder="Tags," data-role="tagsinput"
											class="form-control" id="tagString" />
									</div>
								</div>

								<div class="form-group  has-feedback">

									<textarea name="acontent" id="summernote" rows="20"
										class="form-control input-block-level">${article.acontent}</textarea>


								</div>

								<input type="hidden" name="content.textType" value="HTML"
									id="content.textType" /> <input type="hidden" name="writer"
									value="${article.writer}" id="writer" /> <input
									type="hidden" name="anum" value="${article.anum}" id="anum" /> 



								<div class="nav" role="navigation">
									<fieldset class="buttons">
										<a href="list.do" class="btn btn-default btn-wide"
											onclick="return confirm(&#39;정말로 취소하시겠습니까?&#39;)">취소</a> <input
											type="submit" name="create"
											class="create btn btn-success btn-wide pull-right" value="저장"
											id="create" />
									</fieldset>
								</div>
							</fieldset>
						</form>
					</div>
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
            var contextPath = "", encodedURL = "%2Farticles%2Fcommunity%2Fcreate";
        </script>
	<script
		src="http://okky.kr/assets/application-196466c60cf4e718162e141a5acdf612.js"
		type="text/javascript"></script>
	<script
		src="http://okky.kr/assets/apps/search-a672360634f56105585df31fcdb69705.js"
		type="text/javascript"></script>

	<script
		src="http://okky.kr/assets/apps/notification-f91d194e3ba2944508aa3af101c4498a.js"
		type="text/javascript"></script>


	<!--         <script type="text/javascript">
    $('#summernote').summernote({minHeight: 300, lang: 'ko-KR',
      onInit: function() {
        if($(window).height() > 400)
            $('.note-editable').css('max-height', $(window).height()-100);
      },
      onImageUpload: $.onImageUpload($('#summernote'))
    });

    function postForm() {
        $('textarea[name="content.text"]').val($('#summernote').code());
    }
</script><script type="text/javascript">
            $('#category').change(function() {
                var $opt = $(this).find(':selected');

                if(this.value && ($opt.data('external') !== true || confirm('외부 링크로 이동합니다. 이동하시겠습니까?'))) {
                    $('#article-form').attr('action', contextPath+'/articles/'+$opt.val()+'/create')
                        .submit();
                }
            });
        </script> -->
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