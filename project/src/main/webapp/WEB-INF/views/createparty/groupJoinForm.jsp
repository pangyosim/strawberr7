<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>memberJoinForm.jsp</title>
<<<<<<< HEAD
<script type="text/javascript">
function checkpartyking(){
	
	alert('파티장권한이 부여됩니다')
}
</script>
=======
<script type="text/javascript" src="resources/js/partyScript.js"></script>
<style>
  #toc-content {
    display: none;
  }
  #toc-toggle {
    cursor: pointer;
    color: #2962ff;
  }
  #toc-toggle:hover {
    text-decoration: underline;
  }
</style>
>>>>>>> refs/remotes/origin/jisung_project
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body style="background-color: black;">
<c:import url="../main/header.jsp"/>
<!-- 이름 / 연락처 / 주민번호 / 출금계좌  -->
<form action="groupJoinResult" method="post" style="margin-top: 150px; text-align: center;">
	<div class="">
<<<<<<< HEAD
		<input type="text" id="name" name="name" value="${member.name}" placeholder="성함">
=======
		<input type="text" id="name" name="name" placeholder="성함">
>>>>>>> refs/remotes/origin/jisung_project
	</div>
	<div class="">
		<input type="text" id="bank" name="bank" placeholder="은행" >
		<button onclick="">은행 확인</button>
	</div>
	<div class="">
		<input type="text" id="acount" name="acount" placeholder="계좌번호">
	</div>
<<<<<<< HEAD
	<input type="submit" value="완료" onclick="checkpartyking()">
=======
	<input type="submit" value="완료">
>>>>>>> refs/remotes/origin/jisung_project
</form>
<script>
  function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById('toc-toggle').textContent = '약관 동의';
    } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById('toc-toggle').textContent = '약관 동의';
    }
  }
</script>
</html>