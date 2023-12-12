<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, th, td {
	border: 1px solid gray;
	border-collapse: collapse;
}

td {
	text-align: center;
}

.review_table {
	margin: 0 auto;
	width: 500px;
}
textarea {
    resize: none;
    
  }
</style>
</head>
<body>
	<h2>글 생성</h2>
	<form action="reviewInsertContent" method="post">
		<table>
				<th><input type="hidden" name="userid" value="${member.id}"/></th>

			<tr>
				<th>글쓴이 : <input type="text" name="nickname" value="${member.nickname }"/></th>
					<th>제목 :<input type="text" name="title"/></th>
			</tr>
			<tr>
				<td colspan="2">글내용</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" cols="60" rows="10" placeholder="내용을 작성하세요"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="글등록"/>
	</form>
</body>
</html>