<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>이벤트 맵</title>
    <style >
      body {
        margin: 0;
        padding: 10px 20px 20px;
        font-family: Arial;
        font-size: 16px;
      }
      #map-container {
        padding: 6px;
        border-width: 1px;
        border-style: solid;
        border-color: #ccc #ccc #999 #ccc;
        -webkit-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
        -moz-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
        box-shadow: rgba(64, 64, 64, 0.1) 0 2px 5px;
        width: 820px;
        float: left;
      }
      #map-info {
        padding: 6px;
        border-width: 1px;
        border-style: solid;
        border-color: #ccc #ccc #999 #ccc;
        -webkit-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
        -moz-box-shadow: rgba(64, 64, 64, 0.5) 0 2px 5px;
        box-shadow: rgba(64, 64, 64, 0.1) 0 2px 5px;
        width: 300px;
        height: 600px;
        float: left;
      }
      #map {
      width: 800px;
     
      
      height: 600px;      }
      #map-info{
      float: left;
      margin:10px;
      }
    </style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js">  </script>
<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?key=AIzaSyBaT_zyFWTr33lce048HEerm0JSZQsCvp4&sensor=false&language=ko"></script>
 <script type="text/javascript" src="<c:url value="/resources/js/markerclusterer.js"/>"></script>
    <script>
    var counter=0;
      function initialize() {
        var center = new google.maps.LatLng(37.56661, 126.978388);

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 9,
          center: center,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        var markers = [];
        var $listmap = ${listmap};
        var count = Object.keys($listmap.MapJson).length;
        
        for (var i = 0; i < count; i++) {
          
        	addMarker($listmap.MapJson[i])
       }
        function addMarker( data)
        {
        	/*여기에 좌표값을 넣으면 됨*/
           var latLng = new google.maps.LatLng(data.lat,
        		  data.lng);
          var marker = new google.maps.Marker({
            position: latLng,
            map : map,
            title:'테스트'
          });
          markers.push(marker);
          var infowindow = new google.maps.InfoWindow({
        	  content : "<img src='"+data.eimg+"' width='115px'/><br><h3>"+data.ename+"</h3>",
              maxWidth : 300
          });
          google.maps.event.addListener(marker, 'click',function() {
        	  infowindow.open(map, marker);
        	  $('#ename').html(data.ename);
        	  $('#host').html(data.host);
        	  $('#begin').html(data.begin);
        	  $('#end').html(data.end);
        	  $('#loc').html(data.location);
        	   
          });
        }
         
        var markerCluster = new MarkerClusterer(map, markers, {imagePath: '../resources/img/m'});
         
      }
      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
  </head>
  <body>
    <div id="map-container"><div id="map"></div></div>
    <div id="map-info">
			<dl>
				<h3>제목</h3>
                <dd id="ename"></dd>
				<h3>주최/주관</h3>
				<dd id="host"></dd>
				<h3>기간</h3>
				<dd id="begin"></dd>
				~
				<dd id="end"></dd>
				<h3>장소</h3>
				<dd id="loc"></dd>
				</dl>
		</div></body>
</html>

