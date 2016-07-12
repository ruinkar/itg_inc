<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<table width="600" border="0" cellspacing="0" cellpagging="0" align="center">
	<tr>
		<td colspan="2"><h3>스프링 게시판 </h3></td>	
	</tr>
	<tr>
		<td>번호</td>		
		<td>${board.seq}</td>		
	</tr>
	<tr>
		<td>글쓴이</td>
		<td>${board.writer}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${board.title}</td>
	</tr>
	<tr>
		<td colspan="2">
			<hr size="1" width="100%" noshade>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${board.content}</td>
	</tr>
	<tr>
		<td colspan="2">
			<hr size="1" width="100%" noshade>
		</td>
	</tr>
	<tr>
		<td>조회수</td>
		<td>${board.hit}</td>
	</tr>
	<tr>
		<td>등록날짜</td>
		<td>${board.regdate}</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><a href="file.do?filename=${board.filename}">aaa.txt</a></td>
	</tr>
	<tr>
		<td align="right" colspan="2">
			<input type="button" value="수정" 
			   onclick="location.href='update.do?seq=${board.seq}'">
			<input type="button" value="삭제" 
			   onclick="location.href='delete.do?seq=${board.seq}'">
			<input type="button" value="목록" onclick="location.href='list.do'">
		</td>
	</tr>
</table>

