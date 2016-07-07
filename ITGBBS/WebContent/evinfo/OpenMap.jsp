<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*, java.net.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
    
    request.setCharacterEncoding("UTF-8");
    String add1 = request.getParameter("address1");
    /* String add2 = request.getParameter("address2"); */
    /* System.out.println(add1 + add2); */
    String naverUrl = "http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=utf-8&coord=LatLng&query=";
    String address = naverUrl + add1;
    System.out.println(address);
    
    URL url = new URL(address);
    URLConnection connection = url.openConnection();
    
    connection.setDoInput(true);
    BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
    String inputLine;
    
    String result = "";
    
    while((inputLine = br.readLine()) != null) {
        result += inputLine.trim();
    }
    
    System.out.println(result);
    
    
    String x = result.substring(result.indexOf("<x>") +3, result.indexOf("</x>"));
    String y = result.substring(result.indexOf("<y>") +3, result.indexOf("</y>"));
    
    System.out.println(x + ", " + y);
%>

<head>
<title>구글지도</title>

<script type="text/javascript"
    src="http://maps.google.com/maps/api/js?key=AIzaSyA4GptBJKgT9JdGs9KHS8YuFK_LGcXBRcA&sensor=false&language=ko"></script>

<script>
    function initialize() {
        var myLatlng = new google.maps.LatLng(<%=y%>, <%=x%>); // y, x좌표값
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
    <div id="map_canvas" style="width: 1200px; height: 800px;"></div>

</body>
</html>
