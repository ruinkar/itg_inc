<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>/* 
.list-group.panel>.list-group-item {
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px
}

.list-group-submenu {
	margin-left: 20px;
}

.itg-color {
	background-color: 36175E;
} */
</style>
<li class="sidebar-brand text-left"><a href="#">ITGBBS</a></li>
	<!-- <div class="list-group panel"> -->
		<!-- 
   <a href="#demo3" class="list-group-item list-group-item-success" data-toggle="collapse" data-parent="#MainMenu">메인1</a>
   <div class="collapse" id="demo3">
     <a href="#SubMenu1" class="list-group-item" data-toggle="collapse" data-parent="#SubMenu1">서브1 <i class="fa fa-caret-down"></i></a>
     <div class="collapse list-group-submenu" id="SubMenu1">
       <a href="#" class="list-group-item" data-parent="#SubMenu1">Subitem 1 a</a>
       <a href="#" class="list-group-item" data-parent="#SubMenu1">Subitem 2 b</a>
       <a href="#SubSubMenu1" class="list-group-item" data-toggle="collapse" data-parent="#SubSubMenu1">Subitem 3 c <i class="fa fa-caret-down"></i></a>
       <div class="collapse list-group-submenu list-group-submenu-1" id="SubSubMenu1">
         <a href="#" class="list-group-item" data-parent="#SubSubMenu1">Sub sub item 1</a>
         <a href="#" class="list-group-item" data-parent="#SubSubMenu1">Sub sub item 2</a>
       </div>
       <a href="#" class="list-group-item" data-parent="#SubMenu1">Subitem 4 d</a>
     </div>
     <a href="javascript:;" class="list-group-item">Subitem 2</a>
     <a href="javascript:;" class="list-group-item">Subitem 3</a>
   </div> -->
<li><a href="#menu-evinfo" data-toggle="collapse">행사 정보</a>
<div class="collapse" id="menu-evinfo">
	<a href="${pageContext.request.contextPath}/evinfo/list.do"><span class="glyphicon glyphicon-th"></span>　포스트형</a>
	<a href="${pageContext.request.contextPath}/evinfo/eventMap.do"><span class="glyphicon glyphicon-map-marker">　지도형</a>
	<c:choose>
		<c:when test="${not empty sessionScope.userLoginInfo}">
			<a href="${pageContext.request.contextPath}/evinfo/eventWrite.do"
				class="list-group-item">행사 올리기</a>
		</c:when>
	</c:choose>
</div></li>
<li><a href="${pageContext.request.contextPath}/review/list.do">행사 리뷰</a></li>
<li><a href="${pageContext.request.contextPath}/free/list.do">자유게시판</a></li>
<li><a href="#menu-rank" data-toggle="collapse">회원 랭킹</a>
<div class="collapse" id="menu-rank">
	<a href="${pageContext.request.contextPath}/rank.do"><span class="glyphicon glyphicon-flash"></span>　활동 점수</a>
	<a href="${pageContext.request.contextPath}/rank.do?rtype=1"><span class="glyphicon glyphicon-star"></span>　평점 평균</a>
</div></li>
<li><a href="#menu-sign" data-toggle="collapse">로그인 | 회원가입</a>
<div class="collapse" id="menu-sign">
<c:choose>
	<c:when test="${not empty sessionScope.userLoginInfo}">
		<div class="row">
			이름 : ${sessionScope.userLoginInfo.id}
		</div>
		<div class="row">
			<a href="${pageContext.request.contextPath}/login/deleteSession.do" class="btn btn-default btn-md btn-wide">로그아웃</a>
			<a href="${pageContext.request.contextPath}/member/delete.do" class="btn btn-default btn-md btn-wide">회원탈퇴</a>
		</div>
	</c:when>
	<c:otherwise><!--  
	--><form name="loginForm" method="post"
			action="${pageContext.request.contextPath}/login/makeSession.do">
			<div class="row text-center">
				<div class="col-xs-12">
					<div class="row">
						ID　<input type="text" name="id">
					</div>
					<div class="row">
						PW　<input type="password" name="password">
					</div>
					<div class="row btn-group">
						<input type="submit" class="btn btn-default btn-md btn-wide col-xs-6" value="로그인">
						<a href="${pageContext.request.contextPath}/member/signup.do"
								class="btn btn-default btn-md btn-wide col-xs-6">회원가입</a>
					</div>
				</div>
			</div>
		</form>
    </c:otherwise>
</c:choose>
</div></li>