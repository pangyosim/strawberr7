<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>watchaPartyselect</title>
<style type="text/css">
.zkflsk #gain{
	text-align: left;
	border: 2px solid red;
	border-top: 0;
	border-right: 0;
	transform:rptate(-45deg);
	transform-origin:25% 25%;
}
.table1{
	border: 2px solid black;
}
.table2{
	border: 2px solid black;
	border-radius: 10px 10px 10px 10px;
	width: 800px;
	height: 200px;
	margin: 0 auto;
}
.table3{
	margin: 0 auto;
}
@import url("https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,900&display=swap");

button {
    margin: 20px;
}

.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}

.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}

.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn-gray {
    background-color: #a3a1a1;
    color: black;
}
.w-btn-per {
    background-color: #b7b7ff;
    color: white;
}
@keyframes gradient1 {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

@keyframes gradient2 {
    0% {
        background-position: 100% 50%;
    }
    50% {
        background-position: 0% 50%;
    }
    100% {
        background-position: 100% 50%;
    }
}

@keyframes ring {
    0% {
        width: 30px;
        height: 30px;
        opacity
        }
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script type="text/javascript">
		function check_box(){
			if (document.getElementById('agree_box').checked == false) {
				alert("항목을 체크하세요");
				document.watchaPartyselect.no.focus();
			} else {
				location.href='payinfo?seq=${seq}&session=${member.email}';
			}
		}
</script>

<link href="resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/logincheck.js"></script>
</head>
<body style="background-color: white; margin-top: 150px; display: flex; justify-content: center; align-items: center;">
	<c:import url="../main/header.jsp" />
	<form class="zkflsk"action="watchaPartyselect" method="get" name="watchaPartyselect">
	
		<table id="table1">
			<tr>
				<td colspan="3" style="border-bottom: 1px solid black; width: 700px;">${selectParty.title }</td>
			</tr>
			<tr>
				<td rowspan="2">
					<img src="resources/assets/img/${selectParty.service}.png" width="80" height="100" style="width: 150px;"/>
				</td>					
				<td>
					<a>${selectParty.service}</a>
				</td>
			</tr>
			<tr>
				<td>
					<fmt:formatDate value="${selectParty.partydate }" pattern="yyyy년 MM월 dd일"/> ~ <fmt:formatDate value="${selectParty.enddate }" pattern="yyyy년 MM월 dd일"/> (${selectParty.partyday } 개월)
				</td>
				<td>
					파티 인원 : ${selectParty.peoplecnt } / ${selectParty.peoplecnt_max }
				</td>
			</tr>
			<tr>
				<td>
					<img src="resources/assets/img/crown.png" width="30" height="30"> ${mv.nickname}
				</td>
				<td>
					${mv. tier } 등급
				</td>
				<td>
					비용 : <fmt:formatNumber type="number" maxFractionDigits="0" value="${selectParty.price / selectParty.peoplecnt_max } " /> 원
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
		</table>
		<c:if test="${pc != null && selectParty.peoplecnt == selectParty.peoplecnt_max}">
			<a>공유한 아이디 : ${pc }</a>
		</c:if>
		<br/>
		<table class="table2">
			<tr id="gain">
				<th colspan="3"><img src="resources/assets/img/check.png" width="15" height="20" style="width: 25px;"/>1인회선</th>
			</tr>
			<tr id="gain">
				<th colspan="3"><img src="resources/assets/img/check.png" width="15" height="20" style="width: 25px;"/>1인1기기등록</th>
			</tr>
			<tr id="gain">
				<th colspan="3"><img src="resources/assets/img/check.png" width="15" height="20" style="width: 25px;"/>공유금지</th>
			</tr>
			<tr id="gain">
				<th colspan="3"><img src="resources/assets/img/check.png" width="15" height="20" style="width: 25px;"/>개인사정환불불가</th>
			</tr>
			<tr id="gain">
				<th colspan="3"><img src="resources/assets/img/check.png" width="15" height="20" style="width: 25px;"/>계정양도불가</th>
			</tr>
        </table>
        <br/>
        <table class="table3">
			<tr id="abogam">
				<th colspan="3"><input type="checkbox" id="agree_box" value="동의" />위 약관에 동의합니다</th>
			</tr>
			<tr>
				<th colspan="3">
				<button class="w-btn w-btn-gray"type="button" onclick="location.href='/'">목록</button>
				<button class="w-btn w-btn-per"type="button" name="pay" onclick="check_box()">결제</button></th>
        	</tr>
        </table>
	</form>
</body>
</html>