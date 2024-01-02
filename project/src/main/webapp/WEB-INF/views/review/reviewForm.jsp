<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewForm</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.4.min.js">
	
</script>
<style type="text/css">
#board_list {
	padding: 300px;
	margin: 0 auto;
}

#paging_block {
	text-align: center;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
	margin: 0;
	padding: 0;
}

#board_list {
	margin: 200px;
	padding: 70px;
	background-color: #ffffff;
	border-radius: 50px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.review_table {
	width: 100%;
	border-collapse: collapse;
}

.review_table th, .review_table td {
	padding: 10px;
	text-align: center;
	border: 1px solid #d4d4d4;
}

.review_table th {
	background-color: #A374DB;
	color: #ffffff;
}

.review_table tbody tr:nth-child(even) {
	background-color: #f9f9f9;
}

.review_table tbody tr:hover {
	background-color: #e0e0e0;
}

#paging_block {
	margin-top: 50px;
}

#paging_block a {
	padding: 5px 10px;
	text-decoration: none;
	color: #333;
	border: 1px solid #ccc;
	border-radius: 3px;
	margin-right: 5px;
}

a {
	text-decoration-line: none;
}

#paging_block a#currentPaging {
	background-color: #A374DB;
	color: #ffffff;
	border: 1px solid #4285f4;
}

.container {
	position: relative;
}

.right button {
	position: absolute;
	top: 70px; /* Adjust the value as needed */
	right: 0;
	margin-top: -75px;
	margin-right: 20px;
}

.review_table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 250px;
	/* Add other styles as needed */
}

.right {
	position: relative;
}

.container {
	margin-top: 10px; /* Adjust the value as needed */
}

.review_table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

button {
	margin-top: 10px;
	margin-right: 10px;
	background-color: #A374DB; /* Change to your preferred color */
	color: #ffffff;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	margin-top: 10px;
	margin-right: 10px;
	cursor: pointer;
}

#searchForm {
            display: inline;
            justify-content: center;
            align-items: center;
            margin: 20px;
           
        }

        #keyword {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
            width: 200px;
        }

        #searchForm input[type="submit"] {
            background-color: #A374DB; /* 퍼플색 */
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        
h1{
	text-align: center;
}        
</style>
<script>
	function loginForm() {
		alert("로그인이 필요합니다.");
		window.location.href = "/login";

	}

	function reviewInsert() {
		alert("글쓰기 페이지로 이동합니다");
		window.location.href = "reviewInsert";
	}
	function notSelect() {
		  var keyword = document.getElementById('keyword').value.trim(); 
		    if (keyword === '') {
		        alert('검색결과가 없습니다.');
		        document.getElementById('keyword').focus();
		        return false;
		    }
		    return true;
	}
</script>

<link href="resources/css/styles.css" rel="stylesheet" />
</head>

<body>
	<c:import url="../main/header.jsp" />



	<div id="board_list">
	<h1>Q&A</h1>
		<form action="/reviewForm" method="get" id="searchForm"
			name="search-form" onsubmit="return notSelect()">
			<td colspan="2"><input type="text" name="keyword" id="keyword" placeholder="검색어 입력"> 
			 				<input type="hidden" name="page"value="${param.page }">
			 </td>
			<td><input type="submit" value="검색하기"></td>
		</form>
		<span class="right" id="wrapper" style="text-align: center;">
			
			<hr> 
				<c:if test="${member !=null}">
					<button type="button" onclick="reviewInsert()">글쓰기</button>
				</c:if>
				<c:if test="${member ==null}">
					<button type="button" onclick="loginForm()">글쓰기</button>
				</c:if>
		</span>
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
					<c:forEach var="reviewlist" items="${memberlist}">
						<tr>
							<td style="width: 100px;">${reviewlist.seq}</td>
							<td style="width: 150px;">${reviewlist.nickname}</td>
							<td style="width: 300px;"><a
								href="reviewContent?reviewid=${reviewlist.reviewid}">${reviewlist.title}</a></td>
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
					<a href="/reviewForm?page=${startPage-1 }" id="paging"> ◀ 이전 </a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }" step="1">
					<c:if test="${i == page }">
						<a href="/reviewForm?page=${i }&keyword=${param.keyword}"
							id="currentPaging"> ${i } </a>
					</c:if>
					<c:if test="${i != page }">
						<a href="/reviewForm?page=${i }&keyword=${param.keyword}"
							id="paging"> ${i } </a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < totalPage }">
					<a href="/reviewForm?page=${endPage+1 }" id="paging">다음 ▶ </a>
				</c:if>
			</div>
		</div>
	</div>
	<c:import url="../main/footer.jsp" />
</body>
</html>