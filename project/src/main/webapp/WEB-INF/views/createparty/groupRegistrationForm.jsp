<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>groupRegistrationForm.jsp</title>
</head>
<body>
	<!-- get이 맞는지? -->
	<form action="" method="get">
		<div class="">
			<p>- 파티(상품) 권한 및 관리 책임은 판매자에게 있습니다</p>
			<p>- 판매자 귀책사유로 분쟁이 발생된 경우 해결해야 할 책임이 있으면,</p>
			<p>  분쟁이 지속 되는 경우 (사이트명)정책에 따라 진행됩니다.</p>
			<p>- 판메자는 파티모집 후 약속된 기간동안 파티를 유지 및 관리를 진행할 의무가 있으며,</p>
			<p>  해당 의무를 다하지 못함으로서써 발생된 이슈 및 분쟁에 대해서 해결 해야할 책임이 있습니다.</p>
			<p>- 개인 파티장은 모집 시 판매 수수료가 없습니다.</p>
			<p>  (개인파티장은 한달에 한 서비스에 한번만 파티를 등록할수 있습니다.)</p>
			<p>- 전문 파티장은 파티원 모집 시 10%의 핀메 수수료가 발생되며,출금시 차감되어 출금됩니다.</p>
			<p>(수수료 10%에 대해서는 세금계산서 발행 됩니다.)</p>
			<p>- 출금 신청 시 입력 된 계좌로 출금되며, (사이트명)에서 인증 된 실명과 다를 경우 출금이 안됩니다.</p>
			<p>- (사이트명) 통신판매 중개자이며, 통신판매 당사자가 아닙니다.</p>
			<input type="checkbox" id="" name="" value="동의"> 서비스 제공자의 가입약관과 상기 정보제공에 동의합니다.
			<input type="button" value="들어가기" onclick="location.href='groupInsert'"/>
		</div>
	</form>
</body>
</html>