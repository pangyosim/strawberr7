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
        var confirmUpdate = confirm("정보를 수정하시겠습니까?");

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
					<form action="Update" method="post" id="update" onsubmit="return updateparty()">
						<table>
							<tr>
								<td><input type="hidden" name="seq" value="${party.seq}" />
								</td>
							</tr>
							<tr>
								<td>서비스 :<input type="text" name="service"
									value="${party.service}" />
								</td>
							</tr>
							<tr>
								<td>제목 :<input type="text" name="title"
									value="${party.title}" /></td>
							</tr>
							<tr>
								<td>id :<input type="text" name="userid"
									value="${party.userid}" /></td>
							</tr>
							<tr>
								<td>인원수 :<input type="text" name="peoplecnt"
									value="${party.peoplecnt}" /></td>
							</tr>
						</table>
						<hr>
						<input type="button" value="취소" onclick="location.href='/'" /> 
						<input type="submit" value="수정" />
					</form>
				</c:forEach></td>
		</tr>
	</table>
<!-- location.href='Update?seq=${party.seq}' -->
</body>
</html>