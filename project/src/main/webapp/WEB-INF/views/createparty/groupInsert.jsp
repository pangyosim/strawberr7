<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>groupInsert</title>
<style type="text/css">

</style>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body align="center">
	<c:import url="../main/header.jsp" />
   <form action="groupOk" method="post" style="margin-top: 150px; text-align: center;">
        <h1>새로운 그룹 생성</h1>
        <label for="service">서비스 종류:</label>
       <!--  <input type="text" id="service" name="service" required><br/> -->
		<label>
		<select class="sevice_form" id="service" name="service">
            <option value="youtube">youtube</option>
            <option value="watcha">watcha</option>
            <option value="netflix">netflix</option>
            <option value="tving">tving</option>
            <option value="wavve">wavve</option>
        </select>
        </label><br><br>
        <label for="title">파티 제목:</label>
        <input type="text" id="title" name="title" required><br/>

        <label for="peoplecnt">파티 인원:</label>
        <input type="number" id="peoplecnt" name="peoplecnt" required><br/>

        <label for="userid">파티장 아이디:</label>
        <input type="text" id="userid" name="userid" value="${member.id }" required><br/>

        <label for="partyday">파티 기간:</label>
        <input type="text" id="partyday" name="partyday" required><br/>

        <label for="price">가입 가격:</label>
        <input type="number" id="price" name="price" required><br/>

        <label for="partydate">생성일자:</label>
        <input type="partydate" id="partydate" name="partydate" required><br/>

        <input type="submit" value="그룹 생성">
        <a href="/"/>그룹 목록으로 돌아가기</a>
    </form>
    <br/>
   	<c:import url="../main/footer.jsp" />
    

</body>
</html>