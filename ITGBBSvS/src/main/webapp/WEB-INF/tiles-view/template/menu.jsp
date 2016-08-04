<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.list-group.panel>.list-group-item {
	border-bottom-right-radius: 4px;
	border-bottom-left-radius: 4px
}

.list-group-submenu {
	margin-left: 20px;
}

.itg-color {
	background-color: 36175E;
}
</style>
<center>
	<div id="MainMenu">
		<div class="list-group panel">
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
			<a href="#menu-evinfo" class="list-group-item list-group-item-success"
				data-toggle="collapse" data-parent="#MainMenu">행사 정보</a>
			<div class="collapse" id="menu-evinfo">
				<a href="${pageContext.request.contextPath}/evinfo/list.do"
					class="list-group-item">포스트형</a> <a
					href="${pageContext.request.contextPath}/evinfo/eventMap.do"
					class="list-group-item">지도형</a>
				<c:choose>
					<c:when test="${not empty sessionScope.userLoginInfo}">
						<a href="${pageContext.request.contextPath}/evinfo/eventWrite.do"
							class="list-group-item">행사 올리기</a>
					</c:when>
				</c:choose>
			</div>
			<a href="${pageContext.request.contextPath}/review/list.do"
				class="list-group-item list-group-item-success">행사 리뷰</a><a
				href="${pageContext.request.contextPath}/free/list.do"
				class="list-group-item list-group-item-success">자유게시판</a><a
				href="#menu-rank" class="list-group-item list-group-item-success"
				data-toggle="collapse" data-parent="#MainMenu">회원 랭킹</a>
			<div class="collapse" id="menu-rank">
				<a href="${pageContext.request.contextPath}/rank.do"
					class="list-group-item">활동 점수</a><a
					href="${pageContext.request.contextPath}/rank.do?rtype=1"
					class="list-group-item">평점 평균</a>
			</div>
		</div>
	</div>
	<c:choose>
		<c:when test="${not empty sessionScope.userLoginInfo}">
			<div width="100px">
				이름 : ${sessionScope.userLoginInfo.id}<br> <a
					href="${pageContext.request.contextPath}/login/deleteSession.do">로그아웃</a>
				<a href="${pageContext.request.contextPath}/member/delete.do"
					class="btn btn-default btn-md btn-wide">회원탈퇴</a>
			</div>
		</c:when>
		<c:otherwise>
        <form name="loginForm" method="post"
				action="${pageContext.request.contextPath}/login/makeSession.do">
				<table>
					<tr height="40px">
						<td>유저ID</td>
					</tr>
					<tr height="40px">
						<td><input type="text" name="id"></td>
					</tr>
					<tr height="40px">
						<td>패스워드</td>
					</tr>
					<tr height="40px">
						<td><input type="password" name="password"></td>
					</tr>
				</table>
				<table>
					<tr>
						<td align="center"><input type="submit"
							class="btn btn-default btn-md btn-wide" value="로그인"></td>
						<td align="center"><a
							href="${pageContext.request.contextPath}/member/signup.do"
							class="btn btn-default btn-md btn-wide">회원가입</a></td>
					</tr>
				</table>
				        
			</form>
    </c:otherwise>
	</c:choose>
</center>

