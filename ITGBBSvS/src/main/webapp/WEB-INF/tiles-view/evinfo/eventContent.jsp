<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="legacy.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>게시판</title>

<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?key=AIzaSyA4GptBJKgT9JdGs9KHS8YuFK_LGcXBRcA&sensor=false&language=ko"></script>

<script>
    function initialize() {
    	var lat =${earticle.lat};
    	var lng =${earticle.lng};
        var myLatlng = new google.maps.LatLng(lat, lng); // y, x좌표값
        /* var myLatlng = new google.maps.LatLng(126.9783880, 37.5666100); // y, x좌표값 */
        var mapOptions = {
            zoom : 15,
            center : myLatlng,
            mapTypeId : google.maps.MapTypeId.ROADMAP
        }

        var map = new google.maps.Map(document.getElementById('map_canvas'),
                mapOptions);
        var marker = new google.maps.Marker({
            position : myLatlng,
            map : map,
            title : "테스트"
        });
        var infowindow = new google.maps.InfoWindow({
            content : "<h1>테스트용</h1>",
            maxWidth : 300
        });

        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
    }
</script>

</head>
<body onload="initialize()">
	<div class="view_wrap">
		<h3 align="center">${barticle.title}</h3>
		<div class="info_sec">
			<p class="img">
				<a href="file.do?filename=${earticle.eimg}" target="_blank" title="새창 열림">
					<img src='"${earticle.eimg}"' width="115px" alt="" />
				</a> 
			</p>
			<div class="txt">
				<dl>
					<h3>주최/주관</h3>
					<dd>${earticle.host}</dd>
					<h3>기간</h3>
					<dd>${earticle.begin}</dd>
					~
					<dd>${earticle.end}</dd>
					<h3>장소</h3>
					<dd>${earticle.location}</dd>
					<div id="map_canvas" style="width: 400px; height: 300px;"></div>
					<dd>태그1:${barticle.tag1}</dd>
					<dd>태그2:${barticle.tag2}</dd>
					<dd>태그3:${barticle.tag3}</dd>
					<dd>태그4:${barticle.tag4}</dd>
					<dd>태그5:${barticle.tag5}</dd>
					<h3>글내용</h3>
					<dd><pre>${barticle.acontent}</pre></dd>
				</dl>
			</div>
		</div>
		<div class="detail_sec">
			
		</div>
	</div>
	    <c:choose>
<c:when test="${not empty sessionScope.userLoginInfo}">
        <c:if test="${barticle.writer == sessionScope.userLoginInfo.id}"> 
        <input type="button" value="글수정" 
       onclick="document.location.href='updateForm.do?anum=${barticle.anum}&pageNum=${pageNum}'">
       &nbsp;&nbsp;&nbsp;&nbsp;
      <input type="button" value="글삭제" 
       onclick="document.location.href='deleteForm.do?anum=${barticle.anum}&pageNum=${pageNum}'">
       &nbsp;&nbsp;&nbsp;&nbsp;  
        </c:if>
    </c:when>
</c:choose>
<input type="button" value="목록보기" OnClick="window.location='list.do'">
</body>