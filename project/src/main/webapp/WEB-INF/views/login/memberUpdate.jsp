<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script type="text/javascript">
function userCheck(){
	   var IMP = window.IMP;
	   IMP.init("imp40114442");
	   IMP.certification({
	      pg : "danal",
	      merchant_uid : "",
	      m_redirect_url : "https://e707-123-142-55-115.ngrok-free.app",
	      popup : true
	      },function(rsp){
	         if(rsp.success){
	        	 url: "{https://e707-123-142-55-115.ngrok-free.app/updateClientDate}", 
	             method: "POST",
	             headers: { "Content-Type": "application/json" },
	             data: { imp_uid: rsp.imp_uid }
	            alert("인증이 완료되었습니다");
	         }else{
	            alert("인증에 실패했습니다. 에러 내용 : " + rsp.error_msg);
	         }
	      });
	  
	}
</script>
</head>
<body>
	<h2>수정</h2>
	<%-- <p>${loginModify.name}</p> --%>

	<form action="updateClientDate" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="seq" value="${member.seq}" /></td>
				<td><input type="hidden" name="pw" value="${member.pw}" /></td>
				<td><input type="hidden" name="kakaoid"
					value="${member.kakaoid}" /></td>
				<td><input type="hidden" name="role" value="${member.role}" /></td>
			</tr>
			<div>
				<tr>
					<td>아이디 :<input type="text" name="id" value="${member.id}"
						readonly /></td>
				</tr>
				<tr>
					<td>비밀번호 :<input type="text" name="pw" maxlength="20" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인:<input type="text" name="pw" maxlength="20" /></td>
				</tr>
			</div>
			<tr>
				<td>휴대폰 번호 :<input type="text" name="tel" value="${member.tel}" />
					<button type="button" id="check" onclick="userCheck()">본인인증</button>
				</td>
			</tr>

			<tr>
				<td>이름 :<input type="text" name="name" value="${member.name}" /></td>
			</tr>
			<tr>
				<td>닉네임 :<input type="text" name="nickname"
					value="${member.nickname}" /></td>
			</tr>
			<tr>
				<td>주소 :
					<div class="textForm">
						<input type="text" id="addr" name="addr" value="${addr[0]}"	placeholder="우편번호" readonly>
							 <input type="text" id="addr1" name="addr1" value="${addr[1]}" placeholder="주소" readonly> 
							<input type="button" onclick="checkAddress()" value="우편번호 찾기"><br> 
							<input type="text" id="addr2" name="addr2" value="${addr[2]}" placeholder="상세주소">
					</div>
				</td>
			</tr>
			<tr>
				<td>가입날짜 :<input type="text" name="birth"
					value="${member.birth}" /></td>
			</tr>
			<tr>
				<td>e-mail :<input type="text" name="email"
					value="${member.email}" /></td>
			</tr>
			<tr>
				<td><input type="button" value="취소"
					onclick="location.href='../createParty/getmypage'" />&nbsp; <input
					type="submit" value="완료" onclick="register()" /></td>
				<!-- onclick="register()" -->
			</tr>
		</table>
	</form>
</body>

<script type="text/javascript">
function checkAddress() {
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addr').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
    	/* new daum.Postcode({
			oncomplete : function(data) {
				var addr = "";
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("#addr").val(data.zonecode);
				$("#addr1").val(addr);
				// 커서를 상세주소 필드로 이동한다.
				$("#addr2").focus();
			}
		}).open();
} */
	 function register() {
		addr = $("#addr").val();
		addr1 = $("#addr1").val();
		addr2 = $("#addr2").val();
		addr = addr + "/" + addr1 + "/" + addr2;
		$("#addr").val(addr);
		updateClientDate.submit();
		var strMessage="수정 되었습니다";
		alert(strMessage);
	} 
</script>
</html>