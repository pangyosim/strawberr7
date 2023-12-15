<!-- loing/loginResult.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta charset="UTF-8">
<title>로그인 DB 확인</title>
</head>
<body>
	<h3>로그인 확인</h3>
	${member.id }
	${member.name }
	
	<a href="/">메인</a>
</body>
</html>