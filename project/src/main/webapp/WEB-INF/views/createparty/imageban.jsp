<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
background-color: black;
color: white; 
}
 #visual {
      border: 1px solid white;
      width: 1000px; 
      margin: 0 auto;
      position: relative;
  }

#pic {
    height: 500px; 
    overflow: hidden;
    position: relative;
}

#pic div {
    width: 100%; 
    height: 100%; 
    position: relative;
}

#pic a {
 display: block;
 position: absolute;
}

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
<h3> 메인 이미지 테스트용</h3>
		<div id="control">
		<a href="#" onclick="currentSlide(1)"><img src="https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png" alt="netflix"/>
		<span>Netflix</span>
		</a>
        <a href="#" onclick="currentSlide(2)"><img src="https://tonkit360.com/wp-content/uploads/2019/10/disney-plus-logo-1547x1030.jpg" alt="disney"/>
        <span>Disney</span>
        </a>
        <a href="#" onclick="currentSlide(3)"><img src="https://www.tving.com/img/tving-favicon-160@3x.png" alt="tiving"/>
        <span>Tiving</span>
        </a>
        <a href="#" onclick="currentSlide(4)"><img src="https://play-lh.googleusercontent.com/7cuI7bdCeZbmc9anRXqpmxZPH92t5NEEbhTnj5by6skhZK_dlUg9kx--gqtLf-8c2K12=w240-h480-rw" 
        alt="wavve"/>
        <span>Wavve</span>
        </a>
		</div>
	<div id="visual">
		<div id="pic">
			<div>
				<a href="#"> <img
					src="https://help.nflxext.com/43e0db2f-fea0-4308-bfb9-09f2a88f6ee4_what_is_netflix_1_en.png" 
					alt="netflix" 
					style="width: 100%; height: 100%; margin-top: 1px" />
				</a>
			</div>
			<div>
				<a href="#"> <img
					src="https://cloudfront-ap-northeast-1.images.arcpublishing.com/chosunbiz/NA5XZ7AUGJB7XG2OZX3MVWBWTQ.jpg" alt="disney"
					style="width: 100%; height: 100%; margin-top: 1px" />
				</a>
			</div>
			<div>
				<a href="#"> <img
					src="https://web-cf-image.cjenm.com/crop/1344x756/public/share/metamng/boards/kr/POSTER_tving.png?v=1659505010" alt="tiving"
					style="width: 100%; height: 100%; margin-top: 1px" />
				</a>
			</div>
			<div>
				<a href="#"> <img
					src="https://www.m-i.kr/news/photo/202203/908194_674287_4254.jpg" 
					alt="wavve" 
					style="width: 100%; height: 100%; margin-top: 1px" />
				</a>
			</div>
		</div>
	</div>
		
	
<!-- javascript -->
<script type="text/javascript">

	var slideIndex = 0;
	var slideInterval = 7000; //7cho
	var intervalId;

	function showSlides() {
		var i;
		var slides = document.getElementById("pic").getElementsByTagName(
				"div");
		var dots = document.getElementById("control").getElementsByTagName(
				"a");

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
		clearInterval(intervalId); // 이미지 전환 간격을 재설정하기 전에 이전의 타이머를 해제합니다.
		slideIndex = n - 1;
		showSlides();
		intervalId = setInterval(showSlides, slideInterval); // 새로운 타이머 설정
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
	<!-- <img src="https://kr.imboldn.com/wp-content/uploads/2022/09/LEGO-Holiday-Main-Street-Set-Main.jpg"
style="width: 100%; height: 550px; margin-top: 90px"/>
<img src="https://e0.pxfuel.com/wallpapers/972/761/desktop-wallpaper-christmas-christmas-lights-christmas-tree-holiday-reindeer-santa-christmas-houses.jpg"
style="width: 100%; height: 550px; margin-top: 90px"/>
<img src="https://www.shinsegaegroupnewsroom.com/wp-content/uploads/2021/12/%EC%A1%B0%EC%84%A0%ED%98%B8%ED%85%94_%EB%B3%B8%EB%AC%B8900.png"
style="width: 100%; height: 550px; margin-top: 90px"/> -->

</body>
</html>