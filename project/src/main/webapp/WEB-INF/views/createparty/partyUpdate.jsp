<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티업데</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
table {
	margin: 50px auto; /* Adjust the top margin as needed */
	background-color: #f5f5f5; /* Adjust the background color as needed */
}

/* Add any additional styling for your form elements if needed */
table tr td input[type="text"] {
	/* Add your styling here */
	padding: 5px;
	/* Add any other styling properties as needed */
}

input[type="button"], input[type="submit"] {
	background-color: #4CAF50; /* Green background color */
	color: white; /* White text color */
	padding: 10px 20px; /* Padding */
	border: none; /* No border */
	border-radius: 5px; /* Rounded corners */
	cursor: pointer;
	margin-right: 10px; /* Adjust the right margin as needed */
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #45a049; /* Darker green on hover */
}

tr:last-child>td {
	text-align: center;
}

#update {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script>
	function updateparty() {
		// Display a confirmation dialog
		var confirmUpdate = confirm("파티정보를 수정하시겠습니까?");

		// Check the user's choice
		if (confirmUpdate) {
			// If the user clicks OK, submit the form
			document.getElementById("update").submit();
			alert('정보가 수정되었습니다');
		} else {
			// If the user clicks Cancel, do nothing or handle accordingly
			// For example, you can add custom logic or show a message
			console.log("User canceled the update.");
		}
	}
</script>
</head>
<body>
	<%-- <td><input type="text" value="${partylist}" /></td> --%>
	<%-- <td>${partylist}</td> --%>
	<table>
		<tr>
			<td><c:forEach var="party" items="${partylist}">
					<form action="Update" method="post" id="update"
						onsubmit="return updateparty()">
						<input type="hidden" name="seq" value="${party.seq}" />
						<table>
							<tr>
								<td>서비스 : <select class="service_form" name="service"
									value="${party.service}">
										<option value="youtube"
											${party.service eq 'youtube'?'selected':''}>youtube</option>
										<option value="watcha"
											${party.service eq 'watcha'?'selected':''}>watcha</option>
										<option value="coupangplay"
											${party.service eq 'coupangplay'?'selected':''}>coupangplay</option>
										<option value="laftel"
											${party.service eq 'laftel'?'selected':''}>laftel</option>
										<option value="netflix"
											${party.service eq 'netflix'?'selected':''}>netflix</option>
										<option value="tving"
											${party.service eq 'tving'?'selected':''}>tving</option>
										<option value="wavve"
											${party.service eq 'wavve'?'selected':''}>wavve</option>
								</select>
								</td>
							</tr>
							<tr>
								<td>제목 :<input type="text" name="title"
									value="${party.title}" /></td>
							</tr>
							<tr>
								<td>id :<input type="text" name="userid"
									value="${party.userid}" readonly /></td>
							</tr>
							<tr>
								<td>인원수 :<input type="text" name="peoplecnt"
									value="${party.peoplecnt}" /></td>
							</tr>
						</table>
						<hr>
						<input type="button" value="취소" onclick="location.href='/'" /> <input
							type="submit" value="수정" />
<!-- <title>내 파티 업데이</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
	
</style>
</head>
<body>
<c:import url="../main/header.jsp"/>
	<table>
		<tr>
			<td>
				<c:forEach var="party" items="${partylist}">
					<form action="Update" method="post">
						<table>
							<tr>
								<td><input type="hidden" name="seq" value="${party.seq}" />
								</td>
							</tr>
							<tr>
								<td>서비스 :
									<select class="sevice_form" id="service" name="service" onchange="changeSelect()">
										<option value="" selected disabled>---select---</option>
							            <option value="youtube">youtube</option>
							            <option value="watcha">watcha</option>
							            <option value="netflix">netflix</option>
							            <option value="tving">tving</option>
							            <option value="wavve">wavve</option>
							        </select>
								</td>
							</tr>
							<tr>
								<td>제목 :<input type="text"name="title" value="${party.title}" /></td>
							</tr>
							<tr>
								<td>현재 참여중인 인원수 :<input type="text" name="peoplecnt" value="${party.peoplecnt_max}" readonly /></td>
							</tr>
							<tr>
								<td>가격 : <input type="text" name="price" value="${party.price}"/></td>
							</tr>
							<tr>
								<td>이메일 :<input type="text" name="userid" value="${party.userid}" /></td>
							</tr>
						</table>
							<input type="button" value="취소" onclick="location.href='/'" />
							<input type="submit" value="수정" onclick="location.href='Update?seq=${party.seq}'"/> -->
					</form>
				</c:forEach></td>
		</tr>
	</table>
	<!-- location.href='Update?seq=${party.seq}' -->
</body>
</html>