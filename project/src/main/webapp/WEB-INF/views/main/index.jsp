<%@page import="com.web.service.PartyService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.web.vo.GroupVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
<script type="text/javascript">
	function watchaPartyList() {
		location.href = "/watchaPartyList?seq=''"
	}
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
    </head>
    <body id="page-top">
    	<c:import url="header.jsp"/>
        <!-- Masthead-->
        <header class="masthead" style="width: 100%; height: 550px; margin-top: 90px;">
        </header>
        <!-- Services-->
        <div class="services" style="margin-left: 150px;">
	      	<h2>최근 만들어진 파티</h2>
		<!-- <input type="button" value="파티만들기 계좌등록" onclick="location.href='groupJoinForm'"/> &nbsp; &nbsp; <input type="button" value="파티찾기" onclick="document.getElementById('party-input').focus()"/> -->
			<table>
				<tr>
					<c:forEach var="party" items="${party }">
						<td><c:if test="${party.service =='watcha'}">
								<img
									src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MTBfOTgg%2FMDAxNjE4MDU5OTE1NTM2.AOxOQcKyyzrt_TRrIJZU5nnRhfxAKaXOoiDGLzlu6TEg.QEyFA8tkSHP3szin0jvk6zVmh4PXNs7sawhrPxYylp0g.PNG.sunjoon12%2Fwatcha%25A3%25DFlogo%25A3%25DF1611108610.png&type=sc960_832"
									style="width: 200px; height: 200px"
									onclick="location.href='watchaPartyList?seq=${party.seq}'">
								<br>[<c:out value="${party.service}" />]<br>
								<c:out value="${party.peoplecnt}" />명<br>
								<c:out value="${party.partyday}" />개월<br>
								<c:out value="${party.partydate}" />
								<br>
							</c:if> <c:if test="${party.service =='youtube'}">
								<img
									src="https://cdn-icons-png.flaticon.com/512/3128/3128307.png"
									style="width: 200px; height: 200px"
									onclick="location.href='youtubePartyList?seq=${party.seq }'">
								<br>[<c:out value="${party.service}" />]<br>
								<c:out value="${party.peoplecnt}" />명<br>
								<c:out value="${party.partyday}" />개월<br>
								<c:out value="${party.partydate}" />
								<br>
							</c:if></td>
					</c:forEach>
				</tr>
			</table>
				
			</div>
			<br/>
		<br/>
        <!-- Party list-->
        <section class="page-section bg-light" id="portfolio">

                    
        </section>
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
				<div class="col-lg-8 mx-auto text-center">
					<p class="large text-muted">Lorem ipsum dolor sit amet,
						consectetur adipisicing elit. Aut eaque, laboriosam veritatis,
						quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p>
				</div>
			</div>
		</div>
	</section>
	<c:import url="footer.jsp"></c:import>
</body>
</html>