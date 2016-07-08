<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	EventBoardDAO boardDAO = new EventBoardDAO();
	EventBoardDTO boardDTO = boardDAO.getContent(num);
	
	EventDAO eventDAO = new EventDAO();
	EventDTO eventDTO = eventDAO.getContent(num);

%>
<body>
	<form method="post" name="writeform" action="eventModifyPro.jsp?num=<%=num%>">
	<h4>*글 제목 입력</h4>
		<input id="title" type="text" name="title" size="100" title="글 제목 입력" maxlength="50" class="text" value="<%=boardDTO.getTitle() %>"/>
	
	<h4>*글 내용 입력</h4>
		<input id="aContent" type="text" name="aContent" size="100" title="글 내용 입력" maxlength="2000" class="text" value="<%=boardDTO.getaContent() %>"/>
	
	<h4>*태그 입력 (필수입력x)</h4>
		<input id="tag1" type="text" name="tag1" size="20" title="태그1 입력" maxlength="10" class="text" value="<%=boardDTO.getTag1() %>" />
		<input id="tag2" type="text" name="tag2" size="20" title="태그2 입력" maxlength="10" class="text" value="<%=boardDTO.getTag2() %>"/>
		<input id="tag3" type="text" name="tag3" size="20" title="태그3 입력" maxlength="10" class="text" value="<%=boardDTO.getTag3() %>"/>
		<input id="tag4" type="text" name="tag4" size="20" title="태그4 입력" maxlength="10" class="text" value="<%=boardDTO.getTag4() %>"/>
		<input id="tag5" type="text" name="tag5" size="20" title="태그5 입력" maxlength="10" class="text" value="<%=boardDTO.getTag5() %>"/>
		
	<h4>*행사주최자 입력</h4>
		<input id="host" type="text" name="host" size="20" title="행사주최자 입력" maxlength="10" class="text" value="<%=eventDTO.getHost() %>"/>
		
	<h4>*행사명 입력</h4>
		<input id="eName" type="text" name="eName" size="100" title="행사명 입력" maxlength="50" class="text" value="<%=eventDTO.getEname()%>"/>
		
	<h4>*행사 시작일 입력</h4>
		<input id="begin" type="text" name="begin" size="20" title="행사 시작일 입력" maxlength="20" class="text" value="<%=eventDTO.getBegin()%>"/>
		
	<h4>*행사 종료일 입력</h4>
		<input id="end" type="text" name="end" size="20" title="행사 종료일 입력" maxlength="20" class="text" value="<%=eventDTO.getEnd()%>"/>
		
	<h4>*행사 위치 입력</h4>
		<input id="location" type="text" name="location" size="20" title="행사 위치 입력" maxlength="20" class="text" value="<%=eventDTO.getLocation() %>"/>
		
	<h4>*행사 이미지 첨부</h4>
		<input id="eImg" type="button" name="eImg" value="행사 이미지 첨부" title="행사 이미지 첨부"/>
		
		<input type="submit" value="글쓰기" >
  		<input type="button" value="취소" OnClick="history.back();">
	</form>

</body>
</html>