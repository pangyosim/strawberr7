<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta>
<title>partydetail.jsp</title>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body style="background-color: black;">
	<c:import url="../main/header.jsp"/>
	<form action="" method="post" style="margin-top: 150px; text-align: center;">
		<div class="party-details">
			<p>파티 이름</p>
		</div>
		<input type="button" onclick="location.href='/'" value="목 록"> &nbsp;&nbsp;&nbsp; <input type="submit" value="결제 요청"/>
	</form>
</body>
</html>