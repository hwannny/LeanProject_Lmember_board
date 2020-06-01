/**
 * 		회원관리
 */
var iderror = '아이디를 입력하세요';
var passwderror = '비밀번호를 입력하세요';
var repasswderror = '비밀번호가 다릅니다.\n다시 확인하세요';
var nameerror = '이름을 입력하세요';
var juminerror = '주민등록번호를 입력하세요';
var telerror = '전화번호를 완벽하게 입력하세요';
var emailerror = '이메일 형식에 맞게 입력하세요';
var confirmerror = '아이디 중복확인을 해주세요';

var inputerror = '회원가입에 실패했습니다.\n잠시 후 다시 시도하세요.';
var idcheckerror = '입력하신 아이디가 없습니다.\n다시 확인하세요.';
var passwdcheckerror = '입력하신 비밀번호가 다릅니다.\n다시 확인하세요.';

function erroralert( msg ) {
	alert( msg );
	history.back();
}

// 회원 정보 수정
function modifycheck() {
	if( ! modifyform.passwd.value ) {
		alert( passwderror );
		modifyform.passwd.focus();
		return false;
	} else if( modifyform.passwd.value != modifyform.repasswd.value ) {
		alert( repasswderror );
		modifyform.passwd.focus();
		return false;
	}
	if( modifyform.email1.value || modifyform.email2.value ) {
		if( ! modifyform.email1.value || ! modifyform.email2.value ) {
			alert( emailerror );
			modifyform.email1.focus();
			return false;
		} else if( modifyform.email1.value.indexOf( '@' ) != -1
				|| modifyform.email2.value.indexOf( '@' ) != -1 ) {
			alert( emailerror );
			modifyform.email1.focus();
			return false;
		}
	}	
	
	// 전화번호
	// 세 칸 중 한 칸이라도 입력되면 세 칸 모두 데이터가 있어야 한다.
	// 세 칸 모두 데이터가 없으면 넘어가도 된다.
	// 데이터가 있을 경우 3 3 4 크기로 입력해야만 한다
	// 전화번호에는 숫자만 입력되어야 한다. 
	if( modifyform.tel1.value || modifyform.tel2.value || modifyform.tel3.value ) {
		if( modifyform.tel1.value.length < 3 
		|| modifyform.tel2.value.length < 3
		|| modifyform.tel3.value.length < 4 ) {
			alert( telerror );
			modifyform.tel1.focus();
			return false;
		} else if( isNaN( modifyform.tel1.value ) 
				|| isNaN( modifyform.tel2.value ) 
				|| isNaN( modifyform.tel3.value ) ) {
			alert( telerror );
			modifyform.tel1.focus();
			return false;
		}		
	}
	
	
}

// 회원탈퇴
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}
}

// 아이디 중복 확인
function setid( id ) {
	opener.document.inputform.id.value = id;
	window.close();
	opener.document.inputform.passwd.focus();
	opener.document.inputform.check.value = '1';
}

function confirmcheck() {
	if( ! confirmform.id.value ) {
		alert( iderror );
		confirmform.id.focus();
		return false;
	}
}

function confirmid() {
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();
	} else {
		url = 'confirmId.jsp?id=' + inputform.id.value;
		open( url, 'confirm', 'menubar=no,statusbar=no,scrollbar=no,width=450,height=300' );
	}	
}

// 회원가입
function inputcheck() {
	if( inputform.check.value == '0' ) {
		alert( confirmerror );
		inputform.id.focus();
		return false;
	}	
	
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();
		return false;
	} else if( ! inputform.passwd.value ) {
		alert( passwderror );
		inputform.passwd.focus();
		return false;
	} else if( inputform.passwd.value != inputform.repasswd.value ) {
		alert( repasswderror );
		inputform.repasswd.focus();
		return false;
	} else if( ! inputform.name.value ) {
		alert( nameerror );
		inputform.name.focus();
		return false;
	} else if( inputform.jumin1.value.length < 6 || inputform.jumin2.value.length < 7 ) {
		alert( juminerror );
		inputform.jumin1.focus();
		return false;
	}
	
	// 전화번호
	if( inputform.tel1.value || inputform.tel2.value || inputform.tel3.value ) {
		if( inputform.tel1.value.length < 3 
			|| inputform.tel2.value.length < 3
			|| inputform.tel3.value.length < 4 ) {
			alert( telerror );
			inputform.tel1.value = '';
			inputform.tel2.value = '';
			inputform.tel3.value = '';
			inputform.tel1.focus();
			return false;
		}
	}
	
	// 이메일
	// 	1. null 인 경우			이동 가능
	// 	2. 직접입력일 경우		email1 란에 @가 없으면 경고
	// 	3. 선택입력일 경우		email1 란에 @가 있으면 경고

	if( inputform.email1.value ) {
		if( inputform.email2.value == '0' ) {
			// 직접입력
			if( inputform.email1.value.indexOf('@') == -1 ) {
				alert( emailerror );
				inputform.email1.focus();
				return false;
			}
		} else {
			// 선택입력
			if( inputform.email1.value.indexOf('@') != -1 ) {
				alert( emailerror );
				inputform.email1.focus();
				return false;
			}
		}
	}
	
	// 아이디 중복확인
	
	
	
}

function nextjumin1() {
	if( inputform.jumin1.value.length == 6 ) {
		inputform.jumin2.focus();
	}
}
function nextjumin2() {
	if( inputform.jumin2.value.length == 7 ) {
		inputform.email1.focus();
	}
}
function nexttel1() {
	if( inputform.tel1.value.length == 3 ) {
		inputform.tel2.focus();
	}	
}
function nexttel2() {
	if( inputform.tel2.value.length == 4 ) {
		inputform.tel3.focus();
	}	
}
function nexttel3() {
	if( inputform.tel3.value.length == 4 ) {	
		inputform.input.focus();
	}	
}

// 메인 페이지
function maincheck() {
	if( ! mainform.id.value ) {
		alert( iderror );
		mainform.id.focus();
		return false;		
	} else if( ! mainform.passwd.value ) {
		alert( passwderror );
		mainform.passwd.focus();
		return false;
	}	
}












