/**
 * xhr객체생성->searchWord.jsp 요청 searchWord.html에 출력
 */
var xhrObject;// xhr객체를 저장

var word;// 이벤트가 발생된 객체를 저장

// xhr객체를 만들어주는 함수
function createXHR() {
	if (window.XMLHttpRequest) {// IE외의 다른
		xhrObject = new XMLHttpRequest();
		// alert(xhrObject)
	}
}
// 요청매개변수를 따로 전달해주는 함수
// 캐시저장->메모리에 저장되지않게 설정
// 시간을 같이 출력시켜서 전송시켜준다.
function getParameterValues() {
	var id = $("id").value;
	return "id=" + id + "&timestamp=" + new Date().getTime();
}
// 중복id를 입력했을때 호출하는 함수
function idCheck(id) {
	if (id == "") {
		$("ducheck").innerHTML = "<font color='red'>" + "아이디를 먼저 확인해주세요</font>";
		$("id").focus();// 커서입력
		return false;
	}
	// 1.xhr객체생성
	createXHR();
	// 2.xhr객체->요청url입력
	var url = "http://localhost:8090/ITGBBS/member/" + "IdCheck.jsp?"
			+ getParameterValues();
	// alert(url);
	// 3.콜백함수 요청
	xhrObject.onreadystatechange = resultProcess;
	// 4.open
	xhrObject.open("Get", url, "true");
	// 5.send->서버에 전송
	xhrObject.send(null);

}

// 콜백함수<-xhrObject
function resultProcess() {
	if (xhrObject.readyState == 4) {// 요청을 다받은경우
		if (xhrObject.status == 200) {// 처리해준경우
			confirmProcess();
		}
	}
}
// 실질적인 콜백함수
function confirmProcess() {
	var result = xhrObject.responseText;
	// alert(result);
	$("ducheck").innerHTML = result;
}
