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
<script type="text/javascript">
	function loginCheck()	{
		
	}
</script>

</head>
<link href="resources/css/loginForm.css" rel="stylesheet" />
<body style="margin-top: 150px; background-color: black;">
<c:import url="../main/header.jsp"/>
<div class="login-box">
  <h2>Login</h2>
  <form id="loginForm" action="loginResult" method="post" onsubmit="return loginCheck()">
    <div class="user-box">
      <input type="text" name="userId" id="userId" required="">
      <label>Id</label>
    </div>
    <div class="user-box">
      <input type="password" name="password" id="password" required="">
      <label>Password</label>
    </div>
    <div>
	    <input type="submit" value="로그인">
    </div>
    <div>
   		<input type="button" value="회원가입" onClick="location.href='register'"/>    
    </div>
    <br/>
  </form>
  <ul>
	<li onclick="kakaoLogin();">
     	<a href="javascript:void(0)">
         	<span>카카오 로그인</span>
     	</a>
	</li>
	<li onclick="kakaoLogout();">
     	<a href="javascript:void(0)">
       	  <span>카카오 로그아웃</span>
     	</a>
	</li>
</ul>
</div>
<c:import url="../main/footer.jsp"/>

</body>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
Kakao.init('4a706abbdeb8e6daae8b9e423f1752fd'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
</script>
</html>
































