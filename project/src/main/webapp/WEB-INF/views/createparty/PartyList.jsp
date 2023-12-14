<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>watchaPartyselect</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script type="text/javascript">
		function check_box(){
			if (document.getElementById('agree_box').checked == false) {
				alert("항목을 체크하세요");
				document.watchaPartyselect.no.focus();
			} else {
				location.href='payinfo?seq=${seq}&session=${member.email}';
			}
		}
</script>

<link href="resources/css/styles.css" rel="stylesheet" />
<script type="text/javascript" src="resources/js/logincheck.js"></script>
</head>
<body style="background-color: white; margin-top: 150px; display: flex; justify-content: center; align-items: center;">
	<c:import url="../main/header.jsp" />
	<form action="watchaPartyselect" method="get" name="watchaPartyselect">
	
		<table>
			<tr>
				<td colspan="3" style="border-bottom: 1px solid black; width: 700px;">${selectPartylist.title }</td>
			</tr>
			<tr>
				<td rowspan="2">
					<c:if test="${selectPartylist.service eq 'watcha' }">
						<img src="resources/assets/img/watcha.png" width="80" height="100" style="width: 150px;"/>
					</c:if>
					<c:if test="${selectPartylist.service eq 'netflix' }">
						<img src="resources/assets/img/netflix.png" width="80" height="100" style="width: 150px;"/>
					</c:if>
					<c:if test="${selectPartylist.service eq 'youtube' }">
						<img src="resources/assets/img/youtube.png" width="80" height="100" style="width: 150px;"/>
					</c:if>
				</td>					
				<td>
					<a>${selectPartylist.service}</a>
				</td>
			</tr>
			<tr>
				<td>
					${selectPartylist.partyday }
				</td>
				<td>
					파티 인원 : ${PeopleList } / ${selectPartylist.peoplecnt }
				</td>
			</tr>
			<tr>
				<td>
					<img src="resources/assets/img/crown.png" width="30" height="30"> ${mv.nickname}
				</td>
				<td>
					${mv. tier } 등급
				</td>
				<td>
					비용 : ${selectPartylist.price } 원
				</td>
			</tr>
			<tr>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<th colspan="3">1인회선</th>
			</tr>
			<tr>
				<th colspan="3">1인1기기등록</th>
			</tr>
			<tr>
				<th colspan="3">공유금지</th>
			</tr>
			<tr>
				<th colspan="3">개인사정환불불가</th>
			</tr>
			<tr>
				<th colspan="3">계정양도불가</th>
			</tr>
			<tr>
				<th colspan="3"><input type="checkbox" id="agree_box" value="동의" /> 동의</th>
			</tr>
			<tr>
				<th>&nbsp;</th>
			</tr>
			<tr>
				<th colspan="3">
				<input type="button" name="pay" onclick="check_box()" value="결제" style="width: 200px; height: 50px; font-size: 15px; color: white; background-color: #CA226B;"/> &nbsp; &nbsp; &nbsp;
				<input type="button" value="목록" style="width: 200px; height: 50px; font-size: 15px;" onclick="location.href='/'" /> </th>
        	</tr>
        </table>
        
	</form>
</body>
</html>