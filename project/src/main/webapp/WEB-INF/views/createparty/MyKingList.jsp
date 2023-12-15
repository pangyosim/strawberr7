<meta charset="UTF-8">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mykingList</title>

<style type="text/css">
</style>

</head>
<body>
	<h2>hi</h2>
	<h2>리스트Test</h2>
	<p></p>
	<table border="1">
		<tbody>
			<c:forEach var="group" items="${mykinglist}">
			<div class="swiper-slide">
			<div class="box">
			<img src="https://e7.pngegg.com/pngimages/55/143/png-clipart-crown-crown.png"
				style="width:50px; padding-left: 10px;"/>
				<c:choose>
					<c:when test="${group.service eq 'watcha'}">
					<img
		               src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA0MTBfOTgg%2FMDAxNjE4MDU5OTE1NTM2.AOxOQcKyyzrt_TRrIJZU5nnRhfxAKaXOoiDGLzlu6TEg.QEyFA8tkSHP3szin0jvk6zVmh4PXNs7sawhrPxYylp0g.PNG.sunjoon12%2Fwatcha%25A3%25DFlogo%25A3%25DF1611108610.png&type=sc960_832"
		               style="width: 70px; height: 70px"/>
					<p> ${group.service}</p>
					<p> ${group.peoplecnt} 명</p>
					<p> ${group.partyday} 개월</p>
					<p> ${group.partydate}</p>
					<input type="button" value="파티수정하기" onclick="location.href='groupModify'"/>
					<input type="button" value="파티삭제하기" onclick="location.href='groupdelete'"/> 
					</c:when>
					<c:when test="${group.service eq 'youtube'}">
					<img
		               src="https://cdn-icons-png.flaticon.com/512/3128/3128307.png"
		               style="width: 70px; height: 70px"/>
					<p> ${group.service}</p>
					<p> ${group.peoplecnt} 명</p>
					<p> ${group.partyday} 개월</p>
					<p> ${group.partydate}</p>
					<input type="button" value="파티수정하기" onclick="location.href='groupModify'"/>
					<input type="button" value="파티삭제하기" onclick="location.href='groupdelete'"/> 
					</c:when>
					<c:when test="${group.service eq 'netflix'}">
					<img
		               src="https://cdn.eyesmag.com/content/uploads/posts/2021/12/10/Netflix-launches-website-Tudum-main-765db0bf-51ce-45c0-8a30-e49bd0e6af47.jpg"
		               style="width: 70px; height: 70px"/>
					<p> ${group.service}</p>
					<p> ${group.peoplecnt} 명</p>
					<p> ${group.partyday} 개월</p>
					<p> ${group.partydate}</p>
					<input type="button" value="파티수정하기" onclick="location.href='groupModify'"/>
					<input type="button" value="파티삭제하기" onclick="location.href='groupdelete'"/> 
					</c:when>
					<c:otherwise>
					<img
		               src="https://developer.apple.com/wwdc23/hero/endframes/p3-startframe-large_2x.jpg"
		               style="width: 70px; height: 70px"/>
					<p> ${group.service}</p>
					<p> ${group.peoplecnt} 명</p>
					<p> ${group.partyday} 개월</p>
					<p> ${group.partydate}</p>
					<input type="button" value="파티수정하기" onclick="location.href='groupModify'"/>
					<input type="button" value="파티삭제하기" onclick="location.href='groupdelete'"/> 
					
					</c:otherwise>
				</c:choose>
			</div>
			</div>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>

</body>
</html>