<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="legacy.model.*, java.util.*, java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
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
<div id="mainContent">
<!-- Container (Portfolio Section) -->
<div class="container-fluid text-center bg-grey">
	<div class="row text-center">
		<c:forEach var="article" items="${articleList}">
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href="eventContent.do?anum=${article.evnum}&pageNum=${currentPage}">
						<img src="${article.eimg}" alt="Paris" width="400" height="300">
							<p>
								<strong>${article.ename}</strong>
							</p>
							<p>${article.host}</p> </img>
							</a>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<center>${pagingHtml }</center>
</div>

<%-- <div id="mainContent">
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
	</div> --%>


