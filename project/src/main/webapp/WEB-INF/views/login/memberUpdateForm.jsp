<!-- login/memberUpdateForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>memberUpdateForm.jsp</title>

<!-- j쿼리 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!--  카카오 집주소API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 로그인.js -->
<script type="text/javascript" src="resources/js/loginScript.js?v=2"></script>

<link href="resources/css/styles.css" rel="stylesheet" />
<link href="resources/css/memberJoinForm.css" rel="stylesheet" />
<style type="text/css">
select{
	width: 50px;
}
.info{
	width: 500px;
}
.textForm {
    border-radius: 40px 80px;
    padding: 10px;
    margin: 0 auto;
    width: 625px;
    height: auto;
    background-color: #b7b7ff;
}
#memberUpdateForm{
	margin: 0 500px;
	padding-top: 250px;
}
.textForm label{
    padding: 10px;
    margin: 10px;
	
}
.textForm input {
    margin-bottom: 20px;
}

</style>
</head>
<body style="text-align: center; font-family: 'Orbit-Regular';">
<c:import url="../main/header.jsp"/>
	
<form id="memberUpdateForm" action="memberUpdateResult" method="post">
	<p>아이디/비밀번호</p>
    <div class="textForm">
		아 이 디 <input type="text" id="loginId" name="loginId" value="${member.id }" maxlength="20" readonly><br/>
		비밀번호  <input type="password" placeholder="비밀번호" id="loginPw" name="loginPw" maxlength="20"><br>
		비밀번호 확인<input type="password" placeholder="비밀번호 확인" name="loginPwConfirm" maxlength="20">     
    </div>
	<input type="hidden" id="kakaoid" name="kakaoid" value="${member.kakaoid }">
	<br/><br/>
	<p>개인정보</p>
    <div class="textForm">
      	이  름 : <input type="text" placeholder="이름" id="name" name="name" value="${member.name }" maxlength="50" readonly>     
        <br/>
        닉네임 : <input type="text" placeholder="닉네임" id="nickname" name="nickname" value="${member.nickname }" maxlength="50">     
    	<div class="info" id="info__birth">
    	<p>생년월일</p>
	    	<select class="box" id="birth-year" name="birth-year">
	      		<option disabled selected></option>
	    	</select>
	    	<select class="box" id="birth-month" name="birth-month">
	      		<option disabled selected></option>
	    	</select>
	    	<select class="box" id="birth-day" name="birth-day">
	     		<option disabled selected></option>
	    	</select>
    	</div>
        주  소 : <input type="hidden" id="address_1" name="address_1" placeholder="우편번호" readonly>
        <input type="text" id="address_2" name="address_2" placeholder="주소" readonly>
        <input type="button" onclick="checkAddress()" value="우편번호 찾기"><br>
        <input type="text" id="address_3" name="address_3" placeholder="상세주소">
        <input type="hidden" id="address_4" name="address_4" placeholder="동"><br/><br/>
		휴대폰 : <input type="text" class="form-control" id="tel" name="tel" value="${member.tel }" oninput="oninputPhone(this)" maxlength="13"><br/>
		이메일 : <input type="text" id="email" name="email" value="${member.email }" maxlength="50" readonly> 
    </div>
    <button class="w-btn w-btn-gray" type="button" onclick="location.href='/'">취 소</button>
    <button class="w-btn w-btn-gra3 w-btn-gra-anim" type="button" onclick="memberUpdateCheck()">정보 수정</button>
</form>
<c:import url="../main/footer.jsp"/>
</body>
<style type="text/css">
/* SECTION - BIRTH */
.textForm.info#info__birth {
  display: flex;
}

.textForm.info#info__birth select {
  margin-left : 7px;
}

.textForm.info#info__birth select:first-child {
  margin-left : 0px;
}
.textForm.info#info__birth select::-webkit-scrollbar {
  width: 10px;
}

.textForm.info#info__birth select::-webkit-scrollbar-thumb {
  background-color: #b6b6b6;
  border-radius: 3px;
}

.textForm.info#info__birth select::-webkit-scrollbar-track {
  background-color: #ebe9e9;
  border-radius: 6px;
}
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

button {
    margin: 20px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn-gra3 {
     background: linear-gradient(
        45deg,
        #ff0000,
        #ff7300,
        #fffb00,
        #48ff00,
        #00ffd5,
        #002bff,
        #7a00ff,
        #ff00c8,
        #ff0000
    );
    color: white;
}
.w-btn-gra-anim {
    background-size: 400% 400%;
    animation: gradient1 5s ease infinite;
}
@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity
        }
    }

.w-btn-gray {
    background-color: #a3a1a1;
    color: #e3dede;
}
.w-btn-yellow {
    background-color: yellow;
    color: black;
}
@font-face {
    font-family: 'Orbit-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2310@1.0/Orbit-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
</style>
<script type="text/javascript">

var birth = "${member.birth}".split('-');

document.getElementById('birth-year').options[0].text = birth[0];
document.getElementById('birth-month').options[0].text = birth[1];
document.getElementById('birth-day').options[0].text = birth[2];

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