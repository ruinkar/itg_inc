<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="legacy.model.*, java.util.*, java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
td{align:center; width:180px; height:50px;}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>EventMain</title>
</head>

<body>
    <div id="leftMenu">
		<input type="button"
			style="width: 120px; height: 120px; background-color: hotpink" name="postButton" value="포스트형" onclick="" />
			 <input type="button"
			style="width: 120px; height: 120px; background-color: lime" name="calendarButton" value="달력형" onclick="" /> 
			<input type="button"
			style="width: 120px; height: 120px; background-color: cyan" name="mapButton" value="지도형" onclick="window.location='eventMap.do'" />
			<c:choose>
                <c:when test="${not empty sessionScope.userLoginInfo}">
                <input type="button" value="행사글올리기" OnClick="window.location='eventWrite.do'"/>
            </c:when>
            </c:choose>
            
			
	</div>
	<div id="mainContent">
		<!-- <img src="../images/fonz2.png" style="width: 560px; height: 400px"></img>
		 -->
		<br/>
		
	   <c:if test="${count > 0}">
		<c:forEach var="article" items="${articleList}">
		<a href="eventContent.do?anum=${article.evnum}&pageNum=${currentPage}">
		<div class="box">
        <div class="box_top">
                <table >
                    <tr>
                        <td><img src="${article.eimg}" width="150px" height="150px"/>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="box_bottom">
                <table border="1">
                    <tr>
                        <td>글번호 </td><td>${article.evnum}</td>
                        
                         
                    </tr>
                    <tr>
                    <td>행사명 </td> <td>${article.ename}</td>
                    </tr>
                    <tr>
                    <td>주최자  </td> <td>${article.host}</td>
                    </tr>
                </table>
            </div>
        </div>
        </a>
		</c:forEach>
		</c:if>
			<br>
			<center>
			 ${pagingHtml }
			 </center>
	</div>
	
</body>
</html>
