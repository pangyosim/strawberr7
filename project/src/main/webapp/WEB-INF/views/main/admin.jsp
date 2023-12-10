<!-- main/admin.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>admin</title>
<style>
    .hidden {
        display: none;
    }
    
    
    .member {
        border: 1px solid #000;  // 테두리 추가.
        margin-bottom: 10px;  // 밑에 여백을 추가
    }
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

function loadMemberInfo() {
    $.ajax({
        url: 'admin/memberInfo',
        type: 'GET',
        success: function(data) {
            var memberInfoDiv = $('#memberInfo');
            memberInfoDiv.empty();
            $.each(data, function(index, member) {
            	 var memberDiv = $('<div class="member"></div>');  
                 memberDiv.append('<p>멤버 seq : ' + member.seq + '</p>');
                 memberDiv.append('<p>멤버 kakaoid : ' + member.kakaoid + '</p>');
                 memberDiv.append('<p>멤버 pw : </p>"' + member.pw +'" <input type="text" value="' + member.pw +'" </input>');
                 memberDiv.append('<p>멤버 name : </p>"' + member.name + '" <input type="text" value="' + member.name + '" </input>');
                 memberDiv.append('<p>멤버 nickname: </p>"' + member.nickname + '" <input type="text" value="' + member.nickname + '" </input>');
                 memberDiv.append('<p>멤버 role : </p>"' + member.role + '" <input type="text" value="' + member.role + '" </input>');
                 memberDiv.append('<p>멤버 tel : </p>"' + member.tel + '" <input type="text" value="' + member.tel + '" </input>');
                 memberDiv.append('<p>멤버 addr : </p>"' + member.addr + '" <input type="text" value="' + member.addr + '" </input>');
                 memberDiv.append('<p>멤버 birth : </p>"' + member.birth + '" <input type="text" value="' + member.birth + '" </input>');
                 memberDiv.append('<p>멤버 email : </p>"' + member.email + '" <input type="text" value="' + member.email + '"</input><');
                 memberDiv.append('<p>멤버 tier : </p>"' + member.tier + '" <input type="text" value="' + member.tier + '"</input><br/>');
                 var updateButton = $('<button>수정</button>');  // 수정 버튼을 생성합니다.
                 updateButton.click(function() {
                     updateMember(member.seq);  // 수정 버튼을 클릭하면 updateMember 함수를 호출합니다.
                 });
                 memberDiv.append(updateButton);  // 수정 버튼을 div에 추가합니다.

                 var deleteButton = $('<button>삭제</button>');  // 삭제 버튼을 생성합니다.
                 deleteButton.click(function() {
                     deleteMember(member.seq);  // 삭제 버튼을 클릭하면 deleteMember 함수를 호출합니다.
                 });
                 memberDiv.append(deleteButton);  // 삭제 버튼을 div에 추가합니다.

                 memberInfoDiv.append(memberDiv);  
                // 여기에 멤버의 나머지 정보를 추가하세요.
            });
        },
        error: function(request, status, error) {
            alert('멤버 정보를 가져오는 데 실패했습니다.');
        }
    });
}
function updateMember(seq) {
    // 멤버 정보를 수정하는 코드를 작성하세요.
  	console.log("멤버수정")
}

function deleteMember(seq) {
    // 멤버 정보를 삭제하는 코드를 작성하세요.
  	console.log("멤버삭제")
}




</script>




</head>
<body style="text-align: center;">
	<a href="/">메인</a>
	<div style="border: 1px solid gray;">
	    <h1 onclick="toggleVisibility('adminInfo')">어드민 정보</h1>
	    <div id="adminInfo" class="hidden">
	        <p>어드민 이름 : ${member.name }</p>
	        <p>어드민 카카오ID : ${member.kakaoid }</p>
	        <p>어드민 닉네임 : ${member.nickname }</p>
	        <p>어드민 이름 : ${member.name }</p>
	        <p>어드민 권한 : ${member.role }</p>
	        <p>어드민 휴대폰 : ${member.tel }</p>
	        <p>어드민 주소 : ${member.addr }</p>
	        <p>어드민 생일 : ${member.birth }</p>
	        <p>어드민 이메일 : ${member.email }</p>
	        <p>어드민 티어 : ${member.tier }</p>
	    </div>	
	</div>
	<div style="border: 1px solid gray;">
	    <h1 onclick="toggleVisibility('memberInfo')">멤버 정보</h1>
	    <div id="memberInfo" class="hidden">
	    </div>
	
	</div>
<script type="text/javascript">

function toggleVisibility(id) {
    var element = document.getElementById(id);
    if (element.style.display === "none") {
        element.style.display = "block";
        // 멤버 정보 섹션을 표시하는 경우에만 멤버 정보를 불러옵니다.
        if (id === 'memberInfo') {
            loadMemberInfo();
        }
    } else {
        element.style.display = "none";
    }
}



</script>
</body>
</html>