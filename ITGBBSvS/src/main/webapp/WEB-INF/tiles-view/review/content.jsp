<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
function  delreply (idx)
{
	document.replydelform.anum.value=idx;
	document.replydelform.submit();
}
</script>
<style>
.menuName{background:#b0e0e6}
</style>


<center>      
<b>글내용 보기</b>
<br>
<table width="800" border="1" cellspacing="0" cellpadding="0"  align="center">  
  <tr height="30">
    <td align="center" width="125" class="menuName">글번호</td>
    <td align="center" width="125" colspan="2">${article.anum}</td>
    <td align="center" width="125" class="menuName">조회수</td>
    <td align="center" width="125" colspan="2">${article.readcount}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" class="menuName">작성자</td>
    <td align="center" width="125" colspan="2">${article.writer}</td>
    <td align="center" width="125" class="menuName" >작성일</td>
    <td align="center" width="125"colspan="2">${article.adate}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" class="menuName">글제목</td>
    <td align="center" width="375"  colspan="5">${article.title}</td>
  </tr>
  <tr height="30">
    <td align="center" width="125" class="menuName" >행사명</td>
    <td align="center" width="125"  colspan="5">${article.evtitle}</td>
  </tr>
  <tr>
<td align="center" width="125" class="menuName">태그</td>
    <td align="center" width="125" >${article.tag1}</td>
    <td align="center" width="125" >${article.tag2}</td>
    <td align="center" width="125" >${article.tag3}</td>
    <td align="center" width="125" >${article.tag4}</td>
    <td align="center" width="125" >${article.tag5}</td>
                </tr>
                <tr>
<td align="center" width="125" class="menuName">점수</td>
    <td align="center" width="375"  colspan="5">${article.rating}</td>
                </tr>
  <tr>
<td align="center" width="125" class="menuName">이미지</td>
    <td align="center" width="125" colspan="5" ><img alt="" src="${article.afile}" width="600"></td>
  </tr>
  <tr>
  
  	<!-- <pre>태그 사용 : 웹 상에 불러올 때, 줄바꿈을 만나면 <br>태그로 변환해서 불러오던 메서드 대신  -->
    <td align="center" width="125" class="menuName" >글내용</td>
    <td align="left" width="375" colspan="5"><pre>${article.acontent}</pre></td>
  </tr>
  <tr>
  <td class="menuName">첨부파일</td>
        <td align="left" width="375" colspan="5"><a href="file.do?filename=${article.afile}">${article.afile.substring(5)}</a></td>
   </tr>     
  <tr height="30">      
    <td colspan="6"  align="center" > 
    <c:choose>
<c:when test="${not empty sessionScope.userLoginInfo}">
        <c:if test="${article.writer == sessionScope.userLoginInfo.id}"> 
        <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.do?anum=${article.anum}&pageNum=${pageNum}'">
       &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="글삭제" 
       onclick="document.location.href='deleteForm.do?anum=${article.anum}&pageNum=${pageNum}'">
       &nbsp;&nbsp;&nbsp;&nbsp;  
        </c:if>
    </c:when>
</c:choose>
       <input type="button" value="글목록" 
       onclick="document.location.href='list.do?pageNum=${pageNum}'">
    </td>
  </tr>
</table>
<br><br><br><br>
<form method="post" name="replydelform" action="replyDelete.do">

  <input type="hidden" name="pnum" value="${article.anum}">
  <input type="hidden" name="title" value="덧글">
  <input type="hidden" name="pageNum" value="${pageNum}">
  <input type="hidden" name="anum" value="">
<table width="500" border="1" cellspacing="0" cellpadding="0"  align="center">
<c:if test="${replyNum == 0}">
<tr height="30">
<td align="center" width="500"  colspan="4">덧글이 없습니다.</td>
</tr>
</c:if>
<c:forEach var="reply" items="${repliesList}">
<tr height="30">
    <td align="center" width="125" class="menuName">${reply.writer}</td>
    <td align="left" width="250" colspan="2">${reply.acontent}</td>
    <c:choose>
        <c:when test="${not empty sessionScope.userLoginInfo}">
        <td align="center" width="125" >
        <c:if test="${reply.writer == sessionScope.userLoginInfo.id}">
        
        
        <input type="button" name="${reply.anum}" value="덧글삭제" onclick="delreply(${reply.anum})">
        </c:if>
        </td>
        </c:when>
    </c:choose>
  </tr>
</c:forEach>
</table>
</form>

<form method="post" name="replyform" action="replyWrite.do"
            onsubmit="return writeSave()">
  <input type="hidden" name="anum" value="${article.anum}">
  <input type="hidden" name="title" class="menuName" value="덧글">
  <input type="hidden" name="pageNum" value="${pageNum}">

<table width="500" border="1" cellspacing="0" cellpadding="0"   align="center"> 
    <c:choose>
<c:when test="${not empty sessionScope.userLoginInfo}">
<input  type="hidden" name="writer" value="${sessionScope.userLoginInfo.id}">
<tr height="30">
    <td align="center" width="125" class="menuName">${sessionScope.userLoginInfo.id}</td>
    <td align="left" width="250" colspan="2"><textarea name="acontent" rows="13" cols="40"></textarea></td>
    <td align="center" width="125" ><input type="submit" value="덧글달기"></td>
  </tr>
    </c:when>
<c:otherwise>
<tr height="30">
    <td align="center" width="125" colspan="7">로그인을 하셔야 덧글을 달 수 있습니다.</td>

</c:otherwise>
</c:choose>
  </table>
</form>
</center>
