<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}

	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function() {
		$.ajax({
			type : "POST",
			url : "${pageContext.request.contextPath}/login/userSearch?name="
					+ $('#name').val() + "&tel=" + $('#tel').val(),
			success : function(data) {
				if (data == null) {
					$('#class').text("회원 정보를 확인해주세요!");
				} else {
					$('#class').text(data)
					// 아이디값 별도로 저장
					openPopup();
				}
			}
		});
	}
	function openPopup() {
		$("#popup").show(); // 팝업 표시
		$("body").append('<div class="backon"></div>'); // 배경 오버레이 추가
	}

	function closePopup() {
		$("#popup").hide(); // 팝업 숨기기
		$(".backon").remove(); // 배경 오버레이 제거
	}
</script>
</head>
<body>
	<h3>아이디/비밀번호 찾기</h3>
	<div style="margin-bottom: 10px;"
		class="custom-control custom-radio custom-control-inline">
		<input type="radio" class="custom-control-input" id="search_1"
			name="search_total" onclick="search_check(1)" checked="checked">
		<label class="custom-control-label font-weight-bold text-white"
			for="search_1">아이디 찾기</label>
	</div>
	<div class="custom-control custom-radio custom-control-inline">
		<input type="radio" class="custom-control-input" id="search_2"
			name="search_total" onclick="search_check(2)"> <label
			class="custom-control-label font-weight-bold text-white"
			for="search_2">비밀번호 찾기</label>
	</div>
	<div id="searchI">
		<div class="form-group">
			<label for="name">이름</label>
			<div>
				<input type="text" class="form-control" id="name" name="name"
					placeholder="ex) 카리나">
			</div>
		</div>
		<div class="form-group">
			<label for="tel">휴대폰번호</label>
			<div>
				<input type="text" class="form-control" id="tel" name="tel"
					placeholder="ex) 010-7777-9999">
			</div>
		</div>
		<div class="form-group">
			<button id="searchBtn" type="button" onclick="idSearch_click()"
				class="btn btn-primary btn-block">확인</button>
			<a class="btn btn-danger btn-block"
				href="${pageContext.request.contextPath}">취소</a>
		</div>
		<div id="popup" style="display: none;">
			<div class="popup-content">
				<p id="class"></p>
				<button onclick="closePopup()">닫기</button>
			</div>
		</div>
	</div>
	<div id="searchP" style="display: none;">
		<div class="form-group">
			<label for="id_val">아이디</label>
			<div>
				<input type="text" class="form-control" id="id_val" name="id_val"
					placeholder="ex) godmisu">
			</div>
		</div>
		<div class="textForm" class="mail_input" id="mail_input"
			name="mail_input">
			<input type="text" class="mail" name="mail" id="mail"
				placeholder="이메일 입력" maxlength="20" />@ <select class="domain"
				id="domain" name="domain">
				<option value="none">---이메일---</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.com">gmail.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
			</select>
			<button type="button" id="sendBtn" name="sendBtn"
				onclick="sendNumber()">인증번호</button>
		</div>
		<br />
		<div id="mail_number" name="mail_number" style="display: none">
			<input type="text" name="number" id="number" placeholder="인증번호 입력" />
			<button type="button" name="confirmBtn" id="confirmBtn"
				onclick="confirmNumber()">이메일 인증</button>
		</div>
		<br /> <input type="text" id="Confirm" name="Confirm"
			style="display: none" value="" />
		<div id="popup2" style="display: none;">
			<div class="popup-content">
				<form action="changePwResult" method="post">
					<div class="textForm">
						<input type="hidden" id="umail" name="umail" value=""> 
						<input type="password" placeholder="비밀번호" id="changePw" name="changePw"><br> 
						<input type="password" placeholder="비밀번호 확인" name="changePwdConfirm">
					</div>
					<button type="submit" onclick="check()">확인</button>
				</form>
				<button onclick="closePopup2()">닫기</button>
			</div>
		</div>
		<script type="text/javascript">
			function sendNumber() {
				var mailf = document.getElementsByClassName('mail')[0];
				var maill = document.getElementsByClassName('domain')[0];
				if (mailf.value == '' || maill.value == 'none') {
					alert('이메일을 입력해주세요.');
					return false;
				}
				var email = mail_input + "@" + domain;
				var exptext = /^[\w]([-_.]?[\w])*@[\w]([-_.]?[\w])*\.[a-zA-Z]{2,3}$/i;
				if (!exptext.test(email)) {
					$("#mail_number").css("display", "block");
					$.ajax({
						url : "mail",
						type : "post",
						dataType : "json",
						data : {
							 "mail" : $("#mail").val() + "@" + $("#domain").val()
						},
						//mail:email,
						success : function(data) {
							alert("인증번호 발송");
							$("#Confirm").attr("value", data);
							var umail = $("#mail").val() + "@" + $("#domain").val();
							document.getElementById("umail").value = umail;
						}
					});
				} else {
					alert("이메일 형식이 올바르지 않습니다");
				}
			}
			function confirmNumber() {
				var number1 = $("#number").val();
				var number2 = $("#Confirm").val();

				if (number1 == number2) {
					alert("인증되었습니다");
					openPopup2();
				} else {
					alert("번호가 다릅니다")
				}
			}
			function openPopup2() {
				$("#popup2").show(); // 팝업 표시
				$("body").append('<div class="backon"></div>'); // 배경 오버레이 추가
			}

			function closePopup2() {
				$("#popup2").hide(); // 팝업 숨기기
				$(".backon").remove(); // 배경 오버레이 제거
			}

			function check() {
				// 비밀번호
				var changePw = document.getElementById('changePw');
				if (changePw.value == '') {
					alert('비밀번호를 입력해주세요.');
					changePw.focus();
					return false;
				}

				// 비밀번호 확인
				var changePwdConfirm = document
						.getElementsByName('changePwdConfirm')[0];
				if (changePwdConfirm.value == '') {
					alert('비밀번호 확인을 입력해주세요.');
					changePwConfirm.focus();
					return false;
				}
			}
		</script>
		<div class="form-group">
			<a href="${pageContext.request.contextPath}">취소</a>
		</div>
	</div>
</body>
</html>