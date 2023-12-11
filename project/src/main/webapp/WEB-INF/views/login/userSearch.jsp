<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/login/userIdSearchModal.jsp"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					+ $('#name').val()
					+ "&tel="
					+ $('#tel').val(),
			success : function(data) {
				if (data == null) {
					$('#id').text("회원 정보를 확인해주세요!");
				} else {
					$('#id').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}
	
    // jQuery를 사용하여 모달 동작 구현
    $(document).ready(function() {
        // 1. 모달창 히든 불러오기
        $('#searchBtn').click(function() {
            $('#background_modal').show();
        });
        // 2. 모달창 닫기 버튼
        $('.close').on('click', function() {
            $('#background_modal').hide();
        });
        // 3. 모달창 위도우 클릭 시 닫기
        $(window).on('click', function(event) {
            if (event.target == $('#background_modal').get(0)) {
                $('#background_modal').hide();
            }
        });
    });
	
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
				<input type="text" class="form-control" id="name"
					name="name" placeholder="ex) 카리나">
			</div>
		</div>
		<div class="form-group">
			<label for="tel">휴대폰번호</label>
			<div>
				<input type="text" class="form-control" id="tel"
					name="tel" placeholder="ex) 010-7777-9999">
			</div>
		</div>
		<div class="form-group">
			<button id="searchBtn" type="button" onclick="idSearch_click()"
				class="btn btn-primary btn-block">확인</button>
			<a class="btn btn-danger btn-block"
				href="${pageContext.request.contextPath}">취소</a>
		</div>
	</div>
	<div id="searchP" style="display: none;">
		<div class="form-group">
			<label for="id">아이디</label>
			<div>
				<input type="text" class="form-control" id="id"
					name="id" placeholder="ex) godmisu">
			</div>
		</div>
		<div class="form-group">
			<label for="email">이메일</label>
			<div>
				<input type="email" class="form-control" id="email"
					name="email" placeholder="ex) E-mail@gmail.com">
			</div>
		</div>
		<div class="form-group">
			<button id="searchBtn2" type="button"
				class="btn btn-primary btn-block">확인</button>
			<a class="btn btn-danger btn-block"
				href="${pageContext.request.contextPath}">취소</a>
		</div>
	</div>
</body>
</html>