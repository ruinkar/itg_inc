<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>  
<head>  
<title>geocoder</title>  
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js">  
</script>  
 <script type="text/javascript"
    src="http://maps.google.com/maps/api/js?key=AIzaSyBaT_zyFWTr33lce048HEerm0JSZQsCvp4&sensor=false&language=ko"></script>
<script type="text/javascript">  
    $(document).ready(function() {  
    	var x = ${dX};
    	var y = ${dY};
    	var saveAddress='${address}';
    	$('#address').val(saveAddress);  
        $('#lat').html(y);  
        $('#lng').html(x);
        $('#lat2').val(y);  
        $('#lng2').val(x);
        
        
        var latlng = new google.maps.LatLng(y, x);  
        var myOptions = {  
              zoom : 12,  
              center : latlng,  
              mapTypeId : google.maps.MapTypeId.ROADMAP  
        }  
        var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);  
        var marker = new google.maps.Marker({  
            position : latlng,   
            map : map  
        });  
          
        var geocoder = new google.maps.Geocoder();  
          
        google.maps.event.addListener(map, 'click', function(event) {  
            var location = event.latLng;  
            geocoder.geocode({  
                'latLng' : location  
            }, function(results, status){  
                if( status == google.maps.GeocoderStatus.OK ) {  
                    $('#address').val(results[0].formatted_address);  
                    $('#lat').html(results[0].geometry.location.lat());  
                    $('#lng').html(results[0].geometry.location.lng());
                    $('#lat2').val(results[0].geometry.location.lat());  
                    $('#lng2').val(results[0].geometry.location.lng());
                }  
                else {  
                    alert("Geocoder failed due to: " + status);  
                }  
            });  
            if( !marker ) {  
                marker = new google.maps.Marker({  
                    position : location,   
                    map : map  
                });  
            }  
            else {  
                marker.setMap(null);  
                marker = new google.maps.Marker({  
                    position : location,   
                    map : map  
                });  
            }  
            map.setCenter(location);  
        });  
          
        $("#address").focusout(function(){  
            var address = $(this).val();  
            if( address != '') {  
                geocoder.geocode({  
                    'address' : address  
                }, function(results, status){  
                    if( status == google.maps.GeocoderStatus.OK ) {  
                        $('#lat').html(results[0].geometry.location.lat());  
                        $('#lng').html(results[0].geometry.location.lng());  
                        map.setCenter(results[0].geometry.location);  
                        if( !marker ) {  
                            marker = new google.maps.Marker({  
                                position : results[0].geometry.location,   
                                map : map  
                            });  
                        }  
                        else {  
                            marker.setMap(null);  
                            marker = new google.maps.Marker({  
                                position :  results[0].geometry.location,   
                                map : map  
                            });  
                        }  
                    }  
                    else {  
                        alert("Geocoder failed due to: " + status);  
                    }  
                });  
            }  
        });  
    });  
</script>  
<script>
function evCheck(){
    document.evForm.submit();
}

function sendevent(){
    //우편번호에 대입
    //opener->부모창을 가리키는 예약어
    //opener.document.폼객체명.입력양식.value=값;
    var lat = document.evForm.lat2.value;
    var lng = document.evForm.lng2.value;
    var location = document.evForm.address.value;
    opener.document.writeForm.
    lat.value=lat;
    opener.document.writeForm.
    lng.value=lng;
    opener.document.writeForm.
    location.value=location;
    //자식창(우편번호검색창)
    self.close();
    }
</script>

</head>  
<body>  
<form name="evForm" method="post" action="locSearch.do">
    <input type="hidden" name="check" value="n">
    <table border="1">
			<tr>
				<td><br> 지역 입력:<input type="text" name="keyWord">
					<input type="button" value="검색" onclick="evCheck()"></td>
			</tr>
			<c:if test="${check == 'n'}">
				<tr>
					<td colspan="2"><div id="map_canvas"
							style="width: 460px; height: 380px;"></div></td>
				</tr>
				<tr>
					<th width="100">위도</th>
					<td id="lat"></td>
				</tr>
				<tr>
					<th>경도</th>
					<td id="lng"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" id="address" value="" size="30" />
					<input type="hidden" id="lat2" value="" size="30" />
					<input type="hidden" id="lng2" value="" size="30" /></td>
				</tr>
				
				<tr>
				<td><input type="button" value="저장하기" onclick="sendevent()"></td>
				</tr>
			</c:if>
		</table>
	</form>
</body>  
</html>  
