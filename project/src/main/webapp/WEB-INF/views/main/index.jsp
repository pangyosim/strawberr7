<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<script type="text/javascript">
 function watchaPartyList(){
	 location.href='/watchaPartyList'
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
        <header class="masthead">
            <div class="container">
            
            </div>
        </header>
        <!-- Services-->
        <div class="services" style="text-align: center;">
	      	<h2> 서비스</h2>
			<input type="button" value="파티만들기 계좌등록" onclick="location.href='groupJoinForm'"/> &nbsp; &nbsp; <input type="button" value="파티찾기" onclick="document.getElementById('party-input').focus()"/>
			<br/>
   		</div>
		<br/>
        <!-- Party list-->
        <section class="page-section bg-light" id="portfolio">
                <div class="party-list" style="text-align: center;">
                	<input type="hidden" id="party-input"/>
                    <h2>파티 리스트</h2>
                    <img src="data:image/png;base64,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" 
                    	 onclick="location.href='partydetail'"/>
                    <img src="https://cdn-icons-png.flaticon.com/512/3128/3128307.png" style="width:200px; height:200px" onclick="location.href='youtubePartyList'">
                    <img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MTBfOTgg%2FMDAxNjE4MDU5OTE1NTM2.AOxOQcKyyzrt_TRrIJZU5nnRhfxAKaXOoiDGLzlu6TEg.QEyFA8tkSHP3szin0jvk6zVmh4PXNs7sawhrPxYylp0g.PNG.sunjoon12%2Fwatcha%25A3%25DFlogo%25A3%25DF1611108610.png&type=sc960_832" 
                    	 style="width:200px; height:200px" 
                    	 onclick="watchaPartyList()">
                    <c:forEach var="#" items="#">
                    </c:forEach>
                </div>
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
                    <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
                </div>
            </div>
        </section>
        <c:import url="footer.jsp"></c:import>
    </body>
</html>
