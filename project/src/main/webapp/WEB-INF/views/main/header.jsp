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

/* 리스트로고 */
#control {
    width: 100%;
    bottom: 20px;
    text-align: center;
    border-redius: 50px;
    padding:10px;
}

#control a {
    display: inline-block;
    width: 30px;
    height: 30px;
    margin: 0 4px;
    position: relative;
    color: white;
}

#control a img {
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
}

#control a span {
    position: absolute;
    top: 0;
    left: 100%;
    display: none;
    white-space: nowrap;
    background-color: black;
    padding: 5px;
    border-radius: 5px;
    z-index:1;
	}

#control a:hover span {
display: block; /* 마우스가 올라갔을 때 텍스트를 표시합니다. */
}

#control a.on {
    background-color: black;
}

</style>
</head>
<body>
	<!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/" style="color: #CA226B;">팀 프로젝트명</a>
                <div id="control">
					<a href="#" onclick="currentSlide(1)">
					<img src="https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png" 
					alt="netflix"
					style="height: 30px;width: 30px;"/>
					<span>Netflix</span>
					</a>
					 <a href="#" onclick="currentSlide(2)">
					 <img src="https://oopy.lazyrockets.com/api/rest/cdn/image/99453fde-4624-457f-8471-2393b96ccdbb.jpeg" 
					 alt="disney"
					 style="height: 30px;width: 30px;"/>
			        <span>Watcha</span>
			        </a>
			        <a href="#" onclick="currentSlide(3)">
			        <img src="https://www.tving.com/img/tving-favicon-160@3x.png" 
			        alt="tiving"
			        style="height: 30px;width: 30px;"/>
			        <span>Tiving</span>
			        </a>
			        <a href="#" onclick="currentSlide(4)">
			        <img src="https://play-lh.googleusercontent.com/7cuI7bdCeZbmc9anRXqpmxZPH92t5NEEbhTnj5by6skhZK_dlUg9kx--gqtLf-8c2K12=w240-h480-rw" 
			        alt="wavve"
			        style="height: 30px;width: 30px;"/>
			        <span>Wavve</span>
			        </a>
				</div>
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