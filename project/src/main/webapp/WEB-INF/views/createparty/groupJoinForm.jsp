<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>memberJoinForm.jsp</title>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body style="background-color: black;">
<c:import url="../main/header.jsp"/>
<!-- 이름 / 연락처 / 주민번호 / 출금계좌  -->
<form action="" method="post" style="margin-top: 150px; text-align: center;">
	<div class="">
		<input type="text" id="" name="" placeholder="성함">
	</div>
	<div class="">
		<input type="text" id="" name="" placeholder="주민번호">
		<button onclick="">주민번호 확인</button>
	</div>
	<div class="">
		<input type="text" id="" name="" placeholder="연락처" readonly>
		<button onclick="">연락처 확인</button>
	</div>
	<div class="">
		<input type="text" id="" name="" placeholder="출금계좌">
	</div>
	<input type="submit" value="완료">
</form>
</body>
</html>