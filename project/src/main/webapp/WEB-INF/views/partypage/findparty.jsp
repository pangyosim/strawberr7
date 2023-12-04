<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function party_search() { 
 	var frm = document.idfindscreen;

 	if (frm.member_name.value.length < 1) {
	  alert("찾으실 파티를 입력하세요");
	  return;
	 }
 frm.method = "post";
 frm.action = "findIdResult.jsp"; //넘어간화면
 frm.submit();  
 }
</script>
</head>
<body>
	<form action="idfindscreen" method="POST">
		<div class="search-title">
		</div>
		<section class="form-search">
			<div class="find-name">
				<label>검색</label> <input type="text" name="party_name"
					class="btn-name" placeholder="검색하세요"> <br>
			</div>
			<br>
		</section>
		<div class="btnSearch">
			<input type="button" name="enter" value="찾기" onClick="party_search()">
			<input type="button" name="cancle" value="취소"
				onClick="history.back()">
		</div>
	</form>
</body>
</html>