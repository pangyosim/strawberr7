<!-- login/loginForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>

<!-- 카카오 로그인바API -->
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.5.0/kakao.min.js"
  integrity="sha384-kYPsUbBPlktXsY6/oNHSUDZoTX6+YI51f63jCPEIPFP09ttByAdxd2mEjKuhdqn4" crossorigin="anonymous"></script>
<script>
  Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용하려는 앱의 JavaScript 키 입력
</script>

</head>
<link href="resources/css/loginForm.css" rel="stylesheet" />
<body style="margin-top: 150px; background-color: black;">
<c:import url="../main/header.jsp"/>
<div class="login-box">
  <h2>Login</h2>
  <form>
    <div class="user-box">
      <input type="text" name="" required="">
      <label>Id</label>
    </div>
    <div class="user-box">
      <input type="password" name="" required="">
      <label>Password</label>
    </div>
    <a href="#">
      <span></span>
      <span></span>
      <span></span>
      로그인
    </a>
    <a href="register">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      회원가입
    </a>
    <br/>
    <!-- 카카오 로그인 버튼 -->
    <a id="kakao-login-btn" href="javascript:loginWithKakao()">
  		<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="122"
    	alt="카카오 로그인 버튼" />
	</a>
	<p id="token-result"></p>
  </form>
</div>
<c:import url="../main/footer.jsp"/>

</body>
<!-- 카카오 자바스크립트 -->
<script type="text/javascript">
/*kakoScript.js*/

function loginWithKakao() {
   Kakao.Auth.authorize({
     redirectUri: 'https://developers.kakao.com/tool/demo/oauth',
   });
 }

 // 카카오 로그인 UI 코드입니다.
 displayToken()
 function displayToken() {
   var token = getCookie('authorize-access-token');

   if(token) {
     Kakao.Auth.setAccessToken(token);
     Kakao.Auth.getStatusInfo()
       .then(function(res) {
         if (res.status === 'connected') {
           document.getElementById('token-result').innerText
             = 'login success, token: ' + Kakao.Auth.getAccessToken();
         }
       })
       .catch(function(err) {
         Kakao.Auth.setAccessToken(null);
       });
   }
 }

 function getCookie(name) {
   var parts = document.cookie.split(name + '=');
   if (parts.length === 2) { return parts[1].split(';')[0]; }
 }
</script>
</html>
































