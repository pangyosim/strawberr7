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
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	  <!-- Link Swiper's CSS -->
	  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
	  <!-- Demo styles -->
	  <style>
	    .swiper-wrapper{
	    height:40%;
	    }
		.swiper{
		
		}
		element.style{
		margin-right: 0px;
		}
	    .swiper-slide {
	      font-size: 12px;
	      background: #fff;
	    }
	    
	    @media (max-width: 100px) {
	      .swiper-button-next {
	        transform: rotate(90deg);
	      }
	
	      .swiper-button-prev {
	        transform: rotate(90deg);
	      }
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
<body >
<c:import url="header.jsp"/>
   <!-- Masthead-->
   <!-- 메인 이미지  -->
   <div id="visual" class="" style="width: 50%; height: 100%; margin-top: 100px; margin-left: 13%; border: 1px solid black; border-radius: 15px">
   	<div id="pic">
   		<div class="netflix-top" style="margin-left: 20%;">
   		<h1>Netfilx Top10</h1>
	   		<c:forEach var="netflix" items="${netflix_list}" varStatus="status">
	   			<img src="${netflix.image}" style="width: 50px; height: 50px;">  			
	   			<a href="${netflix.url }">${netflix.subject }</a>
	   			<br>
	   		</c:forEach>
   		</div>
   		<div class="watcha-top" style="margin-left: 20%;">
   		<h1>Whacha Top10</h1>
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
	<!-- Swiper -->
	  <div class="swiper">
					<div class="swiper-wrapper">
						<table border="1">
							<tbody>
								<c:forEach var="group" items="${party}">
									<div class="swiper-slide">
										<div class="box">
											<c:choose>
												<c:when test="${group.service eq 'watcha'}">
												<img
									               src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MTBfOTgg%2FMDAxNjE4MDU5OTE1NTM2.AOxOQcKyyzrt_TRrIJZU5nnRhfxAKaXOoiDGLzlu6TEg.QEyFA8tkSHP3szin0jvk6zVmh4PXNs7sawhrPxYylp0g.PNG.sunjoon12%2Fwatcha%25A3%25DFlogo%25A3%25DF1611108610.png&type=sc960_832"
									               style="width: 80px; height: 80px"
									               onclick="location.href80px='PartyList?seq=${group.seq}'"
									               />
									            <P> [${group.service}]</P>
												<p> ${group.peoplecnt}명</p>
												<p> ${group.partyday} 개월</p>
												<p> ${group.partydate}</p>
												</c:when>
												<c:when test="${group.service eq 'youtube'}">
												<img
									               src="https://cdn-icons-png.flaticon.com/512/3128/3128307.png"
									               style="width: 80px; height: 80px"
									               onclick="location.href='PartyList?seq=${group.seq}'"/>
												<P> [${group.service}]</P>
												<p> ${group.peoplecnt}명</p>
												<p> ${group.partyday} 개월</p>
												<p> ${group.partydate}</p>
												</c:when>
												<c:when test="${group.service eq 'netflix'}">
												<img
									               src="https://cdn.eyesmag.com/content/uploads/posts/2021/12/10/Netflix-launches-website-Tudum-main-765db0bf-51ce-45c0-8a30-e49bd0e6af47.jpg"
									               style="width: 80px; height: 80px"
									               onclick="location.href='PartyList?seq=${group.seq}'"/>
												<P> [${group.service}]</P>
												<p> ${group.peoplecnt}명</p>
												<p> ${group.partyday} 개월</p>
												<p> ${group.partydate}</p>
												</c:when>
												<c:otherwise>
												<img
									               src="https://developer.apple.com/wwdc23/hero/endframes/p3-startframe-large_2x.jpg"
									               style="width: 80px; height: 80px"
									               onclick="location.href='PartyList?seq=${group.seq}'"/>
												<P> [${group.service}]</P>
												<p> ${group.peoplecnt}명</p>
												<p> ${group.partyday} 개월</p>
												<p> ${group.partydate}</p>
												
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</c:forEach>
							</tbody>
						</table>
					</div>
				<div class="swiper-button-next" style="margin-right: 100px"></div>
			   	<div class="swiper-button-prev"></div>
			</div>												
		<!-- 파티리스트 -->
	<%-- <table >
		<tr>
			<c:forEach var="party" items="${party }" varStatus="status">
				<c:if test="${party.peoplecnt < 5 }">
					<td>
						<c:if test="${party.service =='watcha'}">
							<img

								src="resources/assets/img/watcha.png"
								style="width: 200px; height: 200px"

								onclick="location.href='PartyList?seq=${party.seq}'">
							<br>[<c:out value="${party.service}" />]<br>
							<c:out value="${party.peoplecnt}" />명<br>
							<c:out value="${party.partyday}" />개월<br>
							<c:out value="${party.partydate}" />
						</c:if> 
						<c:if test="${party.service =='youtube'}">
							<img

								src="resources/assets/img/youtube.png"
								style="width: 200px; height: 200px"

								onclick="location.href='PartyList?seq=${party.seq }'">
							<br>[<c:out value="${party.service}" />]<br>
							<c:out value="${party.peoplecnt}" />명<br>
							<c:out value="${party.partyday}" />개월<br>
							<c:out value="${party.partydate}" />
						</c:if>
						<c:if test="${party.service =='netflix'}">
							<img
								src="resources/assets/img/netflix.png"
								style="width: 150px; height: 150px"
								onclick="location.href='PartyList?seq=${party.seq }'">
							<br>[<c:out value="${party.service}" />]<br>
							<c:out value="${party.peoplecnt}" />명<br>
							<c:out value="${party.partyday}" />개월<br>
							<c:out value="${party.partydate}" />
						</c:if>
					</td>
				</c:if>
			</c:forEach>
		</tr>
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
<!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
  <script>
    var swiper = new Swiper('.swiper', {
      slidesPerView: 10,
      direction: getDirection(),
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      on: {
        resize: function () {
          swiper.changeDirection(getDirection());
        },
      },
    });

    function getDirection() {
      var windowWidth = window.innerWidth;
      var direction = window.innerWidth <= 760 ? 'vertical' : 'horizontal';

      return direction;
    }
  </script>
 <!-- 페이징 -->

</html>
