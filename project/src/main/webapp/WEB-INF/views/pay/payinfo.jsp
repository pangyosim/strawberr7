<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>payinfo.jsp</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MAIN</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/pay.js"></script>
<link href="resources/css/paycss.css" rel="stylesheet"/>
</head>
<body style="display: flex; justify-content: center; align-content: center;">
   	<c:import url="../main/header.jsp"/>
   	<form action="payresult" id="pay_form" method="post" style="margin-top: 150px; margin-left: 50px; ">
   		<input type="hidden" value="${vo.seq }"/>
	   	<h3>주문 / 결제</h3>
	   	<table style="width: 1500px; height: 70px; text-align: center; border-top: 1px solid #444444;">
	   		<tr style="background-color:#e5ddff; height: 50px;">
	   			<th>서비스</th><th>기간</th><th>가격</th><th>수수료</th><th>합계</th>
	   		</tr>
	   		<tr style="height: 150px;">
	   			<c:if test="${vo.service eq 'watcha' }">
	   				<td><img src="resources/assets/img/watcha.png" width="130" height="100"/></td>
	   			</c:if>
	   			<c:if test="${vo.service eq 'youtube' }">
	   				<td><img src="resources/assets/img/youtube.png" width="120" height="100"/></td>
	   			</c:if>
	   			<c:if test="${vo.service eq 'netflix' }">
	   				<td><img src="resources/assets/img/netflix.png" width="180" height="100"/></td>
	   			</c:if>
	   			<td>${vo.partyday }</td>
	   			<td>${vo.price }</td>
	   			<td>${vo.price*0.1 }</td>
	   			<td>${vo.price*1.1 }</td>
	   		</tr>
	   	</table>
	   	<table>
	   		<tr>
	   			<td style="width: 200px">결제 정보</td><td style="width: 700px;"></td><td style="width: 300px">결제 방법</td>
	   		</tr>
	   		<tr>
	   			<td>아이디</td><td>${mv.id }</td>
	   			<td rowspan="5">
	   					<img src="resources/assets/img/tosspay.png" width="120" height="50"/> &nbsp; <input type="radio" name="pg" value="tosspayments" checked/> <label>toss</label><br/>
	   					<img src="resources/assets/img/kakaopay.png" width="100" height="50"/> &nbsp; <input type="radio" name="pg" value="kakaopay"/> <label>kakao</label><br/>
	   					&nbsp; <img src="resources/assets/img/payco.png" width="100" height="50"/> &nbsp; <input type="radio" name="pg" value="payco"/> <label>payco</label><br/>
	   					&nbsp; <img src="resources/assets/img/account_img.png" width="100" height="100"/> &nbsp; <input type="radio" name="pg" value="account"/> <label>계좌이체</label>
	   			</td>
	   		</tr>
	   		<tr>
	   			<td>이름</td><td>${mv.name }</td>
	   		</tr>
	   		<tr>
	   			<td>결제 금액</td><td>${vo.price}</td>
	   		</tr>
	   		<tr>
	   			<td>수수료 (10%)</td><td>${vo.price*0.1 }</td>
	   		</tr>
	   		<tr>
	   			<td>합계</td><td>${vo.price*1.1 }</td>
	   		</tr>
	   	</table>
	   	<br/>
	   	<br/>
	   	<div class="input_area">
		   	<input type="button" id="pay" value="결 제" onclick="requestPay(${vo.price*1.1},'${vo.service }','${mv.name }','${mv.email }','${mv.tel }','${mv.addr }',${vo.seq},'${mv.id}')" style=" width: 300px; height: 70px; font-size: 20px; "/> &nbsp; &nbsp; &nbsp;
		   	<input type="button" id="list" onclick="location.href='/'" value="목 록"  style="width: 300px; height: 70px; font-size: 20px;"/>
	   	</div>
	</form>
	<c:import url="../main/footer.jsp"></c:import>
</body>
</html>