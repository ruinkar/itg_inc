<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="base.model.*, java.util.*, java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
div#leftMenu {
	width: 200px;
	height: 700px;
	float: left;
}

div#mainContent {
	width: 800px;
	height: 1500px;
	float: left;
}
 
.box {margin:0 10px 10px 0; display:inline-block; }
.box_top {width:180px; height:180px; background-color:green; }
.box_bottom {width:180px; height:180px; background-color:yellow; }
td{align:center; width:180px; height:180px;}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>EventMain</title>
</head>
<%
	final String LOG_TAG = "eventMain.jsp";

	int pageSize = 12; //페이지당 보여줄 레코드 수
	int blockSize = 10; //블럭당 보여줄 페이지 수
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-DD HH:mm");
	
	//현재페이지를 설정
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
		pageNum = "1";
	}
	
	//형변환
	int currentPage = Integer.parseInt(pageNum);
	System.out.println(LOG_TAG + ", currentPage = " + currentPage);	
	//시작 레코드 번호
	int startRow = (currentPage -1) * pageSize +1; //1페이지는 1부터 2페이지는 11부터
	int endRow = (currentPage * pageSize); // 1*10, 2*10 즉 1페이지는 10까지 2페이지는 20까지

	int count = 0; //총 레코드 수
	int number = 0; //페이지별 시작하는 게시물의 번호
	
	List boardContentList = null; //12개의 레코드들을 담을 변수
	List eventContentList = null;
	
	//레코드가 몇개인지 가져오자
	BDAO boardDao = new BDAO();
	count = boardDao.getContentCount();
	System.out.println(LOG_TAG + ", 현재 board 수 count = " + count);
	
	EventDAO eventDao = new EventDAO();
	
	
	if (count > 0) {
		//테이블의 첫번째 레코드 순번, 화면에 보여줄 레코드 수
		boardContentList = boardDao.getContents(startRow, pageSize);
		System.out.println(LOG_TAG +", boardContentList = " + boardContentList);
		
		/* 
		그림을 뿌려줄 때 어짜피 게시물 번호를 토대로 내림차순을 하기 때문에 join이 필요가 없다 
		anum(게시판 테이블의 게시물번호) = evnum(행사게시판 테이블의 행사번호)
		*/
		eventContentList = eventDao.getContents();
		
	}
	
	number = count - (currentPage - 1) * pageSize;
	System.out.println(LOG_TAG + ", count = " + count);
	System.out.println(LOG_TAG + ", currentPage = " + currentPage);
	System.out.println(LOG_TAG + ", pageSize = " + pageSize);
	System.out.println(LOG_TAG + ", number = " + number);
%>
<body>
	<div id="leftMenu">
		<input type="button"
			style="width: 120px; height: 120px; background-color: hotpink"
			name="postButton" value="포스트형" onclick="" /> <input type="button"
			style="width: 120px; height: 120px; background-color: lime"
			name="calendarButton" value="달력형" onclick="" /> <input type="button"
			style="width: 120px; height: 120px; background-color: cyan"
			name="mapButton" value="지도형" onclick="" />
	</div>
	<div id="mainContent">
		<img src="../images/fonz2.png" style="width: 560px; height: 400px"></img>
		<input type="button" value="행사글올리기" OnClick="window.location='eventWrite.jsp'"/>
		<br/>
		
	<%
			for (int i = 0; i < boardContentList.size(); i++) {
				
				BDTO boardDTO = (BDTO)boardContentList.get(i);
				EventDTO eventDTO = (EventDTO)eventContentList.get(i);
			
		%><div class="box">
		<div class="box_top">
				<table >
					<tr>
						<td><img src="<%=eventDTO.geteImg() %>" width="150px" height="150px"/>
						</td>
					</tr>
				</table>
			</div><div class="box_bottom">
				<table >
					<tr>
						<td><%=boardDTO.getaNum() %></td>
					</tr>
				</table>
			</div></div><% } %>
			
			<br>
			
			<%
			//페이징처리 -> 이전블럭, 현재블럭, 다음블럭
			if(count > 0) {
				//1.총 페이지 구하기
				int pageCount = count / pageSize + (count%pageSize == 0? 0:1);
				System.out.println(LOG_TAG + ", pageCount = " + pageCount);
				//2.시작페이지(1), 끝페이지(10)(현재블럭)
				int startPage  = currentPage / blockSize * blockSize + 1; 
				int endPage = startPage + blockSize - 1;
				
				if (endPage > pageCount) endPage = pageCount;
				
				System.out.println(LOG_TAG + ", startPage = " + pageCount);
				System.out.println(LOG_TAG + ", endPage = " + pageCount);
				
				//이전블럭 ->
				if(startPage > blockSize) {
					%>
					<a href="eventMain.jsp?pageNum=<%=startPage - blockSize %>">[이전]</a>
					<% }
				for (int i = startPage; i <= endPage; i++) { %>
				<a href = "eventMain.jsp?pageNum=<%=i %>">[<%=i %>]</a>
			<% 
				}
				//다음 블럭
				if(endPage < pageCount) { %>
				<a href = "eventMain.jsp?pageNum=<%=startPage + blockSize %>">[다음]</a>

			<% } %>
			<%}
			%>
			
			
	</div>
	
	
</body>
</html>
