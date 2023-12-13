<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewForm</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.4.min.js">
$(document).ready(function(){
	 
	var actionForm = $("#actionForm");
	
	$(".page-link").on("click", function() {
		
		/* e.preventDefault(); */
		
		var targetPage = $(this).attr("href");
		
		console.log(targetPage);
		
		actionForm.find("input[name='pageNum']").val(targetPage);
		
		actionForm.submit(); 
	});
});	
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

#wrapper {
	width: 100px;
	margin: auto;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}
</style>
</head>
<body >

	<h1>리뷰 목록</h1>

	<div id="wrapper">
		<c:if test="${member.id}">
			<button type="button" onclick="location.href='reviewInsert'">새글작성</button>
		</c:if>
	</div>
	<div>
		<table class="review_table" >
			<tr>
				<th>글번호</th>
				<th>아이디</th>
				<th>닉네임</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>

			<c:forEach var="reviewlist" items="${list}">
				<tr>
					<td>${reviewlist.seq}</td>
					<td>${reviewlist.userid}</td>
					<td>${reviewlist.nickname}</td>
					<td><a href="reviewContent?reviewid=${reviewlist.reviewid}">${reviewlist.title}</a></td>
					<td>${reviewlist.writedate}</td>
					<%-- <td>${reviewlist}</td> 조회수는 해야됨 --%>
				</tr>
			</c:forEach>
		</table>
		<h2>${pageMaker }</h2>
		<div class='pull-right'>
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.startPage - 1 }"tabindex="-1">Previous</a>
					</li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="num">
					<li class="page-item ${pageMaker.cri.pageNum eq num?"active":""}">
						<a class="page-link" href="${num }">${num }</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.endPage +1 }"tabindex="+1">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		<form id='actionForm' action="review/reviewForm" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum }' />
			<input type='hidden' name='amount' value='${pageMaker.cri.amount }' />
		</form>

	</div>
</body>
</html>