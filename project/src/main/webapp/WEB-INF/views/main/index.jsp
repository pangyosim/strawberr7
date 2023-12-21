<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<head>
<meta charset="utf-8" />
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

<style>
.slider_wrap .bx-wrapper {border:0; box-shadow:none;}

ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;
}

ul.tabs li.current{
	color: #222;
}
.tab-content{
	display: none;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
</style>
	<!-- 페이징 -->
<!-- Favicon-->
<!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
 --><!-- Font Awesome icons (free version)-->
<!-- <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
 --><!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<!-- <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
 
</head>
<body>
	<c:import url="header.jsp" />
	
	<!-- TOP10 -->
	<div class="slider_wrap" style=" margin: 120px 35%; height: 40%;">
<!-- 			<h1 style="text-align: center; font-family:sans-serif; font-weight: bold;">Top10</h1>
-->			<ul class="tabs" style="position: relative; text-align: center;">
				<li class="tab-link current" data-tab="tab-1" style="font-family: monospace; font-weight: bold; font-size: 15px; color: #e50a15;">Netflix Top10</li>
				<li class="tab-link" data-tab="tab-2" style=" font-family: monospace; font-weight: bold; font-size: 15px; color: #f30958;">Watcha Top10</li>
			</ul>
			<div class="tab-content current" id="tab-1" style="margin: 0 10%;">
				<div class="slider">
					<c:forEach var="netflix" items="${netflix_list}">
			        		<div><a href="${netflix.url }"><img src="${netflix.image }" style="width: 100%;"></a></div>
			       	</c:forEach>
				</div>
			</div>
			<div class="tab-content" id="tab-2" style="margin: 0 25%;">
				<div class="slider-next">
					<c:forEach var="whacha" items="${whacha_list}">
			        		<div><a href="${whacha.url }"><img src="${whacha.image }" style="width: 100%;"></a></div>
			       	</c:forEach>
				</div>
			</div>
	</div>
	<!-- TOP10 end -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			$('ul.tabs li').click(function(){
				var tab_id = $(this).attr('data-tab');
	
				$('ul.tabs li').removeClass('current');
				$('.tab-content').removeClass('current');
	
				$(this).addClass('current');
				$("#"+tab_id).addClass('current');
				$(".slider-next").bxSlider({
		         	 controls : true,
		              mode: 'horizontal',
		              auto: true,
		              slideWidth: 600,
		              slideHeight: 300,
		              speed: 250,
		              pager: true
		         });
			})
	
		})
	</script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<script>
      $(document).ready(function(){
   	  	$(".slider").bxSlider({
         	 controls : true,
              mode: 'horizontal',
              auto: true,
              slideWidth: 800,
              slideHeight: 800,
              speed: 250,
              pager: true
         });
      });
    </script>
   <!-- Services-->
   <div class="services_wrap" style=" width: 75%; margin-left: 13%; margin-top: 30px; " >
    <div class="services_div" >
    	<div style="margin-bottom: 10px;">
   			<span><a style=" margin-left: 0px; font-family: monospace; font-size: 25px; font-weight: bold;"> &nbsp; &nbsp; 최근 만들어진 파티</a>
   					<a href="groupview" style="text-decoration: none; color: gray; margin-left: 65%;">더보기 &#62;</a></span>
   		</div>
		<!-- 페이징 -->
		<div style="float: left; width: 3%; height: 350px;">
			<button type="button" tabindex="0" style="margin-top: 12vh; background-color:transparent; border: none; font-size: 50px; color: #d3d3d3;
			" onclick="slidePrev()">&#60; &nbsp;</button>
		</div>
		<div style="float: right; width: 9%; height: 350px;">
			<button type="button" tabindex="0" style="margin-top: 12vh; background-color:transparent; border: none; font-size: 50px; color: #d3d3d3;
			" onclick="slideNext()">&#62;</button>
		</div>
		<div id="slider-container" style="width: 87%;">
			<div id="slider-content">
				<table>
					<tbody>
						<c:forEach var="group" items="${party}">
							<c:if test="${group.peoplecnt < group.peoplecnt_max }">
							<div class="slide" style="border: 1px solid #e9e9e9; border-radius: 10px; width: 200px; height: 350px; padding: 20px;" onclick="location.href='PartyList?seq=${group.seq}'">
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
								<P style="font-family: monospace; font-weight: bold;">[${group.service}]</P>
								<p style="font-family: monospace;">${group.peoplecnt}/${group.peoplecnt_max }명</p>
								<p style="font-family: monospace;"><fmt:formatDate value="${group.partydate}" pattern="yyyy년 MM월"/>~</p>
								<p style="font-family: monospace;"><fmt:formatDate value="${group.enddate }" pattern="yyyy년 MM월"/></p>
								<p style="font-family: monospace;">${group.partyday}개월</p>
							</div>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
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
        <c:import url="footer.jsp"></c:import>
    </body>
</html>
