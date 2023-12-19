<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Partyselect</title>
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
    
		/* 모달 스타일 */
.modal {
	display: none;
	position: absolute;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	padding-top: 60px;
}

/* 모달 콘텐츠 스타일 */
.modal-content {
	background-color: #fefefe;
	margin: 4% auto;
	border: 1px solid #888;
	width: 20%;
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
		<c:if test="${pw != null && pc != null && selectParty.peoplecnt == selectParty.peoplecnt_max}">
			<a>공유한 아이디 : ${pc }</a> <br>
			<a>공유한 비밀번호 : ${pw} </a>
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
					<c:if test="${selectParty.partykingid ne loginuser}">
						<button class="w-btn w-btn-per"type="button" name="pay" onclick="check_box()">결제</button>
					</c:if>
					<c:if test="${selectParty.partykingid eq loginuser }">
						<button class="w-btn w-btn-per"type="button" name="update" onclick="openModal('${group.seq}')">수정</button>
					</c:if>
				</th>
        	</tr>
        </table>
	</form>
			<!-- 모달 -->
		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close" onclick="closeModal()">&times;</span>
				<div id="modalContent"></div>
				<table>
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
										<td>제목 :<input type="text" name="title"
											value="${selectParty.title}" /></td>
									</tr>
									<tr>
										<td>id :<input type="text" name="userid"
											value="${selectParty.userid}" readonly /></td>
									</tr>
									<tr>
										<td>인원수 :<input type="text" name="peoplecnt_max"
											value="${selectParty.peoplecnt_max}" readonly="readonly" /></td>
									</tr>
									<tr>
										<td>개월수 :<input type="text" id="partyday" name="partyday"
											value="${selectParty.partyday}" onchange="calcprice()" required />
										</td>
									</tr>

									<tr>
										<td><input type="text" id="price" name="price"
											value="${selectParty.price }" /></td>
									</tr>
								</table>
								<hr>
								<input type="button" value="취소" onclick="closeModal()" /> 
								<input class="winwin" type="submit" value="수정"/>
							</form>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<script>
    // 모달 가져오기
    var modal = document.getElementById('myModal');

    // 모달을 열 때 실행되는 함수
    function openModal(seq) {
        // 모달 내용을 불러와서 modalContent에 삽입
        document.getElementById('modalContent');
//.innerHTML = '<iframe src="/partyUpdateForm?seq=' + seq + '" width="100%" height="100%"></iframe>'
        // 모달 열기
        modal.style.display = 'block';
    }

    // 모달 닫기
    function closeModal() {
        modal.style.display = 'none';
    }
</script>
</body>
</html>