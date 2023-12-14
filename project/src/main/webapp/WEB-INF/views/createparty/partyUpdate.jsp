<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파티업데</title>
<script type="text/javascript">
</script>
</head>
<body>
		<%-- <td><input type="text" value="${partylist}" /></td> --%>
		<%-- <td>${partylist}</td> --%>
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
							<td>서비스 :<input type="text" name="service" value="${party.service}" />
							</td>
						</tr>
						<tr>
							<td>제목 :<input type="text"name="title" value="${party.title}" /></td>
						</tr>
						<tr>
							<td>인원수 :<input type="text" name="peoplecnt" value="${party.peoplecnt}" /></td>
						</tr>
						<tr>
							<td>id :<input type="text" name="userid" value="${party.userid}" /></td>
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