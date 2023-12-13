<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewForm</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js">

</script>
<style type="text/css">
*{
	padding: 0;
	margin: 0;
}
table, th, td {
	border: 1px solid gray;
	border-collapse: collapse;
}

td {
	text-align: center;
}
#board_list{
	padding: 300px;
}
/* .review_table {
	margin: 0 auto;
	width: 500px;
}

#wrapper {
	width: 100px;
	margin: auto;
} */

#paging_block{
	text-align : center;
}



</style>
</head>
<body >

	<h1>리뷰 목록</h1>

	<div id="wrapper" style="text-align: center;">
			<button type="button" onclick="location.href='reviewInsert'">새글작성</button>
			<button type="button" onclick="location.href='/'">홈</button>
	</div>
	<div id="board_list">
        <div class="container">
		<table class="review_table">
			<thead>
			<tr>
				<th scope="col" class="th-num">글번호</th>
				<th scope="col" class="th-date">닉네임</th>
				<th scope="col" class="th-title">제목</th>
				<th scope="col" class="th-date">조회수</th>
				<th scope="col" class="th-date">작성일</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="reviewlist" items="${list}">
				<tr>
					<td style="width: 100px;">${reviewlist.seq}</td>
					<td style="width: 150px;">${reviewlist.nickname}</td>
					<td style="width: 300px;"><a href="reviewContent?reviewid=${reviewlist.reviewid}">${reviewlist.title}</a></td>
					<td style="width: 150px;">${reviewlist.hit}</td>
					<td style="width: 150px;">${reviewlist.writedate}</td>
					<%-- <td>${reviewlist}</td> 조회수는 해야됨 --%>
				</tr>
			</c:forEach>
			 </tbody>		
		</table>
		<!-- 페이징 -->
		<div id="paging_block">
			<c:if test="${startPage > block }">
				[ <a href="/reviewForm?page=${startPage-1 }" id="paging"> 이전 </a> ]
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
				<c:if test="${i == page }">
					[ <a href="/reviewForm?page=${i }" id="currentPaging"> ${i } </a> ]
				</c:if>
				<c:if test="${i != page }">
					[ <a href="/reviewForm?page=${i }" id="paging"> ${i } </a> ]
				</c:if>
			</c:forEach>
			<c:if test="${endPage < totalPage }">
				[ <a href="/reviewForm?page=${endPage+1 }" id="paging"> 다음 </a> ]
			</c:if>
		</div>
		</div>
	</div>
</body>
</html>