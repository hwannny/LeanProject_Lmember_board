var writererror = "작성자를 입력하세요";
var subjecterror = "글제목을 입력하세요"; 
var contenterror = "글내용을 입력하세요";
var passwderror = "비밀번호를 입력하세요";

var inserterror = "글작성에 실패했습니다\n잠시 후 다시 작성하세요";

function erroralert( msg ){
	alert( msg );
	history.back();
}

/**************writeForm.jsp**************/
//글쓰기
function writecheck() {
	if( ! writeform.writer.value ) {
		alert( writererror );
		writeform.writer.focus();
		return false;
	} else if( ! writeform.subject.value ) {
		alert( subjecterror );
		writeform.subject.focus();
		return false;
	} else if( ! writeform.content.value ) {
		alert( contenterror );
		writeform.content.focus();
		return false;
	} else if( ! writeform.passwd.value ) {
		alert( passwderror );
		writeform.passwd.focus();
		return false;
	}
}


