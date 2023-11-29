<!-- board/loginForm.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>loginForm.jsp</title>
</head>
<link href="resources/css/styles.css" rel="stylesheet" />
<body style="margin-top: 150px; background-color: black;">
<c:import url="../main/header.jsp"/>
<nav class = "#">
	<div class="#">
		<button type="button">
			<span class="">로고</span>
		</button>
		<a class="" href="">웹 사이트 이름</a>
	</div>
	<!-- 카카오~ -->
	<div class="" id="">
		<button type="button">
			<span class="kakao">카카오 연동</span>
		</button>
	</div>
	<!-- 로그인관련바~ -->
	<div class="">
		<ul class="menu_2">
			<li class="">
				<!-- 로그인, 회원가입 등 추가 가능 -->
				<a href="#" class="">마이페이지<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="#">로그인</a></li>
					<li><a href="#">회원가입</a></li>
				</ul>
			</li>
		</ul>
	</div>
</nav>
<!-- 로그인 폼 입니다. -->
<div class="">
	<div class="" style="padding-top: 20px;">
		<!-- 로그인 누르면 어디로 갔지 선택하세요~ -->
		<form align="center" method="post" action="#">
			<h3 style="text-align: center;">로그인 화면</h3>
			<div class="">
				<input type="text" class="" placeholder="아이디" name="" maxlength="20">
			</div>
			<div class="">
				<input type="password" class="" placeholder="비밀번호" name="" maxlength="20">
			</div>
			<input type="submit" value="로그인">
		</form>
	</div>
</div>
</body>
</html>
































