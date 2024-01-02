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
		})
		  .then(function(response) {
		    console.log(response);
		  })
		  .catch(function(error) {
		    console.log(error);
		  });
}
</script>

<style type="text/css">
body{
	margin: 0px;
	padding: 0px;
}

.login-box{
	width: 300px;
	height: 300px;
	margin: 0 auto;
	margin-top: 13%;
	border: none;
}
.login-box h1{
	color: #ba77ea;
}
.user-box input{
	width: 320px;
	height: 50px;
	border-radius: 10px;
	font-size: 16px;
	margin-bottom: 10px;
	border: 1px solid black;
}
#register_tag{
	margin-left: 105px;
	text-decoration: none;
	color: black;
}

#register_tag:hover, #find_id:hover{
	color: #ba77ea;
}

#kakao-login-btn{
	 width: 320px;
	 height: 50px;
	 background-color: #fcdc3e;
	 border-radius: 10px;
	 border: none;
}

#kakao-login-btn:hover{
	background-color: #e9ca3f;
	cursor: pointer;
}

#login-box {
	width: 320px; 
	height: 50px; 
	border-radius: 10px; 
	background-color: #ba77ea; 
	color: white; 
	font-size: 15px;
	border: none;
}
#login-box:hover {
	background-color: #ae71dd;
	cursor: pointer;
}

</style>
</head>
<body >
<div class="login-box">
	  <form action="loginResult" method="post" style="width: 500px;">
	  	<h1 style="margin-left: 100px;">OYES</h1>
	  	<div class="user-box">	
	  		<label for="userId"></label>
	  		<input type="text" name="userId" id="userId"  placeholder="ID"/>
	 		<label for="password"></label>
	  		<input type="password" name="password" id="password" placeholder="PASSWORD">
		    <input type="submit" value="로그인" id="login-box"> <br/>
		 </div>
	   		<span id="register_tag" onclick="location.href='register'">회원가입</span> &nbsp;
	   		<span id="find_id" onclick="location.href='/userSearch'">아이디 / 비밀번호 찾기</span>
	  </form>
	<div style="margin-top: 8px;">
		<button id="kakao-login-btn"><img alt="" src="resources/assets/img/kakaologin.png" style=" width: 20px; height: 20px;"/>카카오 로그인</button>
	</div>
 	<!--  <a id="kakao-unlink-btn">카카오 연결 해제</a> -->
 	
  
</div>
<c:import url="../main/footer.jsp"/>

</body>



</html>
































