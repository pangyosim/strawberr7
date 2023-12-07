<!-- login/memberJoinForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>memberJoinForm.jsp</title>
<!-- j쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="resources/css/styles.css" rel="stylesheet" />


<!-- 카카오 로그인 스크립트 추가 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('4a706abbdeb8e6daae8b9e423f1752fd');  // 카카오 개발자 사이트에서 받은 자바스크립트 키를 넣어주세요.

function kakaoLogin() {
    Kakao.Auth.login({
        success: function(response) {
            Kakao.API.request({
                url: '/v2/user/me',
                success: function(response) {
                    var kakaoid = String(response.id);  // 카카오ID를 문자열로 변환
                    $.ajax({
                        url: '/checkUser',
                        type: 'POST',
                        data: JSON.stringify({
                            kakaoid: kakaoid,
                        }),
                        contentType: 'application/json',
                        success: function(data) {
                            location.href="/checkUser";
                        },
                        error: function(error) {
                            console.log(error);
                        },
                    });
                },
                fail: function(error) {
                    console.log(error);
                },
            });
        },
        fail: function(error) {
            console.log(error);
        },
    });
}

// 카카오 로그인 버튼 클릭 이벤트 추가
$(document).ready(function() {
    $('#kakao-login-btn').click(kakaoLogin);
    $('#kakao-unlink-btn').click(kakaoUnlink);
});

function kakaoUnlink() {
    Kakao.API.request({
        url: '/v1/user/unlink',
        success: function(response) {
            console.log(response);
            alert('카카오 연결 해제가 완료되었습니다.');
        },
        fail: function(error) {
            console.log(error);
            alert('카카오 연결 해제에 실패하였습니다.');
        },
    });
}
</script>

<!--  카카오 집주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 로그인.js -->
<script type="text/javascript" src="resources/js/loginScript.js?v=1"></script>



</head>
<link href="resources/css/memberJoinForm.css" rel="stylesheet" />
<body style="text-align: center;">
<c:import url="../main/header.jsp"/>
<div class="" style="margin-top: 100px">
	<h2>회원가입</h2>
		<!-- 카카오~ -->
	<c:if test="${kakaoid == null }">
		<div>
			<button id="kakao-login-btn">카카오 로그인</button>
		</div>
 		<button id="kakao-unlink-btn">카카오 연결 해제</button>	
	</c:if>
	
	
	<form id="memberjoinForm" action="memberJoinResult" method="post">
    <div class="textForm">
        <input type="text" placeholder="아이디" id="loginId" name="loginId" maxlength="20">
        <input type="button" value="중복체크" id="checkBtn">
       	<p id="message"></p>
    </div>
		<input type="hidden" id="kakaoid" name="kakaoid" value="${kakaoid }">
    <div class="textForm">
        <input type="password" placeholder="비밀번호" id="loginPw" name="loginPw" maxlength="20"><br>
        <input type="password" placeholder="비밀번호 확인" name="loginPwConfirm" maxlength="20">     
    </div>
    <div class="textForm">
        <input type="text" placeholder="이름" id="name" name="name" maxlength="50">     
    </div>
    <div class="info" id="info__birth">
      <select class="box" id="birth-year" name="birth-year">
        <option disabled selected>출생 연도</option>
      </select>
      <select class="box" id="birth-month" name="birth-month">
        <option disabled selected>월</option>
      </select>
      <select class="box" id="birth-day" name="birth-day">
        <option disabled selected>일</option>
      </select>
    </div>
    <div class="textForm"> 
        <input type="hidden" id="address_1" name="address_1" placeholder="우편번호" readonly>
        <input type="text" id="address_2" name="address_2" placeholder="주소" readonly>
        <input type="button" onclick="checkAddress()" value="우편번호 찾기"><br>
        <input type="text" id="address_3" name="address_3" placeholder="상세주소">
        <input type="text" id="address_4" name="address_4" placeholder="">
    </div>
    <div class="textForm">
        <input type="text" class="form-control" id="tel" name="tel" placeholder="전화번호" oninput="oninputPhone(this)" maxlength="13">
    </div>
    <div class="textForm">
        <input type="text" class="email_first" id="email" name="email" placeholder="이메일" name="" maxlength="20"> @
        <select class="email_last" id="domain" name="domain">
            <option value="none">-------이메일-------</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
        </select>     
    </div>  
    <input type="button" value="회원가입" onclick="memberJoinFormCheck()"/>
</form>
</div>
<c:import url="../main/footer.jsp"/>
</body>
<style type="text/css">
/* SECTION - BIRTH */
.info#info__birth {
  display: flex;
}

.info#info__birth select {
  margin-left : 7px;
}

.info#info__birth select:first-child {
  margin-left : 0px;
}
.info#info__birth select::-webkit-scrollbar {
  width: 10px;
}

.info#info__birth select::-webkit-scrollbar-thumb {
  background-color: #b6b6b6;
  border-radius: 3px;
}

.info#info__birth select::-webkit-scrollbar-track {
  background-color: #ebe9e9;
  border-radius: 6px;
}
</style>
<script type="text/javascript">


//'출생 연도' 셀렉트 박스 option 목록 동적 생성
const birthYearEl = document.querySelector('#birth-year')
// option 목록 생성 여부 확인
isYearOptionExisted = false;
birthYearEl.addEventListener('focus', function () {
  // year 목록 생성되지 않았을 때 (최초 클릭 시)
  if(!isYearOptionExisted) {
    isYearOptionExisted = true
    for(var i = 1940; i <= 2023; i++) {
      // option element 생성
      const YearOption = document.createElement('option')
      YearOption.setAttribute('value', i)
      YearOption.innerText = i
      // birthYearEl의 자식 요소로 추가
      this.appendChild(YearOption);
    }
  }
});

//'월' 셀렉트 박스 option 목록 동적 생성
const birthMonthEl = document.querySelector('#birth-month')
isMonthOptionExisted = false;
birthMonthEl.addEventListener('focus', function () {
  if(!isMonthOptionExisted) {
    isMonthOptionExisted = true
    for(var i = 1; i <= 12; i++) {
      const monthOption = document.createElement('option')
      monthOption.setAttribute('value', i)
      monthOption.innerText = i
      this.appendChild(monthOption);
    }
  }
});

// '일' 셀렉트 박스 option 목록 동적 생성
const birthDayEl = document.querySelector('#birth-day')
isDayOptionExisted = false;
birthDayEl.addEventListener('focus', function () {
  if(!isDayOptionExisted) {
    isDayOptionExisted = true
    for(var i = 1; i <= 31; i++) {
      const dayOption = document.createElement('option')
      dayOption.setAttribute('value', i)
      dayOption.innerText = i
      this.appendChild(dayOption);
    }
  }
});
/* 카카오 우편 API */
function checkAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("address_4").value = extraAddr;
            
            } else {
                document.getElementById("address_4").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address_1').value = data.zonecode;
            document.getElementById("address_2").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address_3").focus();
        }
    }).open();
}
/*  */


</script>
</html>