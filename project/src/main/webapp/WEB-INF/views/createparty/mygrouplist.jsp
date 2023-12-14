<meta charset="UTF-8">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mygrouplist</title>
 <meta name="viewport" content="width=device-width, initial-scale=1" />
  <!-- Link Swiper's CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<style type="text/css">
.box {
    border: 1px solid #dddddd;
    margin: 5px;
    padding: 5px;
    width: 100px; /* 원하는 너비로 조절 */
    height: 400px;
    text-align: center;
}

/* 페이징 */
	body {
      position: relative;
      height: 100%;
    }

    body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color: #000;
      margin: 0;
      padding: 0;
    }

    .swiper {
      width: 100%;
      height: 100%;
    }

    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;
      display: flex;
      flex-direction:column;
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
/*  */
.container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }
/* 페이징 */
 
    
</style>


		
</head>
<body>
	
	<h2>리스트Test</h2>
	<div class="swiper">
		<div class="swiper-wrapper">
			<table border="1">
				<tbody>
					<c:forEach var="group" items="${groupList}">
						<div class="swiper-slide">
							<!-- <div class="box"> -->
							<c:choose>
								<c:when test="${group.service eq 'watcha'}">
								<img
					               src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MTBfOTgg%2FMDAxNjE4MDU5OTE1NTM2.AOxOQcKyyzrt_TRrIJZU5nnRhfxAKaXOoiDGLzlu6TEg.QEyFA8tkSHP3szin0jvk6zVmh4PXNs7sawhrPxYylp0g.PNG.sunjoon12%2Fwatcha%25A3%25DFlogo%25A3%25DF1611108610.png&type=sc960_832"
					               style="width: 200px; height: 200px"
					               onclick="location.href='watchaPartyList?
					               seq=${group.seq}'">
								<p>service: ${group.service}</p>
								<p>peoplecnt: ${group.peoplecnt} 명</p>
								<p>partyday: ${group.partyday} 개월</p>
								<p>partydate: ${group.partydate}</p>
								<%-- <p>seq: ${group.seq}</p> --%>
								<%-- <p>title: ${group.title}</p> --%>
								<%-- <p>userid: ${group.userid}</p> --%>
								<%-- <p>price: ${group.price}</p> --%>
								</c:when>
								<c:when test="${group.service eq 'youtube'}">
								<img
					               src="https://cdn-icons-png.flaticon.com/512/3128/3128307.png"
					               style="width: 200px; height: 200px"
					               onclick="location.href='youtubePartyList?seq=${group.seq }'">
								<p>service: ${group.service}</p>
								<p>peoplecnt: ${group.peoplecnt} 명</p>
								<p>partyday: ${group.partyday} 개월</p>
								<p>partydate: ${group.partydate}</p>
								<%-- <p>seq: ${group.seq}</p> --%>
								<%-- <p>title: ${group.title}</p> --%>
								<%-- <p>userid: ${group.userid}</p> --%>
								<%-- <p>price: ${group.price}</p> --%>
								</c:when>
								<c:otherwise>
								<img
					               src="https://blog.kakaocdn.net/dn/Jgxnb/btqw56PjzYB/pZK3AC37DKeKgFhXeGROJ0/img.jpg"
					               style="width: 200px; height: 200px"
					               onclick="location.href='youtubePartyList?seq=${group.seq }'">
								<p>service: ${group.service}</p>
								<p>peoplecnt: ${group.peoplecnt} 명</p>
								<p>partyday: ${group.partyday} 개월</p>
								<p>partydate: ${group.partydate}</p>
								
								</c:otherwise>
							</c:choose>
							<!-- </div> -->
						</div>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="swiper-button-next"></div>
    	<div class="swiper-button-prev"></div>
	</div>
  
	<!--  -->
	
	<!-- 페이징 처리 -->
	<!-- Swiper JS -->
  <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

  <!-- Initialize Swiper -->
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

</body>
</html>