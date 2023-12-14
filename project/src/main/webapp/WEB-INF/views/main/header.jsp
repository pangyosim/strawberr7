<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<style type="text/css">
.searchBar{
	position: relative;
	width: 200px;
	height: 30px;
	margin: 10px auto;
	padding: 5px;
	
}
.fa-magnifying-glass{
	position: absolute;
	top: 8px;
	left: 12px;
}
.searchBar input{
	position: absolute;
	top: 3px;
	left: 30px;
	width: 150px;
	border: none;
	padding: 4px;
}

/* mypage */
.hidden_menu {
    position: relative;
    display: inline-block;
}

.hidden_menu .submenu {
    display: none;
    position: absolute;
    z-index: 1;
}

.hidden_menu:hover .submenu {
    display: block;
}
.hidden_menu .submenu li {
    clear: both;
    width: 100%;
}

.hidden_menu .submenu li:hover {
    background-color: #f1f1f1;
}
.hidden_menu .submenu a {
    color: gray;
    font-size: 12px;
}
</style>
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
	                        	<li class="nav-item"><a class="nav-link" href="logout" style="color: #CA226B;">로그아웃</a></li> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	                        	<div class="dropdown" style="right: 30px; top: 6.8px;">
							      <span class="dropbtn" style="color: #CA226B;">마이페이지</span>
							      <div class="dropdown-content">
							        <a href="memberUpdateForm">회원수정</a>
							        <a href="memberDelete">회원탈퇴</a>
							        <a href="createparty?email=${member.email }">파티만들기</a>
							        <a href="mygrouplist">파티보기</a>
							        <a href="groupModify">파티수정</a>
							        <a href="#">Q&A</a>
							      </div>
							    </div> 
	                       	</c:otherwise>
                        </c:choose>
                        <!-- mypage hidden -->
                    </ul>
                </div>
            </div>
        </nav>
</body>
</html>