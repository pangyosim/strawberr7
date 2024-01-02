<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-color: #f5f5f5;
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	margin-top: 200px;
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
	bottom: 90px;
	right: 350px;
}
input[type="button"]{
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
	bottom: 90px;
	right: 280px;
}
textarea {
	/*  width: 90%; */
	height: 350px;
	resize: none;
	border-radius: 10px;
}

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
#title{
	margin-right: 20px;
	width: 330px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<c:import url="../main/header.jsp" />
	<form action="reviewInsertContent" method="post" id="contentinsert"
		name="contentinsert" onsubmit="return validateForm()">
	<h2>게시글 작성</h2>
		<th>
		<input type="hidden" name="userid" value="${member.id}" />
		</th>
		<table>
			<tr>
				<th>글쓴이 : <input type="text" name="nickname" id="naickname" 	value="${member.nickname }" readonly />
				제목 :<input type="text" name="title" id="title" /></th>
			</tr>
			<tr>
				<td colspan="2">
				<textarea name="content" id="content" cols="60" rows="10" placeholder="내용을 작성하세요">
					</textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="글등록" />
		<input type="button" value="글목록" onclick="location.href='reviewForm?page=1'"/>
	</form>
	<c:import url="../main/footer.jsp" />
</body>
<script type="text/javascript">
	function validateForm() {
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;

		if (title.trim() === '' || content.trim() === '') {
			alert('제목과 내용을 모두 작성해주세요.');

			// 빈 필드로 포커스 이동
			if (title.trim() === '') {
				document.getElementById('title').focus();
			} else {
				document.getElementById('content').focus();
			}

			return false; // 폼 제출을 막음
		}

		return true; // 폼을 정상적으로 제출
	}
</script>
</html>