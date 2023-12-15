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
   <div class="" style="width: 70%; height: 150%; margin-top: 100px; margin-left: 13%; border: 1px solid black; border-radius: 15px">
   		<div class="top-nav" style="margin-left: 45%;">
   			<h1>TOP10</h1>
   			<a>Netflix</a> &nbsp; &nbsp;
   			<a href="#">Whacha</a><br>
   			<div class="top-list" style="margin-left: -10%;">
	   			<c:forEach var="netflix" items="${netflix_list}" varStatus="status">
		   			<img src="${netflix.image}" style="width: 50px; height: 50px;">  			
		   			<a href="${netflix.url }">${netflix.subject }</a>
		   			<br>
		   		</c:forEach>
	   		</div>
	   		
	   		<c:forEach var="whacha" items="${whacha_list}" varStatus="status">
   			<img src="${whacha.image}" style="width: 50px; height: 50px;">  			
   			<a href="${whacha.url }">${whacha.subject }</a>
   			<br>
   			</c:forEach>
   		</div>
   		<br>
   	</div>
   </div>
   
   
   <!-- Services-->
   <div class="services_wrap" style="width: 75%; margin-left: 15%; margin-top: 50px;" >
    <div class="services_div" style="">
   	<h2>최근 만들어진 파티</h2>
<!-- <input type="button" value="파티만들기 계좌등록" onclick="location.href='groupJoinForm'"/> &nbsp; &nbsp; <input type="button" value="파티찾기" onclick="document.getElementById('party-input').focus()"/> -->
		<!-- 페이징 -->
		<div id="slider-container">
			<div id="slider-content">
				<table border="1">
					<tbody>
						<c:forEach var="group" items="${party}">
							<div class="slide">
								<c:choose>
									<c:when test="${group.service != null}">
										<img
											src="resources/assets/img/${group.service }.png"
											style="width: 80px; height: 80px"
											onclick="location.href='PartyList?seq=${group.seq}'" />
										<P>[${group.service}]</P>
										<p>${group.peoplecnt}명</p>
										<p>${group.partyday}개월</p>
										<p>${group.partydate}~</p><br>
										<p>${group.enddate }</p>
									</c:when>
									<c:otherwise>
										<img
											src="https://developer.apple.com/wwdc23/hero/endframes/p3-startframe-large_2x.jpg"
											style="width: 80px; height: 80px"
											onclick="location.href='PartyList?seq=${group.seq}'" />
										<P>[${group.service}]</P>
										<p>${group.peoplecnt}명</p>
										<p>${group.partyday}개월</p>
										<p>${group.partydate}</p>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<button id="prev-button" class="slider-button" onclick="slidePrev()">&#60;</button>
		<button id="next-button" class="slider-button" onclick="slideNext()">&#62;</button>

		<!-- 페이징 -->
		<!-- 파티리스트 -->
	<%-- <table >
		<tr>
			<c:forEach var="party" items="${party }" varStatus="status">
				<c:if test="${party.peoplecnt < party.peoplecnt_max }">
					<td>
						<img src="resources/assets/img/${party.service }.png"
								style="width: 150px; height: 150px"
								onclick="location.href='PartyList?seq=${party.seq }'"><br>
						<br>[<c:out value="${party.service}" />]<br> -->
							<c:out value="${party.peoplecnt}" />명<br>
							<c:out value="${party.partydate}~"/><br>
							<c:out value="${party.enddate}"/><br>
							<c:out value="${party.partyday}" />개월
					</td>
					<td>&nbsp; &nbsp; &nbsp; &nbsp;</td>
				</c:if>
			</c:forEach>
	</table> --%>
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
