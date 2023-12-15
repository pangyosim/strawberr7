<!-- login/memberSuccess.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>memberSuccess.jsp</title>
<script type="text/javascript">
/* 페이지 로딩 10초 후 자동으로 이동 */
    setTimeout(function(){
        window.location.href = '/';
    }, 3000);
</script>
</head>
<body>
<c:import url="../main/header.jsp"/>
<h3>${nickname} 님 환영합니다~</h3>
<br>
<p>3초 후 메인으로 이동 됩니다.</p>



</body>
</html>