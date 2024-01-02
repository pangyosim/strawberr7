<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 구글폰트 숫자 -->
<link
	href="https://fonts.googleapis.com/css2?family=Rethink+Sans:wght@400&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap"
	rel="stylesheet">

<meta charset="UTF-8">
<title>Partyselect</title>
<style type="text/css">
.zkflsk #gain {
	text-align: left;
	border: 2px solid red;
	border-top: 0;
	border-right: 0;
	transform: rptate(-45deg);
	transform-origin: 25% 25%;
}

.table1 {
	border: 2px solid black;
}

.align-middle {
	vertical-align: middle; /* 이미지를 중앙 정렬 */
}

.table2 {
	width: 800px;
	height: auto;
	margin: 0 auto;
	background-color: #f5f5f5;
	border: 2px solid black;
	border-radius: 10px;
	text-align: left;
	padding: 15px;
}

.gain th {
	/* 테이블 헤더에 대한 추가 스타일링 (필요한 경우) */
	vertical-align: middle; /* 텍스트도 수직 중앙 배치 */
}

.check-icon {
	width: 20px;
	vertical-align: middle; /* 이미지와 텍스트 수직 중앙 정렬 */
}

.table3 {
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
	background-color: #ae71dd;
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


/* 모달 스타일 */
.modal2 {
	display: none;
	position: absolute;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 80%;
	overflow: auto;
	padding-top: 60px;
}

/* 모달 콘텐츠 스타일 */
.modal-content2 {
   background-color: #fefefe;
   margin: 4% auto;
   border: 1px solid #888;
   width: 20%;
   height: 60%;
}

input[type="button"] {
   background-color: #808080; 
   color: white; /* White text color */
   padding: 10px 20px; /* Padding */
   border: none; /* No border */
   border-radius: 5px; /* Rounded corners */
   cursor: pointer;
   margin-right: 10px; /* Adjust the right margin as needed */
}
 input[type="submit"] {
    background-color: #A374DB; 
   color: white; /* White text color */
   padding: 10px 20px; /* Padding */
   border: none; /* No border */
   border-radius: 5px; /* Rounded corners */
   cursor: pointer;
   margin-right: 10px; /* Adjust the right margin as needed */
 }
input[type="button"]:hover, input[type="submit"]:hover {
   background-color: #45a049; /* Darker green on hover */
}

tr:last-child>td {
   text-align: center;
}
/* 닫기 버튼 스타일 */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

/* 닫기 버튼 호버 효과 */
.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

img[src$="tving.png"] {
	width: 40px; /* 예시: 너비 변경 */
	height: auto; /* 이미지의 비율 유지를 위한 설정 */
	vertical-align: middle; /* 글씨와의 수직 정렬을 위한 설정 */
}

img[src$="netflix.png"] {
	width: 40px; /* 예시: 너비 변경 */
	height: auto; /* 이미지의 비율 유지를 위한 설정 */
	vertical-align: middle; /* 글씨와의 수직 정렬을 위한 설정 */
}

img[src$="watcha.png"] {
	width: 70px; /* 예시: 너비 변경 */
	height: auto; /* 이미지의 비율 유지를 위한 설정 */
	vertical-align: middle; /* 글씨와의 수직 정렬을 위한 설정 */
}

img[src$="wavve.png"] {
	width: 55px; /* 예시: 너비 변경 */
	height: auto; /* 이미지의 비율 유지를 위한 설정 */
	vertical-align: middle; /* 글씨와의 수직 정렬을 위한 설정 */
}

img[src$="youtube.png"] {
	width: 80px; /* 예시: 너비 변경 */
	height: auto; /* 이미지의 비율 유지를 위한 설정 */
	vertical-align: middle; /* 글씨와의 수직 정렬을 위한 설정 */
}

.party-date {
	font-size: 12px; /* 글씨 크기를 12px로 지정 */
}

.bold-text {
	font-weight: bold; /* 글씨를 진하게 함 */
}

.horizontal-line::before {
	content: ''; /* 가상 요소는 내용이 있어야 합니다 */
	display: block; /* 가로선처럼 보이기 위해 블록 요소로 만듭니다 */
	border-top: 1px solid #000; /* 가로선의 스타일 */
	width: 100%; /* 원하는 가로선의 길이 */
	margin: 0 auto; /* 가로선을 수평 중앙에 위치시킵니다 */
}

.custom-font {
	font-family: Archivo Black, 'Rethink Sans', sans-serif; /* 폰트 패밀리 설정 */
	color: purple;
}

.nickname {
	font-style: italic; /* 글자를 기울임체로 설정 */
}

/* body 전체를 flex container로 지정하여 중앙 정렬 */
body {
  display: flex;
  justify-content: center;
  align-items: center; /* 세로축도 중앙 정렬 */
  min-height: 100vh; /* 뷰포트의 높이만큼 최소 높이 설정 */
  margin: 0; /* 기본 마진 제거 */
}

/* 테이블의 너비와 마진을 조정하여 중앙 정렬 */
#table1 {
  margin: 0 auto; /* 상하 마진 없이 좌우 마진으로 중앙 정렬 */
  width: 100%;
}
#update {
   border: 1px solid black;
   border-collapse: collapse;
   margin:0 auto;
}
  .align-middle {
    width: 20px; /* 이미지 폭 */
    height: 20px; /* 이미지 높이 */
    padding-bottom: 3px; 
  }


</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script type="text/javascript">
		function check_box() {
			if (document.getElementById('agree_box').checked == false) {
				alert("항목을 체크하세요");
				document.watchaPartyselect.no.focus();
			} else {
				location.href = 'payinfo?seq=${seq}&session=${member.email}';
			}
		}
	</script>

<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script>
	function updateparty() {
		// Display a confirmation dialog
		var confirmUpdate = confirm("파티정보를 수정하시겠습니까?");

		// Check the user's choice
		if (confirmUpdate) {
			// If the user clicks OK, submit the form
			document.getElementById("update").submit();
			alert('정보가 수정되었습니다');
		} else {
			console.log("User canceled the update.");
		}
	}

	function calcprice() {
		if ($("#service").val() == 'youtube') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 14900;
		} else if ($("#service").val() == 'netflix') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 17000;
		} else if ($("#service").val() == 'watcha') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 12900;
		} else if ($("#service").val() == 'tving') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 17000;
		} else if ($("#service").val() == 'wavve') {
			document.getElementById("price").value = document
					.getElementById("partyday").value * 13900;
		}
	}
</script>
</head>

<body  style="background-color: white; display: flex; justify-content: center; align-items: center;">
	<c:import url="../main/header.jsp" />
	<form class="zkflsk"action="watchaPartyselect" method="get" name="watchaPartyselect">
	
		<table id="table1">
				
				<tr>
				  	<td colspan="2" class="party-title">${selectParty.title}</td>
				</tr>
				<tr>
					<td rowspan="2" style="width: 60px;">
						<img src="resources/assets/img/${selectParty.service}.png"/>
					</td>					
				<td>
					<a>[ ${selectParty.service} ]</a>
				</td>
			</tr>
			<tr>
			  <td class="party-date"> 
			    <fmt:formatDate value="${selectParty.partydate}" pattern="yyyy년 MM월 dd일"/> ~ 
			    <fmt:formatDate value="${selectParty.enddate}" pattern="yyyy년 MM월 dd일"/> 
			    (${selectParty.partyday} 개월)
			  </td>
			  <td>
			    <p class="bold-text" style="margin: 0; position: relative; left: -150px;">파티 인원: ${selectParty.peoplecnt} / ${selectParty.peoplecnt_max}</p>
			  </td>
			</tr>
			
			<tr class="table-separator">
			  <td colspan="3">
			    <div class="horizontal-line"></div>
			  </td>
			</tr>

			<tr>
				<td colspan="2"><img class="align-middle"
					src="resources/assets/img/crown.png" width="30" height="30">
					<span class="nickname">${mv.nickname}</span>
					&nbsp;&nbsp;&nbsp;${mv. tier } 등급</td>
				<td ><span>비용 :</span> <span class="custom-font"> <fmt:formatNumber
							type="number" maxFractionDigits="0"
							value="${selectParty.price / selectParty.peoplecnt_max }" /> 원
				</span></td>
			</tr>
			<tr class="table-separator">
			  <td colspan="3">
			    <div class="horizontal-line"></div>
			  </td>
			</tr>										
			<tr>
				<th>&nbsp;</th>
				<th>&nbsp;</th>
			</tr>
		</table>
		<c:if test="${pw != null && pc != null && selectParty.peoplecnt == selectParty.peoplecnt_max}">
			<a>공유한 아이디 : ${pc }</a> <br>
			<a>공유한 비밀번호 : ${pw} </a>
		</c:if>
		<br/>
		<table class="table2">
		    <tr class="gain">
		        <th colspan="3"><img class="check-icon" src="resources/assets/img/check.png"/>1인회선</th>
		    </tr>
		    <tr class="gain">
		        <th colspan="3"><img class="check-icon" src="resources/assets/img/check.png"/>1인1기기등록</th>
		    </tr>
		    <tr class="gain">
		        <th colspan="3"><img class="check-icon" src="resources/assets/img/check.png"/>공유금지</th>
		    </tr>
		    <tr class="gain">
		        <th colspan="3"><img class="check-icon" src="resources/assets/img/check.png"/>개인사정환불불가</th>
		    </tr>
		    <tr class="gain">
		        <th colspan="3"><img class="check-icon" src="resources/assets/img/check.png"/>계정양도불가</th>
		    </tr>
		</table>
        <br/>
        <table class="table3">
			<tr id="abogam">
				<th colspan="3"><input type="checkbox" id="agree_box" value="동의" />위 약관에 동의합니다</th>
			</tr>
			<tr>
				<th colspan="3">
					<button class="w-btn w-btn-gray"type="button" onclick="location.href='/'" style="width: 150px;">목록</button>
					<c:if test="${selectParty.partykingid ne loginuser}">
						<button class="w-btn w-btn-per"type="button" name="pay" onclick="check_box()" style="width: 150px;">결제</button>
					</c:if>
					<c:if test="${selectParty.partykingid eq loginuser && selectParty.peoplecnt == 1 }">
						<button class="w-btn w-btn-per"type="button" name="update" onclick="openModal2('${group.seq}')" style="width: 150px;">수정</button>
						<button class="w-btn w-btn-per"type="button" name="delete" onclick="location.href='deleteparty?partykingid=${selectParty.partykingid}&seq=${selectParty.seq}'" style="width: 150px;">삭제</button>
					</c:if>
				</th>
        	</tr>
        </table>
	</form>
			<!-- 모달 -->
		<div id="myModal2" class="modal2">
			<div class="modal-content2">
				<span class="close" onclick="closeModal2()">&times;</span>
				<div id="modalContent2"></div>
				<table  style="margin: 20% auto; width: 300px;">
					<tr>
						<td>
							<form action="Update" method="post" id="update"
								onsubmit="return updateparty()" onclick="calcprice()">
								<input type="hidden" name="seq" value="${selectParty.seq}" />
								<table>
									<tr>
										<td>서비스 : <select class="service_form" id="service"
											name="service" value="${selectParty.service}">
												<option value="youtube"
													${selectParty.service eq 'youtube'?'selected':''}>youtube</option>
												<option value="watcha"
													${selectParty.service eq 'watcha'?'selected':''}>watcha</option>
												<option value="coupangplay"
													${selectParty.service eq 'coupangplay'?'selected':''}>coupangplay</option>
												<option value="laftel"
													${selectParty.service eq 'laftel'?'selected':''}>laftel</option>
												<option value="netflix"
													${selectParty.service eq 'netflix'?'selected':''}>netflix</option>
												<option value="tving"
													${selectParty.service eq 'tving'?'selected':''}>tving</option>
												<option value="wavve"
													${selectParty.service eq 'wavve'?'selected':''}>wavve</option>
										</select>
										</td>
									</tr>
									<tr>
										<td>&emsp;제목 :&emsp;<input type="text" name="title"
											value="${selectParty.title}" /></td>
									</tr>
									<tr>
										<td>이메일 :&emsp;<input type="text" name="userid"
											value="${selectParty.userid}" readonly /></td>
									</tr>
									<tr>
										<td>인원수 :&emsp;<input type="text" name="peoplecnt_max"
											value="${selectParty.peoplecnt_max}" readonly="readonly" /></td>
									</tr>
									<tr>
										<td>개월수 :&emsp;<input type="text" id="partyday" name="partyday"
											value="${selectParty.partyday}" onchange="calcprice()" required />
										</td>
									</tr>

									<tr>
										<td> &emsp;합계 :&emsp;<input type="text" id="price" name="price"
											value="${selectParty.price }" /></td>
									</tr>
								</table>
								<hr>
								<div style="border: none; text-align: center;">
									<input type="button" value="취소" onclick="closeModal2()" /> 
									<input class="winwin" type="submit" value="수정"/>
								</div>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<script>
    // 모달 가져오기
    var modal2 = document.getElementById('myModal2');

    // 모달을 열 때 실행되는 함수
    function openModal2(seq) {
        // 모달 내용을 불러와서 modalContent에 삽입
        document.getElementById('modalContent2');
//.innerHTML = '<iframe src="/partyUpdateForm?seq=' + seq + '" width="100%" height="100%"></iframe>'
        // 모달 열기
        modal2.style.display = 'block';
    }

    // 모달 닫기
    function closeModal2() {
        modal2.style.display = 'none';
    }
</script>
</body>
</html>

