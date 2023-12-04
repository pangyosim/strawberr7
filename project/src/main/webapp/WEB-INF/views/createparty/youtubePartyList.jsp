<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>youtubePartyList</title>
<script type="text/javascript" src="">
	function check() {
		if (document.youtubePartyselect.no.value == "") {
			alert("항목을 체크하세요");
			document.youtubePartyselect.no.focus();
		} else {
			document.youtubePartyselect.submit();
		}
	}
</script>
<style type="text/css">
body {
	text-align: left;
	margin: 100px;
}

table, th, td {
	/* border: 1px solid gray;  */
	border-collapse: collapse;
	color: black;
	text-align: left;
}

.party_table {
	margin: 0 auto;
	width: 500px;
	position: relative;
	width: 600px;
	height: 30px;
	margin: 10px auto;
	padding: 5px;
}

.party_data {
	margin: 0 auto;
	width: 500px;
	position: relative;
	margin: 50px;
	padding: 100px;
}
</style>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body style="background-color: white;">
	<c:import url="../main/header.jsp" />
	<form action="youtubePartyselect" method="get"
		name="youtubePartyselect">

		<table class="party_data">
			
		</table>
		<hr>
		<table class="party_table">
			<div>
				<h3>유튜브 파티목록</h3>
			<tr>
				<th>${groupVO.service }</th>
			</tr>
			<tr>
				<th>${groupVO.partyday}</th>
				<th>${groupVO.peoplecnt }</th>
			</tr>
			<hr>
			<tr>
				<th>${groupVO.price }</th>
			</tr>
			</div>
			<tr>
				<th><input type="checkbox" id="shareno" name="no" />1인 회선</th>
				<br>
			</tr>
			<tr>
				<th><input type="checkbox" id="shareno" name="no" />1인
					1기기등록</th>
				<br>
			</tr>
			<tr>
				<th><input type="checkbox" id="shareno" name="no" />공유금지</th>
				<br>
			<tr />
			<tr>
				<th><input type="checkbox" id="shareno" name="no" />개인사정 환불불가</th>
				<br>
			</tr>
			<tr>
				<th><input type="checkbox" id="shareno" name="no" />계정양도 불가</th>
				<br>
			</tr>
			<input type="submit" value="목록" onclick="location.href='../main/index'" />
			&nbsp;
			<input type="submit" value="동의" onclick="check()" />
		</table>
	</form>
</body>
</html>