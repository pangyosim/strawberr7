<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="resources/css/paycss.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script type="text/javascript" src="resources/js/pay.js"></script>
<style type="text/css">
#servicech{
	width: 1200px; 
	height: 40px; 
	text-align: center; 
	/* border-top: 1px solid #444444; */
	border: 1px solid #ddd; 
	border-top: solid;
    border-left: none;
    border-right: none;
    font-weight: bold; 
    
      
}
#price{
	color: #A374DB;
	font-weight: bold; 
	font-size: 20px;
}
 #accountcheck {
 	  margin: 130px;
      width: 400px;
      border-collapse: collapse;
      margin-bottom: 20px;
   }

   #accountcheck td {
      border: 1px solid #ddd; 
      border-left: none;
      border-right: none;
      padding: 10px;
   }

 /*   #accountcheck td[colspan="3"] {
      border-bottom: 3px solid black;
   } */

/*    #pay, #list {
      width: 300px;
      height: 70px;
      font-size: 20px;
      cursor: pointer;
   } */

#pay {
   width: 300px; 
   background-color: #9A6AF6;
   border: 2px solid #A374DB;
   border-radius: 15px;
   color: white;
   height: 70px; 
   font-size: 20px;
  }

#list {
   border: 2px solid #A374DB;
   border-radius: 15px;
   width: 300px; 
   height: 70px; 
   font-size: 20px;
  }
#number{
	background-color: #e0e0e0;
    border: 2px solid #9A6AF6;;
   	text-align: center;
    border-radius: 15px;
    color: #A374DB;
    width: 300px; 
    font-weight: bold; 
    font-size: 20px;
    margin-top: 50px;
   }
.input_area {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    margin-bottom: 200px;
   }
#accountcheck{
	margin: 0 auto;
	margin-left:0;
	margin-right:100px;
	padding: 0;
   }
#account{
	
   }
#mw{
	
}
 .qwer {
        display: flex;
        justify-content: center;
        align-items: flex-start;
        margin-top: 100px;
        
    }
    table {
        margin: 10px; /* 원하는 여백 설정 */
        vertical-align: top;
    
    }

</style>
</head>
<body style="display: flex; justify-content: center; align-content: center;">
   	<c:import url="../main/header.jsp"/>
   	<form action="payresult" id="pay_form" method="post" style="margin-top: 150px; margin-left: 50px; ">
   		<input type="hidden" value="${vo.seq }"/>
	   	<h2>주문 / 결제</h2>
	   	<table id="servicech">
	   		<tr style="background-color:#e0e0e0; height: 50px;">
	   			<th></th><th>서비스</th><th>기간</th><th>가격</th><th>수수료</th><th>합계</th>
	   		</tr>
	   		<tr style="height: 100px;">
	   			<td><img src="resources/assets/img/${vo.service}.png" width="60" height="60"/></td><td>${vo.service}</td>
	   			<td><fmt:formatDate value="${vo.partydate }" pattern="yyyy년MM월dd일"/>~<fmt:formatDate value="${vo.enddate }" pattern="yyyy년MM월dd일"/>(${vo.partyday }개월)</td>
	   			<td><fmt:formatNumber type="number" maxFractionDigits="0" value="${vo.price / vo.peoplecnt_max  }" />원</td>
	   			<td><fmt:formatNumber type="number" maxFractionDigits="0" value="${(vo.price / vo.peoplecnt_max)*0.1 }" />원</td>
	   			<td id="price"><fmt:formatNumber type="number" maxFractionDigits="0" value="${(vo.price / vo.peoplecnt_max)*1.1 }"/>&nbsp;원</td>
	   		</tr>
	   	</table>
	   	<div class="qwer">
	   	<table id="accountcheck">
	   		<tr>
	   			<td style=" width: 600px;font-weight: bold; font-size: 20px;">결제 정보</td><td style="width: 700px;"></td>
	   		</tr>
	   		
	   		<tr style="border-top: solid; ">
	   			<td>아이디</td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;${mv.id }</td>
	   		</tr>
	   		<tr>
	   			<td>이름</td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;${mv.name }</td>
	   		</tr>
	   		<tr style="border-top: solid;">
	   			<td>참여 금액</td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<fmt:formatNumber type="number" maxFractionDigits="0" value="${vo.price / vo.peoplecnt_max }" />&nbsp;원</td>
	   		</tr>
	   		<tr>
	   			<td>수수료 (10%)</td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;<fmt:formatNumber type="number" maxFractionDigits="0" value="${(vo.price / vo.peoplecnt_max)*0.1 }" /></td>
	   		</tr>
	   		<tr>
	   			<td>합계</td><td>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<fmt:formatNumber type="number" maxFractionDigits="0" value="${(vo.price / vo.peoplecnt_max)*1.1 }" />&nbsp;원</td>
	   		</tr>
	   	</table>
	   	
	   	<table id="mw">
	   		<tr>
	   			<td style="width: 300px;font-weight: bold; font-size: 20px;">결제 방법</td>
	   		</tr>
	   		<tr>
	   			<td style="">
	   				<img src="resources/assets/img/tosspay.png" width="140" height="50"/> &nbsp; <input type="radio" name="pg" value="tosspayments" checked/> <label>toss</label><br/>
	   				<img src="resources/assets/img/kakaopay.png" width="140" height="50"/> &nbsp; <input type="radio" name="pg" value="kakaopay"/> <label>kakao</label><br/>
	   				<img src="resources/assets/img/payco.png" width="140" height="50"/> &nbsp; <input type="radio" name="pg" value="payco"/> <label>payco</label><br/>
 	   				<p id="number">합계 :&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<fmt:formatNumber type="number" maxFractionDigits="0" value="${(vo.price / vo.peoplecnt_max)*1.1 }" />&nbsp;원</p>
	   			</td>
	   			<td>
	   			</td>
	   		</tr>
 	   			<tr>
	   		</tr>
	   	</table>
	  
	   	</div>
	
	   	<br/>
	   	<br/>
	   	<div class="input_area">
		   	<input type="button" id="pay" value="결 제" onclick="requestPay(${(vo.price / vo.peoplecnt_max)*1.1 },'${vo.service }','${mv.name }','${mv.email }','${mv.tel }','${mv.addr }',${vo.seq},'${mv.email}')"/> &nbsp; &nbsp; &nbsp;
		   	<input type="button" id="list" onclick="location.href='/'" style="cursor: pointer;" value="목 록" />
	   	</div>
	</form>
	<c:import url="../main/footer.jsp"></c:import>
</body>
</html>