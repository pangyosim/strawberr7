<%@page import="com.web.service.PartyService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.vo.GroupVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MAIN</title>
<!-- 페이징 -->
	<style type="text/css">
    #slider-container {
        width: 100%;
        overflow: hidden;
        white-space: nowrap;
    }

    #slider-content {
        display: inline-block;
        transition: transform 0.5s ease;
    }

    .slide {
	width: 150px; 
	height: 300px;
	margin-right: 10px;
	display: inline-block;
	background-color: white;
	text-align: center;
	line-height: 10px;
    }
    .slider-button {
        margin-top:10px;
        position: absolute;
        top: 40%;
        transform: translateY(-50%);
        font-size: 18px;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        background-color: #87CEFA;
        border-radius: 25px; /* 둥근 모양을 위해 추가한 속성 */
    }

	#prev-button {
	    left: 10px;
	}
	
	#next-button {
	    right: 10px;
	}
	</style>
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
	<!-- 페이징 -->
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body id="page-top">
	<c:import url="header.jsp" />
	<!-- Services-->
	<!--  
	<div class="services" style="text-align: center;">
		<h2>서비스</h2>
		<input type="button" value="파티만들기 계좌등록" onclick="location.href='groupJoinForm'" /> &nbsp; &nbsp; 
		<input type="button" value="파티찾기" onclick="document.getElementById('party-input').focus()" /> <br />
		<input type="button" value="파티만들기폼" onclick="location.href='groupRegistrationForm'" /> 
		<input type="button" value="개인정보수정" onclick="location.href='memberUpdate'" />
		<input type="button" value="파티수정" onclick="location.href='partyUpdateForm'"/>
		<input type="button" value="리뷰" onclick="location.href='reviewForm?page=1'"/>
	</div>
	<br /> -->
	
   <!-- Masthead-->
   <div class="" style="width: 70%; height: 85%; margin-top: 100px; margin-left: 14%; border: 1px solid black; border-radius: 15px">
   		<h1 style="margin-left: 45%;">TOP10</h1>
   		<div id="control">
			<a href="#" onclick="currentSlide(1)">
			<img src="https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png" 
			alt="netflix"
			style="height: 30px; width: 30px;"/>
			<span>Netflix</span>
			</a>
			 <a href="#" onclick="currentSlide(2)">
			 <img src="https://oopy.lazyrockets.com/api/rest/cdn/image/99453fde-4624-457f-8471-2393b96ccdbb.jpeg" 
			 alt="disney"
			 style="height: 30px;width: 30px;"/>
	        <span>Watcha</span>
	        </a>
<!-- 	        <a href="#" onclick="currentSlide(3)">
	        <img src="https://www.tving.com/img/tving-favicon-160@3x.png" 
	        alt="tiving"
	        style="height: 30px;width: 30px;"/>
	        <span>Tving</span>
	        </a>
	        <a href="#" onclick="currentSlide(4)">
	        <img src="https://play-lh.googleusercontent.com/7cuI7bdCeZbmc9anRXqpmxZPH92t5NEEbhTnj5by6skhZK_dlUg9kx--gqtLf-8c2K12=w240-h480-rw" 
	        alt="wavve"
	        style="height: 30px;width: 30px;"/>
	        <span>Wavve</span>
	        </a> -->
		</div>
		<div id="visual">
			<div id="pic">
	   			<div class="top-list" style="margin-left: 35%;">
		   			<c:forEach var="netflix" items="${netflix_list}" varStatus="status">
			   			<img src="${netflix.image}" style="width: 50px; height: 50px;">  			
			   			<a href="${netflix.url }">${netflix.subject }</a>
			   			<br>
			   		</c:forEach>
		   		</div>
	   			<div class="top-list" style="margin-left: 35%;">
					<c:forEach var="whacha" items="${whacha_list}" varStatus="status">
		   			<img src="${whacha.image}" style="width: 50px; height: 50px;">  			
		   			<a href="${whacha.url }">${whacha.subject }</a>
		   			<br>
		   			</c:forEach>
				</div>
<!-- 				<div>
					<a href="#"> 
					</a>
				</div>
				<div>
					<a href="#"> 
					</a>
				</div> -->
			</div>
		</div>
   		<br>
   	</div>
   
   
   <!-- Services-->
   <div class="services_wrap" style="width: 75%; margin-left: 15%; margin-top: 50px;" >
    <div class="services_div">
    
   	<h2>최근 만들어진 파티</h2>
    <button id="prev-button" class="slider-button" onclick="slidePrev()">&#60;</button>
		<!-- 페이징 -->
		<div id="slider-container">
			<div id="slider-content">
				<table border="1">
					<tbody>
						<c:forEach var="group" items="${party}">
							<c:if test="${group.peoplecnt < group.peoplecnt_max }">
							<div class="slide" style="border: 1px solid black; border-radius: 10px; width: 200px;" onclick="location.href='PartyList?seq=${group.seq}'">
								<c:choose>
									<c:when test="${group.service != null}">
										<img
											src="resources/assets/img/${group.service }.png"
											style="width: 80px; height: 80px"
											/>
									</c:when>
									<c:otherwise>
										<img
											src="https://developer.apple.com/wwdc23/hero/endframes/p3-startframe-large_2x.jpg"
											style="width: 80px; height: 80px"
											/>
									</c:otherwise>
								</c:choose>
								<P>[${group.service}]</P>
								<p>${group.peoplecnt}명</p>
								<p>${group.partydate}~</p>
								<p>${group.enddate }</p>
								<p>${group.partyday}개월</p>
							</div>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<button id="next-button" class="slider-button" onclick="slideNext()">&#62;</button>
	</div>
	</div>
<br/>
<br/>
     <!-- Team-->
     <section class="page-section bg-light" id="team">
         <div class="container">
             <div class="text-center">
                 <h2 class="section-heading text-uppercase">Our Amazing Team</h2>
                 <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
             </div>
             <div class="row">
                 <div class="col-lg-4">
                     <div class="team-member">
                         <h4>Parveen Anand</h4>
                         <p class="text-muted">Lead Designer</p>
                     </div>
                 </div>

             </div>
             <div class="row">
                 <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
             </div>
         </div>
     </section>
        <c:import url="footer.jsp"></c:import>
    </body>
    
    <!-- 회원탈퇴 자바스크립트  -->
    <script type="text/javascript">
				
				function openConfirmWindow() {
				    var confirmWindow = window.open("", "", "width=300,height=200"); // 새 창을 열고 창 객체를 변수에 저장
				    confirmWindow.document.write("<p>정말 탈퇴하시겠습니까?</p>"); // 새 창에 메시지 출력
				    confirmWindow.document.write("<button onclick='opener.location.href=\"memberDelete\"; window.close();'>예</button>"); // '예' 버튼 생성. 클릭 시 부모 창의 주소를 변경하고 새 창을 닫음
				    confirmWindow.document.write("<button onclick='window.close();'>아니오</button>"); // '아니오' 버튼 생성. 클릭 시 새 창을 닫음
				}
				
	</script>
<!-- 메인리스트슬라이드 자바스크립트 -->
<script type="text/javascript">
	var slideIndex = 0;
	var slideInterval = 7000; //7cho
	var intervalId;

	function showSlides() {
		var i;
		var slides = document.getElementById("pic").getElementsByTagName("div");
		var dots = document.getElementById("control").getElementsByTagName("a");

		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
			dots[i].className = dots[i].className.replace(" on", "");
		}

		slideIndex++;

		if (slideIndex > slides.length) {
			slideIndex = 1;
		}

		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " on";
	}

	function currentSlide(n) {
		clearInterval(intervalId); 
		slideIndex = n - 1;
		showSlides();
		intervalId = setInterval(showSlides, slideInterval); 
	}
	// 페이지 로드 시 슬라이드 시작
	window.onload = function() {
		intervalId = setInterval(showSlides, slideInterval);
		currentSlide(1);
	};

	//로고글씨들
	function showText(platform) {
		var textElement = document.getElementById(platform.toLowerCase()
				+ 'Text');
		textElement.style.display = 'inline';
	}

	function hideText() {
		var textElements = document.querySelectorAll('#control span');
		textElements.forEach(function(element) {
			element.style.display = 'none';
		});

	}
</script>
<!-- 페이징 -->
<script>
    var sliderContent = document.getElementById('slider-content');
    var slideWidth = document.querySelector('.slide').offsetWidth;
    var currentIndex = 0;

    function slideNext() {
        currentIndex = (currentIndex + 3) % sliderContent.children.length;
        updateSlider();
    }

    function slidePrev() {
        currentIndex = (currentIndex - 5 + sliderContent.children.length) % sliderContent.children.length;
        updateSlider();
    }

    function updateSlider() {
        var transformValue = -1 * currentIndex * slideWidth + 'px';
        sliderContent.style.transform = 'translateX(' + transformValue + ')';
    }
    function startAutoSlide() {
        intervalId = setInterval(slideNext, 5000);//5초
    }

    function stopAutoSlide() {
        clearInterval(intervalId);
    }

    startAutoSlide();
</script>
 <!-- 페이징 -->

</html>
