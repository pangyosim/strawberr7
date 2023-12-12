<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>memberJoinForm.jsp</title>
<script type="text/javascript" src="resources/js/partyScript.js"></script>
<style>
#toc-content {
	display: none;
}

#toc-toggle {
	cursor: pointer;
	color: #2962ff;
}

#toc-toggle:hover {
	text-decoration: #ba77ea;
}
#groupjoin {
	border: 1px solid black;
	width: 500px;
	height: 400px;
	margin: 0 auto;
	margin-top: 150px;
	border-radius: 15px;
}

</style>
<script type="text/javascript">
function validateForm() {
  var checkbox = document.getElementById('termsCheckbox');
  if (!checkbox.checked) {
    alert('약관에 동의해야 합니다.');
    return false;
  }
}

function checkauthority(){
	if (document.groupjoin.name.value == "") {
		alert("이름을 입력하세요");
		document.groupjoin.name.focus();
	} else if (document.groupjoin.bank.value == "") {
		alert("은행을 입력하세요");
		document.groupjoin.bank.focus();
	} else if (document.groupjoin.acount.value == "") {
		alert("계좌정보를 입력하세요~");
		document.groupjoin.acount.focus();
	}
}

</script>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body style="">
	<c:import url="../main/header.jsp" />
	<!-- 이름 / 연락처 / 주민번호 / 출금계좌  -->
	<form action="groupJoinResult" name="groupjoin" id="groupjoin" method="post"
		onsubmit="return validateForm();">
		<div class="">
			<input type="text" id="name" name="name" placeholder="이름">
			<select
				class="" id="bank" name="bank">
				<option value=1>하나은행</option>
				<option value=2>국민은행</option>
				<option value=3>새마을금고</option>
				<option value=4>우리은행</option>
				<option value=5>제주은행</option>
				<option value=6>신한은행</option>
			</select>
			<input type="text" id="account" name="account" placeholder="계좌번호">
			<button onclick="accountcheck()">은행 확인</button>
			목차 [<span id="toc-toggle" onclick="openCloseToc()">보이기</span>]
				<ol id="toc-content" style="list-style: none;">
					<li>- 파티(상품) 권한 및 관리 책임은 판매자에게 있습니다</li>
					<li>- 판매자 귀책사유로 분쟁이 발생된 경우 해결해야 할 책임이 있으면,</li>
					<li>분쟁34이 지속 되는 경우 (사이트명)정책에 따라 진행됩니다.</li>
					<li>- 판메자는 파티모집 후 약속된 기간동안 파티를 유지 및 관리를 진행할 의무가 있으며,</li>
					<li>해당 의무를 다하지 못함으로서써 발생된 이슈 및 분쟁에 대해서 해결 해야할 책임이 있습니다.</li>
					<li>- 개인 파티장은 모집 시 판매 수수료가 없습니다.</li>
					<li>(개인파티장은 한달에 한 서비스에 한번만 파티를 등록할수 있습니다.)</li>
					<li>- 전문 파티장은 파티원 모집 시 10%의 핀메 수수료가 발생되며,출금시 차감되어 출금됩니다.</li>
					<li>(수수료 10%에 대해서는 세금계산서 발행 됩니다.)</li>
					<li>- 출금 신청 시 입력 된 계좌로 출금되며, (사이트명)에서 인증 된 실명과 다를 경우 출금이 안됩니다.</li>
					<li>- (사이트명) 통신판매 중개자이며, 통신판매 당사자가 아닙니다.</li>
					<input type="checkbox" id="termsCheckbox" name="terms" value="agree" />
					서비스 제공자의 가입약관과 상기 정보제공에 동의합니다.
				</ol>
			</div>
		<input type="hidden" name="email" value="${email}"/>
		<input type="submit" value="완료" onclick="checkauthority()" id="checktable">
	</form>
	<script>
  function openCloseToc() {
    if(document.getElementById('toc-content').style.display === 'block') {
      document.getElementById('toc-content').style.display = 'none';
      document.getElementById('toc-toggle').textContent = '약관 동의';
    } else {
      document.getElementById('toc-content').style.display = 'block';
      document.getElementById('toc-toggle').textContent = '약관 동의';
    }
  }

</script>
</html>