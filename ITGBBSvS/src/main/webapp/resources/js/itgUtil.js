/**
 * 전 페이지에서 공통적으로 사용 가능한 메서드 모음 
 * 
 */
var itgUtil = {
	
};

itgUtil.paramFromGet = function(href, param) {
	var p = href.indexOf(param);
	var value = href.substr(p);
	p = value.indexOf("&");
	value = p !== -1 ? value.substring(0, p) : value;
	p = value.indexOf("=");
	value = value.substr(p + 1);
	console.log(value);
	
	return value;
}

itgUtil.thumbCheck = function(thumb) {
	var result = "url('/img/noimage150.jpg')";
	var suffix = " no-repeat center";
	
	if (thumb.indexOf(".jpg") !== -1) {
		result = "url('" + thumb + "')";
	}
	
	return result + suffix;
}


itgUtil.imgCheck = function(writer, size) {
	var result = "/img/noimage" + size + "jpg";
	var thumbnail = "";
	
	
	if (thumbnail.indexOf(".jpg") !== -1) {
		result = thumbnail;
	}
	
	return result;
}

itgUtil.voteAjax = function(anum) {
	
	var waitSec = 3000;
	var $txt = $("#txt-vote");
	var old = $txt.text();
	var $btn = $("#btn-vote");
	
	$.ajax({
		url:"./vote.do",
		data:{
			anum: anum
		},
		dataType: "text"
	}).done(function(data){
		console.log(data);
		
		$txt.text(data);
		
		if(old < data) {
			alert("추천 성공");
		} else {
			alert("추천 취소");
		}
		
	}).fail(function(request, status, error) {
		console.log(error);
		console.log(request.responseText);
	});
}