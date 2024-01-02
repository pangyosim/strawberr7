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
	margin: 50px auto;
	background-color: #f5f5f5;
}

table tr td input[type="text"] {
	padding: 5px;
}

input[type="button"] {
	background-color: #808080; 
	color: white; /* White text color */
	padding: 10px 20px; /* Padding */
	border: none; /* No border */
	border-radius: 5px; /* Rounded corners */
	cursor: pointer;
	margin-right: 10px; /* Adjust the right margin as needed */
}
 input[type="submit"] {
 	background-color: #A374DB; 
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
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
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
			console.log("User canceled the update.");
		}
	}

	function calcprice() {
		if ($("#service").val() == 'youtube') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 14900;
		} else if ($("#service").val() == 'netflix') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 17000;
		} else if ($("#service").val() == 'watcha') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 12900;
		} else if ($("#service").val() == 'tving') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 17000;
		} else if ($("#service").val() == 'wavve') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 13900;
		}
	}
</script>


</head>
<body>


	<table>
		<tr>
			<td>
				<form action="Update" method="post" id="update"
					onsubmit="return updateparty()" onclick="calcprice()">
					<input type="hidden" name="seq" value="${party.seq}" />
					<table>
						<tr>
							<td>서비스 : <select class="service_form" id="service"
								name="service" value="${party.service}">
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
									<option value="tving" ${party.service eq 'tving'?'selected':''}>tving</option>
									<option value="wavve" ${party.service eq 'wavve'?'selected':''}>wavve</option>
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
							<td>인원수 :<input type="text" name="peoplecnt_max"
								value="${party.peoplecnt_max}" readonly="readonly" /></td>
						</tr>
						<tr>
							<td>개월수 :<input type="text" id="partyday" name="partyday"
								value="${party.partyday}" onchange="calcprice()" required /> <input
								type="hidden" id="partydate" name="partydate"
								value="${party.partydate}" />
							</td>
						</tr>

						<tr>
							<td><input type="text" id="price" name="price"
								value="${party.price }" /></td>
						</tr>
					</table>
					<hr>
					<input type="button" value="취소" onclick="closeWindow()'" />
					 <input class="winwin" type="submit" value="수정" onclick="closeWindow()"/>
				</form>
			</td>
		</tr>
	</table>
	
	
	<script type="text/javascript">
	function closeWindow() {
        // 현재 창을 닫음
        window.close();
    }
	function closewinwin(){
		
		window.
	}
	</script>
</body>
</html>