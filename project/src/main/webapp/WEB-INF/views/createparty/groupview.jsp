<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupview</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">

.table-cell {
max-width:200px;
	overflow: hidden;
	white-space: nowrap;
}
tr {
    display: inline-block;
}
table,td, th {
    border: 1px solid transparent; 
    
    padding: 8px; 
}  

</style>
<style type="text/css">
        body {
            background-color: #f9f9f9; /* Light background color */
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            color: #333; /* Text color */
            border-radius: 10px;
        }

        a {
            color: #3498db; /* Blue link color */
            text-decoration: none;
        }

        h4 {
            color: #333;
        }

        .searchBar {
            background-color: #ffffff;
            padding: 10px;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .searchBar img {
            width: 15px;
            height: 15px;
        }

        .input {
            padding: 8px;
            border: 1px solid #ddd;
            font-family: 'Noto Sans KR', sans-serif;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        .servicesearch {
            padding: 8px;
            border: 1px solid #ddd;
            font-family: 'Noto Sans KR', sans-serif;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #ffffff;
            margin-top: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        .table-cell {
            max-width: 200px;
            overflow: hidden;
            white-space: nowrap;
        }

        .slide {
            padding: 10px;
        }

        .slide img {
            width: 80px;
            height: 80px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .slide p {
            margin: 5px 0;
            color: #333;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }

        .slider-button {
            margin-top: 10px;
            font-size: 18px;
            color: #fff;
            border: none;
            padding: 10px 10px;
            cursor: pointer;
            background-color: rgba(0, 0, 0, 0.4);
            border-radius: 25px;
        }

        #prev-button {
            left: 10px;
        }

        #next-button {
            right: 10px;
        }
        #search-btn:hover {
        	background-color: #935fba;
        	cursor: pointer;
        }
    </style>
</head>
<body style="margin: 0;">
<c:import url="../main/header.jsp"/>
<div class="searchBar" style=" width: 70%; margin: 100px 270px; border-radius: 30px; padding: 20px;">
		<form action="/search" method="post">
			<img src="https://cdn-icons-png.flaticon.com/512/71/71403.png" style="width:30px; height:30px; vertical-align: top;"/> &nbsp;
			<input type="text" class="input" name="keyword" placeholder="제목 검색" style="border-radius: 15px; vertical-align: middle;"/> &nbsp;
			<select class="servicesearch" id="servicesearch" name="servicesearch" style="border-radius: 15px;">
				<option value="allSearch">전체</option>
				<option value="netflix">netflix</option>
				<option value="watcha">watcha</option>
				<option value="tving">tving</option>
				<option value="wavve">wavve</option>
				<option value="youtube">youtube</option>
			</select> &nbsp; <input type="submit" id="search-btn" value="검색" style="width: 100px; height: 35px; font-size: 15px; background-color: #ba77ea; border: 1px solid #935fba; border-radius: 10px; color: #fff;" >
		</form>
			<hr>
			<br>
			<div style="margin: 0 30px auto;">
				<c:forEach var="allgroup" items="${groupList}" varStatus="vs">
					<div class="slide" style="border: 1px solid #e9e9e9; border-radius: 10px; width: 200px; height: 350px; text-align: center; display: inline-block;" onclick="location.href='PartyList?seq=${allgroup.seq}'">
						<img
							src="resources/assets/img/${allgroup.service }.png"
							style="width: 80px; height: 80px"
							onclick="location.href='PartyList?seq=${allgroup.seq}'" />
						<P style="font-family: monospace; font-weight: bold;">[${allgroup.service}]</P>
						<p style="font-family: monospace;">${allgroup.title}</p>
						<p style="font-family: monospace;">${allgroup.peoplecnt}/${allgroup.peoplecnt_max}명</p>
						<p style="font-family: monospace;"> <fmt:formatDate value="${allgroup.partydate}" pattern="yyyy년 MM월 dd일"/> ~ <br>
						    <fmt:formatDate value="${allgroup.enddate}" pattern="yyyy년 MM월 dd일"/>  <br>
						    (${allgroup.partyday} 개월)</p>
						<br/>	
					</div>
				</c:forEach>
			</div>
<br/>
	</div>
	<br/>

<script>

    // 엔터 키 이벤트를 감지하여 검색 폼을 제출하는 함수
    function handleEnterKey(event) {
        if (event.key === 'Enter') {
            event.preventDefault(); // 기본 엔터 행동을 막음
            document.getElementById('searchForm').submit(); // 검색 폼 제출
        }
    }

</script>
</body>
</html>