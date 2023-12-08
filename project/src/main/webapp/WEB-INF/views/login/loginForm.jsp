<!-- login/loginForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function loginCheck()	{
		
	}
</script>

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

</head>
<link href="resources/css/loginForm.css" rel="stylesheet" />
<body style="margin-top: 150px; background-color: black;">
<div class="login-box" style="margin-top: 200px;">
  <h2>Login</h2>
  <form id="loginForm" action="loginResult" method="post" onsubmit="return loginCheck()">
  	<div class="user-box">	
  		<label for="userId"></label>
  		<input type="text" name="userId" id="userId" required="" placeholder="ID">
  	</div>
	<div class="user-box">
 		<label for="password"></label>
  		<input type="password" name="password" id="password" required="" placeholder="PASSWORD">
	</div>
    <div>
	    <input type="submit" value="로그인">
    </div>
    <div>
   		<input type="button" value="회원가입" onClick="location.href='register'"/>    
    </div>
    <br/>
  </form>
	<div>
		<button id="kakao-login-btn">카카오 로그인</button>
	</div>
 	<button id="kakao-unlink-btn">카카오 연결 해제</button>
 	
  
</div>
<c:import url="../main/footer.jsp"/>

</body>



</html>
































