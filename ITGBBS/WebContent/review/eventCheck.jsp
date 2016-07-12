<%@page import="model.BoardDTO"%>
<%@page import="model.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%
//Register.jsp->ZipCheck()->
//ZipCheck.jsp?check=y
request.setCharacterEncoding("utf-8");

String check=request.
                           getParameter("check");
String event=request.
                           getParameter("evdata"); 
//검색된 값을 받아옴
ReviewDAO rvdao=new ReviewDAO();
Vector<BoardDTO> evList=rvdao.evRead(event);
int totalList=evList.size();
System.out.println("검색된수="+totalList);
 %> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이벤트 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" src="script.js"></script>
<script>
function sendevent(evTitle , evNum){
	//우편번호에 대입
	//opener->부모창을 가리키는 예약어
	//opener.document.폼객체명.입력양식.value=값;
	opener.document.writeForm.
	evnum.value=evNum;
	opener.document.writeForm.
	evtitle.value=evTitle;
	//자식창(우편번호검색창)
	self.close();
	}

</script>
</head>
<body bgcolor="#FFFFCC">
	<center>
		<b>행사 찾기</b>
		<form name="evForm" method="post" action="eventList.do">
			<input type="hidden" name="check" value="n">
			<table>
				<!--ZipCheck.jsp?area3='미아2동'&check=n  -->
				<!-- 특정jsp에 매개변수를 전달 -->
				<tr>
					<td><br> 행사이름 입력:<input type="text" name="search">
						<input type="button" value="검색" onclick="evCheck()"></td>
				</tr>



				<!-- 검색버튼을 눌렀다면 -->
				<c:if test="${check == 'n'}">
					<c:if test="${count == 0}">
						<tr>
							<td align="center"><br>검색된 레코드가 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${count > 0}">
						<tr>
							<td align="center"><br> *검색후 ,아래 행사명을 클릭하면 자동으로 입력됩니다</td>
						</tr>

						<c:forEach var="article" items="${articleList}">
							<tr>
								<td><a
									href="JavaScript:sendevent('${article.title}','${article.anum}')">${article.title}</a>
								</td>
							</tr>
						</c:forEach>
                        <tr><td  align="center">
						<fmt:parseNumber var="result"
							value="${(currentPage - 1) / blockSize}" integerOnly="true" />
						<c:set var="startPage" value="${result * blockSize + 1}" />
						<c:set var="endPage" value="${startPage + blockSize - 1}" />
						<c:set var="endPage"
							value="${endPage>pageCount ? pageCount : endPage}" />
						<!-- 이전 블럭 → 11 → 10 -->
						<c:if test="${startPage>blockSize}">
							<a href="eventList.do?pageNum=${startPage - blockSize}&check=${check}&search=${search}">[이전]</a>
							<!-- [이전] 11 12 13...20 -->
						</c:if>
						<!-- 현재 블럭 -->
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<a href="eventList.do?pageNum=${i}&check=${check}&search=${search}">[${i}]</a>
						</c:forEach>

						<c:if test="${endPage<pageCount}">
							<a href="eventList.do?pageNum=${startPage + blockSize}&check=${check}&search=${search}">[다음]</a>
						</c:if>
						</td></tr>
					</c:if>
				</c:if>
				<tr>
					<td align="center"><br> <a href="JavaScript:this.close()">닫기</a>
			</table>
		</form>
	</center>
</body>
</html>