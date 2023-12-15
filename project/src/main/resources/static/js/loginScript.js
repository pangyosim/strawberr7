



function userCheck(){

	var IMP = window.IMP;
	IMP.init("imp40114442");
	IMP.certification({
		pg : "danal",
		merchant_uid : "",
		m_redirect_url : "https://e707-123-142-55-115.ngrok-free.app",
		popup : true
		},function(rsp){
			if(rsp.success){
				alert("인증이 완료되었습니다");
				isNameCheck= true;				
			}else{
				alert("인증에 실패했습니다. 에러 내용 : " + rsp.error_msg);
			}
		});
}
/* 전화번호'-'자동으로 변경, 숫자외 입력 불가' */
function oninputPhone(target) {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
}
var isIdDuplicate = true;  // 아이디 중복 여부를 저장하는 변수
var isNameCheck = false;
var isEmailCheck = false;
// 아이디 중복 여부 확인
$(document).ready(function(){
    var loginId = $("#loginId");
    var message = $("#message");  // 메시지를 표시할 요소
    $("#checkBtn").click(function(){
        // 아이디
        if(loginId.val() == '') {
            alert('아이디를 입력해주세요.');
            loginId.focus();
            return false;
        }
        
        // 아이디 길이 확인
        if(loginId.val().length < 3) {
            alert('아이디는 최소 3글자 이상 입력해야 합니다.');
            loginId.focus();
            return false;
        }
        
        var id = loginId.val();
        
        $.ajax({
            url: "/idCheck",  // 아이디 중복 확인을 처리하는 서버의 URL
            type: "POST",
            data: {
                loginId: id
            },
            success: function(data) {
                if(data.isDuplicate) {
                    loginId.css('backgroundColor', 'red');
                    isIdDuplicate = true;
                    message.text("중복된 Id 입니다.");
                } else {
                    loginId.css('backgroundColor', 'green');
                    isIdDuplicate = false;
                    message.text("생성 가능한 Id 입니다.");
                }
            }
        });
        
    });
    
    loginId.on('input', function() {
        loginId.css('backgroundColor', '');
        isIdDuplicate = true;
        message.text("");  // 아이디 입력 필드의 내용이 변경되면 메시지 삭제
    });
    
    $("#memberjoinForm").submit(function(e){
        if(isIdDuplicate) {
            alert("아이디 중복을 확인해주세요.");
            loginId.focus();
            e.preventDefault();  // form의 submit을 방지합니다.
        }
    });
});
// 회원가입 데이터 확인(아이디, 비밀번호, 비밀번호 확인, 이메일 입력 여부 확인)
function memberJoinFormCheck() {

    // 체크박스 요소를 가져옵니다.
    var agreeTerms = document.getElementById('agreeTerms');

    // 체크박스가 선택되어있지 않다면, 폼 제출을 중지합니다.
    if (!agreeTerms.checked) {
        alert('서비스 이용 약관에 동의해야 계속할 수 있습니다.');
        event.preventDefault(); // 폼 제출 이벤트를 중지합니다.
        return false; // 함수 실행을 중지합니다.
    }

    // 아이디
    var loginId = document.getElementById('loginId');
    if(loginId.value == '') {
        alert('아이디를 입력해주세요.');
        loginId.focus();
        return false;
    }
    
    // 아이디 길이 확인
	if(loginId.value.length < 3) {
	    alert('아이디는 최소 3글자 이상 입력해야 합니다.');
	    loginId.focus();
	    return false;
	}
    // 아이디 중복 확인
    if(isIdDuplicate) {
        alert("아이디 중복을 확인해주세요.");
        loginId.focus();
        return false;
    }
	
    // 비밀번호
    var loginPw = document.getElementById('loginPw');
    if(loginPw.value == '') {
        alert('비밀번호를 입력해주세요.');
        loginPw.focus();
        return false;
    }
    // 비밀번호 확인
    var loginPwConfirm = document.getElementsByName('loginPwConfirm')[0];
    if(loginPwConfirm.value == '') {
        alert('비밀번호 확인을 입력해주세요.');
        loginPwConfirm.focus();
        return false;
    }
    // 비밀번호 일치 확인
    if(loginPw.value != loginPwConfirm.value) {
        alert('비밀번호가 일치하지 않습니다.');
        loginPwConfirm.focus();
        return false;
    }
    // 이름
    var name = document.getElementById('name');
    if(name.value == '') {
        alert('이름을 입력해주세요.');
        name.focus();
        return false;
    }
    // 생일 년
	var birthYear = document.getElementById('birth-year');
	if(birthYear.value == '' || birthYear.value == '출생 연도') {
	    alert('출생 연도를 선택해주세요.');
	    birthYear.focus();
	    return false;
	}
	// 생일 월
	var birthMonth = document.getElementById('birth-month');
	if(birthMonth.value == '' || birthMonth.value == '월') {
	    alert('월을 선택해주세요.');
	    birthMonth.focus();
	    return false;
	}
	// 생일 일
	var birthDay = document.getElementById('birth-day');
	if(birthDay.value == '' || birthDay.value == '일') {
	    alert('일을 선택해주세요.');
	    birthDay.focus();
	    return false;
	}
	// 우편번호
	var address_1 = document.getElementById('address_1');
	if(address_1.value == '') {
	    alert('주소를 입력해주세요.');
	    address_1.focus();
	    return false;
	}
	
	// 전화번호
	var tel = document.getElementById('tel');
	if(tel.value == '') {
	    alert('전화번호를 입력해주세요.');
	    tel.focus();
	    return false;
	}
	
	// 전화번호 형식 확인
	var telRegex = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if (!telRegex.test(tel.value)) {
	    alert('전화번호 형식이 올바르지 않습니다.');
	    tel.focus();
	    return false;
	}
	
	// 이메일 인증, 본인인증 확인
	if( isNameCheck != true){
		alert('본인인증 해주세요.');
		return false;
	}
	
	if( isEmailCheck != true){
		alert('이메일 인증 해주세요.')
		return false;
	}



    // 모든 검증을 통과하면 form을 제출
    document.querySelector('form').submit();
}



// 회원 수정~~~~~~
	function memberUpdateCheck() {

    // 비밀번호
    var loginPw = document.getElementById('loginPw');
    if(loginPw.value == '') {
        alert('비밀번호를 입력해주세요.');
        loginPw.focus();
        return false;
    }
    // 비밀번호 확인
    var loginPwConfirm = document.getElementsByName('loginPwConfirm')[0];
    if(loginPwConfirm.value == '') {
        alert('비밀번호 확인을 입력해주세요.');
        loginPwConfirm.focus();
        return false;
    }
    // 비밀번호 일치 확인
    if(loginPw.value != loginPwConfirm.value) {
        alert('비밀번호가 일치하지 않습니다.');
        loginPwConfirm.focus();
        return false;
    }
    // 이름
    var nickname = document.getElementById('nickname');
    if(nickname.value == '') {
        alert('닉네임을 입력해주세요.');
        nickname.focus();
        return false;
    }
    // 생일 년
	var birthYear = document.getElementById('birth-year');
	if(birthYear.value == '' || birthYear.value == '출생 연도') {
	    alert('출생 연도를 선택해주세요.');
	    birthYear.focus();
	    return false;
	}
	// 생일 월
	var birthMonth = document.getElementById('birth-month');
	if(birthMonth.value == '' || birthMonth.value == '월') {
	    alert('월을 선택해주세요.');
	    birthMonth.focus();
	    return false;
	}
	// 생일 일
	var birthDay = document.getElementById('birth-day');
	if(birthDay.value == '' || birthDay.value == '일') {
	    alert('일을 선택해주세요.');
	    birthDay.focus();
	    return false;
	}
	// 우편번호
	var address_1 = document.getElementById('address_1');
	if(address_1.value == '') {
	    alert('주소를 입력해주세요.');
	    address_1.focus();
	    return false;
	}
	
	// 전화번호
	var tel = document.getElementById('tel');
	if(tel.value == '') {
	    alert('전화번호를 입력해주세요.');
	    tel.focus();
	    return false;
	}
	
	// 전화번호 형식 확인
	var telRegex = /^\d{2,3}-\d{3,4}-\d{4}$/;
	if (!telRegex.test(tel.value)) {
	    alert('전화번호 형식이 올바르지 않습니다.');
	    tel.focus();
	    return false;
	}

    // 모든 검증을 통과하면 form을 제출
    document.querySelector('form').submit();

}


 function sendNumber(){
    		var mailf = document.getElementsByClassName('mail')[0];
    	    var maill= document.getElementsByClassName('domain')[0];
    	    if(mailf.value == '' || maill.value == 'none') {
    	        alert('이메일을 입력해주세요.');
    	        return false;
    	    }
    		var email = mail_input + "@" + domain;
    		var exptext = /^[\w]([-_.]?[\w])*@[\w]([-_.]?[\w])*\.[a-zA-Z]{2,3}$/i;
    		if(!exptext.test(email)){
    		$("#mail_number").css("display","block");
    		$.ajax({
    			url:"mail",
    			type:"post",
    			dataType:"json",
    			data:{"mail" : $("#mail").val()+"@"+$("#domain").val()},
    			//mail:email,
    			success: function(data){
    				alert("인증번호 발송");
    				$("#Confirm").attr("value",data);
    			}
    		});
    		} else{
    			alert("이메일 형식이 올바르지 않습니다");
    	}
}

function confirmNumber(){
	var number1 = $("#number").val();
	var number2 = $("#Confirm").val();
	
	if(number1 == number2){
		alert("인증되었습니다");
		isEmailCheck=true;
	} else{
		alert("번호가 다릅니다")
	}
}