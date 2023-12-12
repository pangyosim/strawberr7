<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>수정</h2>
	<%-- <p>${loginModify.name}</p> --%>

	<form action="updateClient" method="post">
		<input type="hidden" name="seq" value="${member.seq }"/>
		<input type="hidden" name="pw" value="${member.pw }"/>
		<input type="hidden" name="name" value="${member.name }"/>
		<input type="hidden" name="kakaoid" value="${member.kakaoid }"/>
		<input type="hidden" name="role" value="${member.role }"/>
		<input type="hidden" name="tier" value="${member.tier }"/>
		<table>
			<tr>
				<td><input type="text" name="id" value="${member.id} " /></td>
			</tr>
			<tr>
				<td><input type="text" name="nickname" value="${member.nickname} " /></td>
			</tr>
			<tr>
				<td><input type="text" name="tel" value="${member.tel} " /></td>
			</tr>
			<tr>
				<td><input type="text" name="addr" value="${member.addr} " /></td>
			</tr>
			<tr>
				<td><input type="text" name="birth" value="${member.birth} " /></td>
			</tr>
			<tr>
				<td><input type="text" name="email" value="${member.email} " /></td>
			</tr>
			<tr>
				<td><input type="button" value="취소" onclick="location.href='../main/index'" />&nbsp;
					<input type="submit" value="완료" />
				</td>

			</tr>
		</table>
	</form>
</body>
</html>