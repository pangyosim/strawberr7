<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>memberJoinForm.jsp</title>
<script type="text/javascript">
function checkpartyking(){
	
	alert('파티장권한이 부여됩니다')
}
</script>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body style="background-color: black;">
<c:import url="../main/header.jsp"/>
<!-- 이름 / 연락처 / 주민번호 / 출금계좌  -->
<form action="groupJoinResult" method="post" style="margin-top: 150px; text-align: center;">
	<div class="">
		<input type="text" id="name" name="name" value="${member.name}" placeholder="성함">
	</div>
	<div class="">
		<input type="text" id="bank" name="bank" placeholder="은행" >
		<button onclick="">은행 확인</button>
	</div>
	<div class="">
		<input type="text" id="acount" name="acount" placeholder="계좌번호">
	</div>
	<input type="submit" value="완료" onclick="checkpartyking()">
</form>
</body>
</html>