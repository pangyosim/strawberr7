<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getmypage</title>
	<!--페이징링크  -->
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
	<!-- // -->
<style type="text/css">

		body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .info-box {
            width: 80%;
            max-width: 400px;
            padding: 20px;
            margin: 5px;
            border: 1px solid #black;
            text-align: center;
            background-color: #gray;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
       
        .bottom{
        border-bottom: 2px solid #adadad;
        border-top: 2px solid #adadad;
        padding-top: 20px;
        }
        .bottom nav{
        border-bottom: 2px solid #dcdcdc;
        }
        .info-box div {
            text-align: left;
        }
        .info-box nav {
            text-align: right;
        }
        .info-box input[type="button"],
        .info-box input[type="submit"] {
            background-color: #333;
            color: #fff;
            cursor: pointer;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }
        .info-box input[type="button"]:hover,
        .info-box input[type="submit"]:hover {
            background-color: #555;
        }
        .party-box {
            width: 100%;
            max-width: 400px;
            height: 520px;
            margin-top: 20px;
        }
        .party-nav {
            display: flex;
            justify-content: space-around;
            padding: 10px;
            border-radius: 8px;
            color: #black;
            margin-bottom: 20px;
            
        }
        .party-nav a {
            color: #c0c0c0;
            text-decoration: none;
            cursor: pointer;
            transition: color 0.3s ease-in;
        }

        .party-nav a:hover {
            color: #000;
        }

        .party-content {
            display: none;
        }

        .party-content.active {
            display: block;
            border-top: 2px solid #adadad;
        }

        .box {
            width: 100%;
            font-size: 14px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
            box-sizing: border-box;
            background-color: #f9f9f9;
            border-radius: 8px;
        }

        .swiper {
            width: 100%;
            margin: 10px;
            
        }

        .swiper-slide {
            text-align: center;
            font-size: 14px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        @media (max-width: 760px) {
            .swiper-button-next {
                right: 20px;
                transform: rotate(90deg);
            }

            .swiper-button-prev {
                left: 20px;
                transform: rotate(90deg);
            }
        }
        
        .swiper-wrapper {
		    position: relative;
		    width: 100%;
		    height:80%;
		    z-index: 1;
		    display: flex;
		    transition-property: transform;
		    transition-timing-function: var(--swiper-wrapper-transition-timing-function,initial);
		    box-sizing: content-box;
		}
		.ara{
		text-align: left;
		}
		.ble{
		text-align: right;
		}
</style>

<link href="resources/css/styles.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
</head>
<body>
	<c:import url="../main/header.jsp"/>
 	<div class="info-box">
	    <h3>회원정보</h3><br/>
	    <div class="bottom">
	    	<div>아이디</div><nav>${member.id}</nav>
	        <div>회원등급</div><nav>${member.tier}등급</nav>
	        <div>이름</div>	<nav>${member.name}</nav>
	        <div>이메일</div>	<nav>${member.email}</nav>
	        <div>닉네임</div>	<nav>${member.nickname}</nav>
	        <br/>
	        <br/>
    </div>
        <br>
        <!-- 추가적인 내 정보 표시 -->
        <input type="button" value="정보수정하기" onclick="location.href='memberUpdateForm'"/> &nbsp;
		<input type="button" value="탈퇴하기" onclick="location.href='memberDelete'"/>    
    </div>

	<!-- 파티목록 -->
	<div class="info-box party-box" id="parties">
		<div class="party-nav">
			<a onclick="togglePartyContent('joinList')">참여파티</a>
			<a onclick="togglePartyContent('createList')">생성파티</a>
			<a onclick="togglePartyContent('allGroups')">전체그룹</a>
		</div>
			<div id="joinList" class="party-content active">
					<div class="swiper">
						<div class="swiper-wrapper" style="padding-top: 50px;">
							<table>
								<tbody>
									<c:forEach var="group" items="${joinList}">
									<div class="swiper-slide">
									<div class="box" onclick="location.href='PartyList?seq=${group.seq}'">
											<img
								               src="resources/assets/img/${group.service}.png"
								               style="width: 70px; height: 70px"/>
										<c:if test="${group.peoplecnt == group.peoplecnt_max }">
											<p> 공유한 아이디 : ${group.userid }</p>
											<p> 공유한 비밀번호 : ${group.userpw }</p>
										</c:if>
										<p> ${group.service}</p>
										<p> ${group.peoplecnt} / ${group.peoplecnt_max } 명</p>
										<p> ${group.partyday} 개월</p>
										<p> <fmt:formatDate value="${group.partydate}" pattern="yyyy년 MM월"/>~<fmt:formatDate value="${group.enddate}" pattern="yyyy년 MM월"/></p>
									<!--  -->
									</div>
									</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
					<div class="swiper-button-next"></div>
				   	<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div id="createList" class="party-content">
				<div class="swiper">
						<br><br>
						<div class="swiper-wrapper">
							<table>
								<tbody>
									<c:forEach var="group" items="${mykinglist}">
									<div class="swiper-slide">
									<div class="box" onclick="location.href='PartyList?seq=${group.seq}'">
									<img src="resources/assets/img/crown.png"
										style="width:50px; padding-left: 10px;"/>
										<img
							               src="resources/assets/img/${group.service}.png"
							               style="width: 70px; height: 70px"/>
										<p> ${group.service}</p>
										<p> ${group.peoplecnt} / ${group.peoplecnt_max } 명</p>
										<p> ${group.partyday} 개월</p>
										<p> <fmt:formatDate value="${group.partydate}" pattern="yyyy년 MM월"/>~<fmt:formatDate value="${group.enddate}" pattern="yyyy년 MM월"/></p>
									</div>
									</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
					<div class="swiper-button-next"></div>
				   	<div class="swiper-button-prev"></div>
				</div>
			</div>
			<div id="allGroups" class="party-content">
					<div class="swiper">
						<br><br>
						<div class="swiper-wrapper">
							<table>
								<tbody>
									<c:forEach var="group" items="${groupList}">
										<c:if test="${group.peoplecnt<group.peoplecnt_max}">
											<div class="swiper-slide">
												<div class="box" onclick="location.href='PartyList?seq=${group.seq}'">
													<img
										               src="resources/assets/img/${group.service}.png"
										               style="width: 70px; height: 70px"/>
													<p> ${group.service}</p>
													<p> ${group.peoplecnt} / ${group.peoplecnt_max } 명</p>
													<p> <fmt:formatDate value="${group.partydate}" pattern="yyyy년 MM월"/>~<fmt:formatDate value="${group.enddate}" pattern="yyyy년 MM월"/></p>
													<p> ${group.partyday} 개월</p>
												</div>
											</div>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					<div class="swiper-button-next"></div>
				   	<div class="swiper-button-prev"></div>
				</div>							
			</div>
	<script>
	/* 숨기기 */
	function togglePartyContent(contentId) {
	    var partyContents = document.querySelectorAll('.party-content');
	    var partyNav = document.querySelector('.party-nav');
	    // 모든 파티 내용 숨김
	    partyContents.forEach(function(content) {
	        content.classList.remove('active');
	    });
	    // 클릭된 파티 내용 보이기
	    document.getElementById(contentId).classList.add('active');
	}
	</script>
	<!-- Initialize Swiper -->
	<!-- 페이징 -->
	<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
	<script>
		var swiper = new Swiper('.swiper', {
		  slidesPerView: 3,
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

</body>
</html>