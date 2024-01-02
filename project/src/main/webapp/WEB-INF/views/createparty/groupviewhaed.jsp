<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>이미지 슬라이더</title>
    <style>
    </style>
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
	width: 200px;
	height: 90px;
	display: inline-block;
	background-color: white;
	text-align: center;
	line-height: 10px;
    }
    .slide p {
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    margin: 0;
    padding: 5px; /* 더 나은 모양을 위해 패딩 추가 */
	}
    .slider-button {
        margin-top:10px;
        position: absolute;
        top: 70px;
        transform: translateY(-50%);
        font-size: 18px;
        color: #fff;
        border: none;
        padding: 10px 10px;
        cursor: pointer;
        background-color: rgba(0,0,0,0.4);
        border-radius: 25px; /* 둥근 모양을 위해 추가한 속성 */
    }

	#prev-button {
	    left: 9px;
	}
	
	#next-button {
	    right: 9px;
	}
	/*  */
	/* 제목조정 */
	
	
</style>
<!-- 제목조정 -->
<style type="text/css">

</style>
</head>
<body>
<div class="srd">
	<div id="slider-container">
		<div id="slider-content">
			<c:forEach var="allgroup" items="${groupList}">
			<tr>
			<td class="table-aell">
			<div class="slide">
			<c:choose>
				<c:when test="${allgroup.service eq 'watcha'}">
					<img
						src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MTBfOTgg%2FMDAxNjE4MDU5OTE1NTM2.AOxOQcKyyzrt_TRrIJZU5nnRhfxAKaXOoiDGLzlu6TEg.QEyFA8tkSHP3szin0jvk6zVmh4PXNs7sawhrPxYylp0g.PNG.sunjoon12%2Fwatcha%25A3%25DFlogo%25A3%25DF1611108610.png&type=sc960_832"
						style="width: 80px; height: 80px"
						onclick="location.href='PartyList?seq=${allgroup.seq}'" />
					<P>[${allgroup.service}]</P>
					<p>제목 :${allgroup.title}</p>
					<p>인원 :${allgroup.peoplecnt}명</p>
					<p>기간 :${allgroup.partyday} 개월</p>
					<p>${allgroup.partydate}</p>
				</c:when>
				<c:when test="${allgroup.service eq 'youtube'}">
					<img src="https://cdn-icons-png.flaticon.com/512/3128/3128307.png"
						style="width: 80px; height: 80px"
						onclick="location.href='PartyList?seq=${allgroup.seq}'" />
					<P>[${allgroup.service}]</P>
					<p>제목 :${allgroup.title}</p>
					<p>인원 :${allgroup.peoplecnt}명</p>
					<p>기간 :${allgroup.partyday} 개월</p>
					<p>${allgroup.partydate}</p>
				</c:when>
				<c:when test="${allgroup.service eq 'netflix'}">
					<img
						src="https://cdn.eyesmag.com/content/uploads/posts/2021/12/10/Netflix-launches-website-Tudum-main-765db0bf-51ce-45c0-8a30-e49bd0e6af47.jpg"
						style="width: 80px; height: 80px"
						onclick="location.href='PartyList?seq=${allgroup.seq}'" />
					<P>[${allgroup.service}]</P>
					<p>제목 :${allgroup.title}</p>
					<p>인원 :${allgroup.peoplecnt}명</p>
					<p>기간 :${allgroup.partyday} 개월</p>
					<p>${allgroup.partydate}</p>
				</c:when>
				<c:otherwise>
					<img
						src="https://developer.apple.com/wwdc23/hero/endframes/p3-startframe-large_2x.jpg"
						style="width: 80px; height: 80px"
						onclick="location.href='PartyList?seq=${allgroup.seq}'" />
					<P>[${allgroup.service}]</P>
					<p>제목 :${allgroup.title}</p>
					<p>인원 :${allgroup.peoplecnt}명</p>
					<p>기간 :${allgroup.partyday} 개월</p>
					<p>${allgroup.partydate}</p>
				</c:otherwise>
			</c:choose>
			<br/>
			</div>
		</td>
		</tr>
		</c:forEach>
		</div>
		<button id="prev-button" class="slider-button" onclick="slidePrev()">&#60;</button>
		<button id="next-button" class="slider-button" onclick="slideNext()">&#62;</button>
	</div>
</div>
<!-- 슬라이드끝 -->
<br/>
<br/>
	
	
<!--슬라이드  -->
	<script>
		var sliderContent = document.getElementById('slider-content');
		var slideWidth = document.querySelector('.slide').offsetWidth;
		var currentIndex = 0;

		function slideNext() {
			currentIndex = (currentIndex + 3) % sliderContent.children.length;
			updateSlider();
		}

		function slidePrev() {
			currentIndex = (currentIndex - 5 + sliderContent.children.length)
					% sliderContent.children.length;
			updateSlider();
		}

		function updateSlider() {
			var transformValue = -1 * currentIndex * slideWidth + 'px';
			sliderContent.style.transform = 'translateX(' + transformValue
					+ ')';
		}
		function startAutoSlide() {
			intervalId = setInterval(slideNext, 5000);//5초
		}

		function stopAutoSlide() {
			clearInterval(intervalId);
		}

		startAutoSlide();
	</script>
	<!-- 슬라이드끝 -->



</body>
</html>