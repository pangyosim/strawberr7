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
                <a class="navbar-brand" href="/" style="color: #CA226B;">팀 프로젝트명</a>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
                        <!-- 검색창 -->
                        <div class="searchBar">
                        	<i class="fa-solid fa-magnifying-glass"></i>
                        	<input type="text" class="input" onclick="" style="border: none; background: transparent; color: white;"/>
                        </div> 
                       		
                       		<li class="nav-item"><a class="nav-link" href="/" style="color: #CA226B;">홈</a></li>
                        <c:choose>
	                        <c:when test="${member == null }">
	                		    <li class="nav-item"><a class="nav-link" href="login" style="color: #CA226B;">로그인</a></li>
        		    	        <li class="nav-item"><a class="nav-link" href="#" style="color: #CA226B;">About</a></li>	                        	
	                        </c:when>
	                        <c:otherwise>
	                        	<li class="nav-item"><a class="nav-link" href="logout" style="color: #CA226B;">로그아웃</a></li> &nbsp;
	                        	<li class="nav-item"><a class="nav-link" href="createparty?email=${member.email }" style="color: #CA226B;">파티만들기</a></li> &nbsp;
	                        	<li class="nav-item"><a class="nav-link" href="getmypage" style="color: #CA226B;">마이페이지</a></li> &nbsp; 
	                        	<!-- <div class="dropdown" style="right: 30px; top: 6.8px;">
							      <span class="dropbtn" style="color: #CA226B;">마이페이지</span>
							      <div class="dropdown-content">
							        <a href="memberUpdateForm">회원수정</a>
							        <a href="memberDelete">회원탈퇴</a>
							        <a href="partyUpdateForm">내파티보기</a>
							        <a href="#">Q&A</a>
							      </div>
							    </div>  -->
	                       	</c:otherwise>
                        </c:choose>
                        <!-- mypage hidden -->
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>