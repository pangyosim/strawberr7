<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	
</script>
<style type="text/css">
body {
	background-color: #f5f5f5;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	/* min-height: 100vh; */
	margin-top: 200px;
}

h2 {
	text-align: center;
	color: #333;
}

form {
	width: 70%;
	margin-top: 100px;
	background-color: #fff;
	padding: 60px;
	margin-bottom: 20px;
	border-radius: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.review_table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.review_table th, .review_table td {
	padding: 10px;
	border: 1px solid #ddd;
	text-align: left;
}

textarea {
	width: 100%;
	height: 350px;
	resize: none;
	border-radius: 5px;
}

h2 {
	text-align: center;
	color: #333;
}

#contentinsert {
	width: 70%;
	margin: 20px auto;
	background-color: #fff;
	padding: 60px;
	border-radius: 50px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin-top: 250px;
}

table {
	width: 100%;
}

/* 글쓴이 : 제목 : 색깔 ,글자 가운데 배치*/
th {
	background-color: #e0e0e0;
	color: #fff;
	padding: 10px;
	text-align: center;
	border-radius: 10px;
}

/* 글내용 tr 색깔 */
tr:nth-child(even) {
	background-color: #e0e0e0;
}

tr, td {
	padding: 20px;
	border-radius: 10px;
}

#content {
	width: 100%;
	border: none;
}

input[type="submit"] {
	background-color: #A374DB; /* 버튼색깔 파랑색 */
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
	align-self: flex-end;
	position: absolute;
	right: 300px;
}

#check {
	ackground-color: #A374DB; /* 버튼색깔 파랑색 */
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 120px;
	margin-right: -10px;
	align-self: flex-end;
	position: absolute;
}
#delete{
	cursor: pointer;
	padding: 10px 20px;
	background-color: #A374DB;
	color: white;
	border: none;
	border-radius: 3px;
	font-size: 16px;
	margin-top: 10px;
}
input[type="button"] {
	background-color: #A374DB;
	color: #fff;
	padding: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin-top: 10px;
	margin-right: 10px;
	align-self: flex-end;
	position: absolute;
	/* bottom: 80px; */
	right: 400px;
}

input[type="submit"] {
	cursor: pointer;
	padding: 10px 20px;
	background-color: #A374DB;
	color: white;
	border: none;
	border-radius: 3px;
	font-size: 16px;
	margin-top: -30px;
}

input[type="button"] {
	cursor: pointer;
	padding: 10px 20px;
	background-color: #A374DB;
	color: white;
	border: none;
	border-radius: 3px;
	font-size: 16px;
	margin-top: 10px;
}
/* textarea {

/* width: 90%; */

/* resize:none;

border-radius:10px;

} */

/*

input[type="submit"]:hover, input[type="button"]:hover {

background-color: #45a049;

}

*/
#naickname, #title {
	border: none;
	outline: none;
}

#naickname, #title {
	padding: 4px;
	margin: 4px;
}

#naickname {
	margin-right: 180px;
}

#title {
	margin-right: 20px;
	width: 330px;
}

.comment-container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

.comment {
	margin-bottom: 20px;
	text-align: center;
}

hr {
	width: 100%;
	margin: 5px 0;
	border: 0.5px solid #ccc;
}

.delete-btn {
	cursor: pointer;
	padding: 5px 10px;
	background-color: #f44336;
	color: white;
	border: none;
	border-radius: 3px;
}

form textarea {
	margin-bottom: 10px;
	width: 100%;
	box-sizing: border-box;
}

#clicke{
	margin-top: 30px;
}
#reviewcomment{
	height: 100px;
}
/* #deleteclick{
	margin-bottom: -30px;
	
} */
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../main/header.jsp" />

	<form action="deleteReview">
		<h2>Q&A</h2>

		<input type="hidden" value="${reviewContent.reviewid }"
			name="reviewid" id="reviewid" />
		<table class="review_table">
			<tr>
				<th>글쓴이 : <input type="text" name="nickname" id="naickname"
					value="${reviewContent.nickname }" readonly /> 제목 :<input
					type="text" name="title" id="title" value="${reviewContent.title}"
					readonly />
				</th>
			</tr>
			<tr>
				<th colspan="2">작성글</th>
			</tr>
			<tr>
				<td colspan="2"><textarea name="content" id="content" cols="60"
						rows="10" readonly>${reviewContent.content}</textarea></td>
			</tr>
		</table>

		<c:if test="${member.id eq reviewContent.userid}">
			<input type="submit" value="글삭제" id="delete" />
		</c:if>
		<input type="button" value="글목록"
			onclick="location.href='reviewForm?page=1'" />
	</form>
	
	<c:forEach var="comment" items="${reviewco}" >
		<form action="deleteComment" method="post" id="clicke">
			<input type="hidden" value="${reviewContent.reviewid }"
				name="reviewid" id="reviewid" />
			</td>
			<div>
				<table>
					<tr>
						<td>관리자 답변 (${comment.commentdate})
					</tr>
					<tr>
						<td>${comment.reviewcomment}</td>
					</tr>
						<td> <input type="hidden"
							value="${comment.commentid }" name="commentid" id="commentid" /></td>
					<hr>
				</table>
			</div>
			<c:if test="${member.role =='ADMIN'}">
			<input type="submit" value="삭제" id="deleteclick"/>
			</c:if>
		</form>
	</c:forEach>
	
	<c:if test="${member.role =='ADMIN' }">
	<form action="insertComment" method="POST">
		<input type="hidden" value="${reviewContent.reviewid }"
			name="reviewid" id="reviewid" />
		<textarea name="reviewcomment" id="reviewcomment" rows="3" cols="30" placeholder="댓글을 입력하세요"></textarea>
		<input type="submit" value="작성" id="check"> <br>
	</form>
	</c:if>
	
	
	<!--onclick="location.href='deleteReview'"  -->
	<c:import url="../main/footer.jsp" />
</body>
</html>