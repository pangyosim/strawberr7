<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 파티 업데이</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<style type="text/css">
	
</style>
</head>
<body>
<c:import url="../main/header.jsp"/>
	<table>
		<tr>
			<td>
				<c:forEach var="party" items="${partylist}">
					<form action="Update" method="post">
						<table>
							<tr>
								<td><input type="hidden" name="seq" value="${party.seq}" />
								</td>
							</tr>
							<tr>
								<td>서비스 :
									<select class="sevice_form" id="service" name="service" onchange="changeSelect()">
										<option value="" selected disabled>---select---</option>
							            <option value="youtube">youtube</option>
							            <option value="watcha">watcha</option>
							            <option value="netflix">netflix</option>
							            <option value="tving">tving</option>
							            <option value="wavve">wavve</option>
							        </select>
								</td>
							</tr>
							<tr>
								<td>제목 :<input type="text"name="title" value="${party.title}" /></td>
							</tr>
							<tr>
								<td>현재 참여중인 인원수 :<input type="text" name="peoplecnt" value="${party.peoplecnt_max}" readonly /></td>
							</tr>
							<tr>
								<td>가격 : <input type="text" name="price" value="${party.price}"/></td>
							</tr>
							<tr>
								<td>이메일 :<input type="text" name="userid" value="${party.userid}" /></td>
							</tr>
						</table>
							<input type="button" value="취소" onclick="location.href='/'" />
							<input type="submit" value="수정" onclick="location.href='Update?seq=${party.seq}'"/>
					</form>
				</c:forEach>
			</td>
		</tr>
	</table> 
</body>
</html>