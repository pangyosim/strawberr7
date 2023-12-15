<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">

</script>
<style type="text/css">
/* table, th, td {
	border: 1px solid gray;
	border-collapse: collapse;
}

td {
	text-align: center;
}

.review_table {
	margin: 0 auto;
	width: 500px;
} */
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

h2 {
	text-align: center;
}

form {
	margin: 200px;
	padding: 40px;
	background-color: #ffffff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	/*  display: flex;  */
	border-radius: 50px;
	align-items: center;
}
/* 테이블 크기 */
.review_table {
	width: 70%;
	margin-top: 60px;
	margin-left: 152px;
	margin-bottom: 100px;
	border-collapse: collapse;
	text-align: center;
	border-collapse: collapse;
}
/* 테이블 선 */
.review_table th, .review_table td {
	padding: 20px;
	border: 1px solid #d4d4d4;
}

.review_table th {
	background-color: #f8f8f8; /* Adjust as needed */
}

.review_table tr:nth-child(even) {
	background-color: #f9f9f9;
}

.review_table tr:hover {
	background-color: #e0e0e0;
}

input[type="submit"] {
	background-color: #4285f4; /* Adjust as needed */
	color: #ffffff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
	align-self: flex-end; 
	position: absolute; 
	bottom: 320px;
	right: 480px;
}

input[type="button"]{
	background-color: #4285f4; 
	color: #ffffff;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
	align-self: flex-end; 
	position: absolute;
	bottom: 320px; 
	right: 380px;
}

</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../main/header.jsp" />

	<form action="deleteReview">
		<h2>리뷰내용</h2>
		<div>
			<input type="hidden" value="${reviewContent.reviewid }"
				name="reviewid" />
			<table class="review_table">
				<tr>
					<th>글쓴이 :${reviewContent.userid }<input type="hidden"
						value="${reviewContent.userid }" name="userid" readonly /></th>
					<th>제목 :${reviewContent.title}<input type="hidden"
						value="${reviewContent.title}" name="title" readonly /></th>
				</tr>
				<tr>
					<th colspan="2">작성글</th>
				</tr>
				<tr>
					<td colspan="2">${reviewContent.content}<input type="hidden"
						value="${reviewContent.content}" name="content" readonly /></td>
				</tr>
			</table>
		</div>
		<c:if test="${member.id eq reviewContent.userid}">
			<input type="submit" value="글삭제" />
		</c:if>
		<input type="button" value="글목록"
			onclick="location.href='reviewForm?page=1'" />
	</form>
	<!--onclick="location.href='deleteReview'"  -->
	<c:import url="../main/footer.jsp" />
</body>
</html>