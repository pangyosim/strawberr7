<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>watchaPartyselect</title>
<!-- <script type="text/javascript" src="">
	function check() {
		if (document.watchaPartyselect.no.value == "") {
			alert("항목을 체크하세요");
			document.watchaPartyselect.no.focus();
		} else {
			document.watchaPartyselect.submit();
		}
	}
</script> -->

<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body style="background-color: white; margin-top: 150px; display: flex; justify-content: center; align-items: center;">
	<c:import url="../main/header.jsp" />
	<form action="youtubePartyselect" method="get" name="youtubePartyselect">
		<table class="party_table">
			<thead>
				<tr>
					<th colspan="2"><h3>유튜브 파티목록</h3></th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>${selectPartylist.service}</td>
					</tr>
					<tr>
						<td>${selectPartylist.peoplecnt}</td>
					</tr>
					<tr>
						<td>${selectPartylist.partyday}</td>
					</tr>
					<tr>
						<td>${selectPartylist.price}</td>
					</tr>
					<tr>
						<td>${selectPartylist.partydate}</td>
					</tr>
			</tbody>
			<tbody>
				<tr>
					<th>1인회선</th>
				</tr>
				<tr>
					<th>1인1기기등록</th>
				</tr>
				<tr>
					<th>공유금지</th>
				</tr>
				<tr>
					<th>개인사정환불불가</th>
				</tr>
				<tr>
					<th>계정양도불가</th>
				</tr>
				<tr>
					<th><input type="checkbox" value="동의" onclick="check()" /> 동의</th>
				</tr>
			</tbody>
		</table>
		
		<input type="button" value="목록" onclick="location.href='/'" /> &nbsp;
        <input type="button" onclick="location.href='payinfo?seq=${seq}&session=21'" value="결제"/>
        </form>
</body>
</html>