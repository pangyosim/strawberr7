<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/" style="color: #ba77ea;">OYES</a>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                       	<li class="nav-item"><a class="nav-link" href="/" style="color: #ba77ea;  width: 60px;">홈</a></li>
                        <c:choose>
	                        <c:when test="${member == null }">
	                		    <li class="nav-item"><a class="nav-link" href="login" style="color: #ba77ea;  width: 90px;">로그인</a></li>
        		    	        <li class="nav-item"><a class="nav-link" href="/reviewForm?page=1" style="color: #ba77ea;  width: 90px;">Q&A</a></li>	                        	
	                        </c:when>
	                        <c:otherwise>
	                        	<li class="nav-item"><a class="nav-link" href="logout" style="color: #ba77ea; width: 90px;">로그아웃</a></li> &nbsp;
	                        	<li class="nav-item"><a class="nav-link" href="createparty?email=${member.email }" style="color: #ba77ea; width: 100px;">파티만들기</a></li> &nbsp;
	                        	<li class="nav-item"><a class="nav-link" href="getmypage" style="color: #ba77ea; width: 100px;">마이페이지</a></li> &nbsp;
	                        	<li class="nav-item"><a class="nav-link" href="/reviewForm?page=1" style="color: #ba77ea;  width: 90px;">Q&A</a></li> 
	                       	</c:otherwise>
                        </c:choose>
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>