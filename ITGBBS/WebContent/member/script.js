function loginCheck() {
	if (document.login.mem_id.value == "") {
		alert("아이디를를 입력해 주세요.");
		document.login.mem_id.focus();
		return; // return false;
	}
	if (document.login.mem_passwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.login.mem_passwd.focus();
		return;
	}
	document.login.submit();
}
// 회원가입버튼을 클릭
function memberReg() {
	// document.location.href="이동페이지명";
	// document.location="Register.jsp";
	document.location = "Register2.jsp";
}

function inputCheck() {
	if (document.regForm.mem_id.value == "") {
		alert("아이디를 입력해 주세요.");
		document.regForm.mem_id.focus();
		return;
	}
	if (document.regForm.mem_passwd.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.regForm.mem_passwd.focus();
		return;
	}
	if (document.regForm.mem_repasswd.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.regForm.mem_repasswd.focus();
		return;
	}
	if (document.regForm.mem_name.value == "") {
		alert("이름을 입력해 주세요.");
		document.regForm.mem_name.focus();
		return;
	}

	if (document.regForm.mem_email.value == "") {
		alert("이메일을 입력해 주세요.");
		document.regForm.mem_email.focus();
		return;
	}
	if (document.regForm.mem_phone.value == "") {
		alert("연락처를 입력해 주세요.");
		document.regForm.mem_phone.focus();
		return;
	}
	if (document.regForm.mem_job.value == "0") {
		alert("직업을 선택해 주세요.");
		document.regForm.mem_job.focus();
		return;
	}

	if (document.regForm.mem_passwd.value != document.regForm.mem_repasswd.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regForm.mem_repasswd.focus();
		return;
	}
	// RegisterProc.jsp
	document.regForm.submit();
}

// 중복ID체크 해주는 자바스크립트함수 선언
/*
 * function idCheck(id){ if(id==""){ alert("아이디를 먼저 입력하세요");
 * document.regForm.mem_id.focus(); }else{ //IdCheck.jsp?mem_id
 * url="IdCheck.jsp?mem_id="+id; window.open
 * (url,"post","width=300,height=150"); } }
 */

