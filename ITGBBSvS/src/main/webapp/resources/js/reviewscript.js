function writeSave(){
	
	if(document.writeForm.title.value==""){
	  alert("제목을 입력하십시요.");
	  document.writeForm.title.focus();
	  return false;
	}
	if(document.writeForm.evtitle.value==""){
		  alert("행사를 입력하십시요.");
		  document.writeForm.evtitle.focus();
		  return false;
		}
	if(document.writeForm.content.value==""){
	  alert("내용을 입력하십시요.");
	  document.writeForm.content.focus();
	  return false;
	}
	if(document.writeForm.rating.value==""){
		  alert("점수를 입력하십시요.");
		  document.writeForm.rating.focus();
		  return false;
		}
 }

function eventCheck(){
	//check->검색어를 입력하기전의 창의
	//모습으로 띄우기위해서 매개변수를 전달
	
    url="eventList.do?check=y";
    window.open
	 (url,"get","width=500,height=300," +
	 		"status=yes,scrollbars=yes,menubar=no");
}

function locCheck(){
	//check->검색어를 입력하기전의 창의
	//모습으로 띄우기위해서 매개변수를 전달
	
    url="locSearch.do?check=y";
    window.open
	 (url,"get","width=500,height=600," +
	 		"status=yes,scrollbars=yes,menubar=no");
}

