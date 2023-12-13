<%@page import="com.web.service.PartyService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.vo.GroupVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<script type="text/javascript">
	function watchaPartyList() {
		location.href = "/watchaPartyList?seq=''"
	}
	$(document).ready(function(){
		  $('.services_div').slick();
		});
</script>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>MAIN</title>
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
<c:import url="header.jsp"/>
   <!-- Masthead-->
   <header class="" style="width: 100%; height: 550px; margin-top: 90px;">
  		
   </header>
   <!-- Services-->
   <div class="services_wrap">
    <div class="services_div" style="margin-left: 150px;">
   	<h2>최근 만들어진 파티</h2>
	<!-- <input type="button" value="파티만들기 계좌등록" onclick="location.href='groupJoinForm'"/> &nbsp; &nbsp; <input type="button" value="파티찾기" onclick="document.getElementById('party-input').focus()"/> -->
	<table>
		<tr>
			<c:forEach var="party" items="${party }">
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
	</table>
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
    
</html>
