<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/">팀 프로젝트명</a>
                
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link" href="/">홈</a></li>
                        <c:choose>
	                        <c:when test="#">
	                        	<li class="nav-item"><a class="nav-link" href="#getparty">파티 만들기/찾기</a></li>
	                        </c:when>
	                        <c:otherwise>
	                        	<c:if test="${member == null }">
		                        	<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>	                        	
	                        	</c:if>
	                        	<c:if test="${member != null }">
		                        	<li class="nav-item"><a class="nav-link" href="logout">로그아웃</a></li>	                        	
	                        	</c:if> 	
	                       	</c:otherwise>
                        </c:choose>
                        <li class="nav-item"><a class="nav-link"> About </a></li>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>