<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	
</script>
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
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리뷰내용</h2>
	<form action="deleteReview">
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


</body>
</html>