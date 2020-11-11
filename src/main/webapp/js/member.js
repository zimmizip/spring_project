function inputCheck() {

	if (document.user.id.value == "") {
		alert("아이디를 입력해주세요.");
		document.user.id.focus();
		return;
	}
	if (document.user.password.value == "") {
		alert("비밀번호를 입력해 주세요.");
		document.user.password.focus();
		return;
	}
	if (document.user.repassword.value == "") {
		alert("비밀번호를 확인해 주세요");
		document.user.repassword.focus();
		return;
	}
	if (document.user.password.value != document.regFrm.repassword.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.user.repassword.value = "";
		document.user.repassword.focus();
		return;
	}
	if (document.user.name.value == "") {
		alert("이름를 입력해 주세요.");
		document.user.name.focus();
		return;
	}
 

	if (document.user.tel.value == "") {
		alert("전화번호를 입력해 주세요.");
		return;
	}

	document.user.submit();
}

function win_close() {
	self.close();
}