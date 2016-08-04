<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="inc.itgbbs.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
            content : "<h1>${earticle.ename}</h1>",
            maxWidth : 300
        });

        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        });
    }
    
    $(function() {
    	initialize();
    }); // $.ready()
</script>



<div class="container">
  <table class="table table-striped col-xs-12">
      <tr>
        <td colspan="3">
        <img src="${earticle.eimg}" class="img-responsive" alt="Cinque Terre" width=" " height="236">
      </tr>
      <tr>
        <td colspan="3">${barticle.writer}</td>
      </tr>
      <tr>
        <td>${barticle.anum}</td>
        <td><button type="button" class="btn btn-info">${barticle.tag1}</button>
        <button type="button" class="btn btn-info">${barticle.tag2}</button>
        <button type="button" class="btn btn-info">${barticle.tag3}</button>
        <button type="button" class="btn btn-info">${barticle.tag4}</button>
        <button type="button" class="btn btn-info">${barticle.tag5}</button>
        <br>
        <p>
        <b>${earticle.ename}</b>
        </p>
        </td>
        <td rowspan="4">
        <div class="text-center">
                        <a onclick="itgUtil.voteAjax(${barticle.anum})"
                            class="row btn btn-default btn-lg" id="btn-vote"><span
                            class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span>
                            <!-- 추천 수 --><span id="txt-vote">${voteNum}</span></a>
         
						<c:choose><c:when test="${not empty sessionScope.userLoginInfo}">
						<c:if test="${barticle.writer == sessionScope.userLoginInfo.id}">
									<div class="dropdown text-center">
										<button type="button"
											class="row btn btn-default btn-lg btn-wide dropdown-toggle"
											id="dropdownMenu1" title="게시물 설정" data-toggle="dropdown"
											data-placement="left" aria-expanded="true"><span class="glyphicon glyphicon-cog" aria-hidden="true">
											</span><span class="caret">
											</span>
											</button>
										<ul class="dropdown-menu" role="menu"
											aria-labelledby="dropdownMenu1">
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="updateForm.do?anum=${barticle.anum}&pageNum=${pageNum}">수정</a></li>
											<li role="presentation"><a role="menuitem" tabindex="-1"
												href="deleteForm.do?anum=${barticle.anum}&pageNum=${pageNum}">삭제</a></li>
										</ul>
									</div>
								</c:if>
								</c:when>
						</c:choose>
						<p>
						<button type="button" class="row btn btn-default btn-lg" OnClick="window.location='list.do'">목록</button>
</div>
			</td>
      </tr>
      <tr>
      <td>주최자 </td>
      <td>${earticle.host} </td>
      </tr>
      
      <tr>
      <td>행사 일정 </td>
      <td>${earticle.begin} ~  ${earticle.end}</td>
      </tr>
      <tr>
      <td> 행사 장소</td>
      <td><b>${earticle.location}</b>
      <p>
      <div id="map_canvas" style="width: 600px; height: 400px;"></div>
      </p>
      </td>
      </tr>
      <tr>
      <td colspan="2">
      <pre>${barticle.acontent}</pre>
      </tr>
    </tbody>
  </table>
</div>



	<%-- <div class="view_wrap">
		<h3 align="center">${barticle.title}</h3>
		<div class="info_sec">
			<p class="img">
				<a href="file.do?filename=${earticle.eimg}" target="_blank" title="새창 열림">
					<img src="${earticle.eimg}" width="115px" alt="" />
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
	</div> --%>
