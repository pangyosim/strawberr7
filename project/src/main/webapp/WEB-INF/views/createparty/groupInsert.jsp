<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>groupInsert</title>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function changeSelect(){
		if($("#service option:selected").val() == 'youtube'){
			document.getElementById("peoplecnt_max").value=0;
		} else if ($("#service option:selected").val() == 'netflix'){
			document.getElementById("peoplecnt_max").value=4;
		} else if ($("#service option:selected").val() == 'watcha'){
			document.getElementById("peoplecnt_max").value=4;
		} else if ($("#service option:selected").val() == 'tving'){
			document.getElementById("peoplecnt_max").value=4;
		} else if ($("#service option:selected").val() == 'wavve'){
			document.getElementById("peoplecnt_max").value=4;
		} 
	}
	
	function calcprice(){
		if($("#service").val() == 'youtube'){
			document.getElementById("price").value= document.getElementById("partyday").value * 14900 ;
		} else if ($("#service").val() == 'netflix'){
			document.getElementById("price").value= document.getElementById("partyday").value * 17000 ;
		} else if ($("#service").val() == 'watcha'){
			document.getElementById("price").value= document.getElementById("partyday").value * 12900 ;
		} else if ($("#service").val() == 'tving'){
			document.getElementById("price").value= document.getElementById("partyday").value * 17000 ;
		} else if ($("#service").val() == 'wavve'){
			document.getElementById("price").value= document.getElementById("partyday").value * 13900 ;
		}
	}
	
</script>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body align="center">
	<c:import url="../main/header.jsp" />
   <form action="groupOk" method="post" style="margin-top: 150px; text-align: center;">
        <h1>새로운 그룹 생성</h1>
        <label for="service">서비스 종류:</label>
       <!--  <input type="text" id="service" name="service" required><br/> -->
		<label>
		<select class="sevice_form" id="service" name="service" onchange="changeSelect()">
			<option value="" selected disabled>---select---</option>
            <option value="youtube">youtube</option>
            <option value="watcha">watcha</option>
            <option value="netflix">netflix</option>
            <option value="tving">tving</option>
            <option value="wavve">wavve</option>
        </select>
        </label><br><br>
        <label for="title">파티 제목:</label>
        <input type="text" id="title" name="title" required><br/>
		<input type="hidden" value="1" name="peoplecnt" id="peoplecnt"/>
        <label for="peoplecnt">파티 인원:</label>
        <input type="number" id="peoplecnt_max" name="peoplecnt_max" value=" " readonly><br/>

        <label for="userid">공유할 아이디:</label>
        <input type="text" id="userid" name="userid" required><br/>
        
		<label for="userid">파티장 아이디:</label>
        <input type="text" id="partykingid" name="partykingid" value="${member.email }" readonly><br/>
        
        <label for="partyday">파티 기간:</label>
        <input type="text" id="partyday" name="partyday" onchange="calcprice()" required><br/>
		
        <label for="price">가입 가격:</label>
        <input type="number" id="price" name="price" readonly><br/>

        <input type="submit" value="그룹 생성"/>
        <a href="/"/>그룹 목록으로 돌아가기</a>
    </form>
    <br/>
   	<c:import url="../main/footer.jsp" />
    

</body>
</html>