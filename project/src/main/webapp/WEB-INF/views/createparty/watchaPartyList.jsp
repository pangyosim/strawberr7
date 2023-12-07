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
<body style="background-color: white;">
	<c:import url="../main/header.jsp" />
	<form action="watchaPartyselect" method="get" name="watchaPartyselect">
		<table class="party_table">
			<thead>
				<tr>
					<th colspan="2"><h3>유튜브 파티목록</h3></th>
				</tr>
			</thead>
			<tbody>
				<p>${member.id  }</p>
				<c:forEach var="partyInfo" items="${selectPartylist}">
					<tr>
						<td>${partyInfo.service}</td>
					</tr>
					<tr>
						<td>${partyInfo.peoplecnt}</td>
					</tr>
					<tr>
						<td>${partyInfo.partyday}</td>
					</tr>
					<tr>
						<td>${partyInfo.price}</td>
					</tr>
					<tr>
						<td>${partyInfo.partydate}</td>
					</tr>

				</c:forEach>
			</tbody>
			<tbody>
				<tr>
					<th><input type="checkbox" name="no" />1인회선</th>
				</tr>
				<tr>
					<th><input type="checkbox" name="no" />1인1기기등록</th>
				</tr>
				<tr>
					<th><input type="checkbox" name="no" />공유금지</th>
				</tr>
				<tr>
					<th><input type="checkbox" name="no" />개인사정환불불가</th>
				</tr>
				<tr>
					<th><input type="checkbox" name="no" />계정양도불가</th>
				</tr>
			</tbody>
		</table>
		<input type="submit" value="목록"
			onclick="location.href='../main/index'" /> &nbsp; <input
			type="submit" value="동의" onclick="check()" />
	</form>
</body>
</html>