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
    .member, .party, .account, .pay {
        margin-bottom: 10px; 
    }
    form {
    	margin: 0 auto;
		width: 90%;
	}
	table {
  border-collapse: collapse;
  width: auto;
  margin: 1rem auto;
  background-color: white;
}

/* 테이블 행 */
th, td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
  text-align: center;
}

th {
  background-color: #1b1b1b;
  color: #ddd;
}

/* 테이블 올렸을 때 */
tbody tr:hover {
  background-color: #d3d3d3;
  opacity: 0.9;
  cursor: pointer;
}



tr:nth-child(even) {
  background-color: #fff6f6;
}

input {
width: 50px;
}
.buttons {
    margin: 10%;
    text-align: center;
}

.btn-hover {
    width: 100px;
    font-size: 13px;
    font-weight: 600;
    color: #fff;
    cursor: pointer;
    margin: 3px;
    height: 30px;
    text-align:center;
    border: none;
    background-size: 300% 100%;

    border-radius: 50px;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:hover {
    background-position: 100% 0;
    moz-transition: all .4s ease-in-out;
    -o-transition: all .4s ease-in-out;
    -webkit-transition: all .4s ease-in-out;
    transition: all .4s ease-in-out;
}

.btn-hover:focus {
    outline: none;
}


.btn-hover.color {
  background-image: linear-gradient(to right, #29323c, #485563, #2b5876, #4e4376);
  /* 여기에 필요한 기타 스타일 속성 추가 */
}


/* 예시 */
.edit-button, .edit-button-party, .edit-button-account, .edit-button-pay {
    background-image: linear-gradient(to right, #0d6e43, #3f9177, #30dd8a, #2bb673);
}

.delete-button, .delete-button-party, .delete-button-account, .delete-button-pay {
  background-image: linear-gradient(to right, #8f2510, #914159, #b32d05, #b39749);
\
}

input[readonly] {
    background-color: #ccc; /* 회색 배경 */
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>


var table = 99; // 테이블 확인 번호   

var page = 1;  // 초기 페이지 번호
function updatePageNumber() {
    document.getElementById('currentPage').textContent = page;
}

function increasePage() {
    $.ajax({
    	url: 'admin/tableCount?page=' + page + '&table='+ table,
        type: 'GET',
        success: function(data) {
        	console.log(data);
            if (data == 0) {  
                page = 1;  // 페이지 번호를 1로 설정하여 처음 페이지로 돌아갑니다.
            } else { 
                page++;  // 페이지 번호를 증가
            }
            updatePageNumber();  // 페이지 번호를 업데이트 합니다.
            if(table == 0) {
            	loadMemberInfo();  // 페이지 데이터를 불러옵니다.            	
            }
            else if(table == 1){
            	loadPartyInfo()
            }
            else if(table == 2){
            	loadAccountInfo()
            }
            else if(table == 3){
            	loadPayInfo()
            }
        }
    });  
}

function decreasePage() {
    if (page > 1) {
        page--;
        updatePageNumber();  // 페이지 번호를 업데이트 합니다.
        if(table == 0) {
        	loadMemberInfo()        	
        } 
        else if(table == 1){
        	loadPartyInfo()
        }
        else if(table == 2){
        	loadAccountInfo()
        }
        else if(table == 3){
        	loadPayInfo()
        }
    }
}



/* 멤버 */

$(document).on('click', '.edit-button', function() {
    var row = $(this).closest('tr');
    var member = {};

    // 현재 행의 input 필드에서 데이터를 동적으로 가져옵니다.
    row.find('input').each(function() {
        var input = $(this);
        member[input.attr('name')] = input.val();
    });

    // AJAX 요청을 통한 수정 처리
    $.ajax({
        url: 'adminUpdate',
        type: 'POST',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(member), // member 객체를 JSON 문자열로 변환
        success: function(response) {
            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('멤버 정보가 수정되었습니다.');
            loadMemberInfo(); // 멤버 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('멤버 정보 수정에 실패했습니다.');
        }
    });
});

$(document).on('click', '.delete-button', function() {
    var row = $(this).closest('tr');
    var member = {};

    // 현재 행의 seq 필드에서 데이터를 동적으로 가져옵니다.
    member.seq = row.find('input[name="seq"]').val();

    // AJAX 요청을 통한 삭제 처리
    $.ajax({
        url: 'adminDelete',
        type: 'DELETE',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(member), // member 객체를 JSON 문자열로 변환
        success: function(response) {
            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('멤버가 삭제되었습니다.');
            loadMemberInfo(); // 멤버 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('멤버 삭제에 실패했습니다.');
        }
    });
});
function loadMemberInfo() {
	table = 0;
    $.ajax({
        url: 'admin/memberInfo?page=' + page,
        type: 'GET',
        success: function(data) {
            var memberInfoDiv = $('#memberInfo');
            memberInfoDiv.empty();          
            // 페이지 버튼 추가
            var pageButtonsDiv = $('<div></div>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="decreasePage()">페이지 감소</button>');
            pageButtonsDiv.append('<span id="currentPage">' + "[" + page + "]" +'</span>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="increasePage()">페이지 증가</button>');
            memberInfoDiv.append(pageButtonsDiv);
            // 멤버 데이터를 처리하는 부분
                var memberForm = $('<form class="member"></form>'); 
                var memberTable = $('<table></table>');
                memberTable.append('<thead><tr><th>멤버 seq</th><th>멤버 kakaoid</th><th>멤버 id</th><th>멤버 pw</th><th>멤버 name</th><th>멤버 nickname</th><th>멤버 role</th><th>멤버 tel</th><th>멤버 addr</th><th>멤버 birth</th><th>멤버 email</th><th>멤버 tier</th></tr></thead>');
                var tbody = $('<tbody></tbody>'); 
                
                $.each(data, function(index, member) {
                var memberRow = $('<tr></tr>');
                var editButton = $('<button/>', {
                    type: 'button',
                    class: 'btn-hover color-8 edit-button',
                    text: '수정',
                    click: function() { editMember(member); }
                });

                var deleteButton = $('<button/>', {
                    type: 'button',
                    class: 'btn-hover color-8 delete-button',
                    text: '삭제',
                    click: function() { deleteMember(member); }
                });
                memberForm.data('member', member);
                memberTable.append('<tbody><tr><td><input type="text" name="seq" value="' + member.seq + '" readonly></input></td><td><input type="text" name="kakaoid" value="' + member.kakaoid + '" readonly></input></td><td><input type="text" name="id" value="' + member.id + '"></input></td><td><input type="text" name="pw" value="' + member.pw + '"></input></td><td><input type="text" name="name" value="' + member.name + '"></input></td><td><input type="text" name="nickname" value="' + member.nickname + '"></input></td><td><input type="text" name="role" value="' + member.role + '"></input></td><td><input type="text" name="tel" value="' + member.tel + '"></input></td><td><input type="text" name="addr" value="' + member.addr + '"></input></td><td><input type="text" name="birth" value="' + member.birth + '"></input></td><td><input type="text" name="email" value="' + member.email + '"></input></td><td><input type="text" name="tier" value="' + member.tier + '"></input></td><td><button type="button" class="btn-hover color-8 edit-button">수정</button><button type="button" class="btn-hover color-8 delete-button">삭제</button></td></tr></tbody>');
                
                tbody.append(memberRow); // 생성된 로우를 tbody에 추가합니다.
                });
                
                memberTable.append(tbody); // 준비된 tbody를 memberTable에 추가합니다.
                memberForm.append(memberTable);
                memberInfoDiv.append(memberForm);

          
                
          
        },
        error: function(request, status, error) {
            alert('멤버 정보를 가져오는 데 실패했습니다.');
        }
    });
} 

/* 파티 */

$(document).on('click', '.edit-button-party', function() {
    var row = $(this).closest('tr');
    var party = {};

    row.find('input').each(function() {
        var input = $(this);
        party[input.attr('name')] = input.val();
    });
    party['service'] = row.find('select[name="service"]').val();

    // AJAX 요청을 통한 수정 처리
    $.ajax({
        url: 'adminPartyUpdate',
        type: 'POST',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(party), // member 객체를 JSON 문자열로 변환
        success: function(response) {
            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('파티 정보가 수정되었습니다.');
            loadPartyInfo(); // 멤버 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('파티 정보 수정에 실패했습니다.');
        }
    });
});

$(document).on('click', '.delete-button-party', function() {
    var row = $(this).closest('tr');
    var party = {};

    // 현재 행의 seq 필드에서 데이터를 동적으로 가져옵니다.
    party.seq = row.find('input[name="seq"]').val();

    // AJAX 요청을 통한 삭제 처리
    $.ajax({
        url: 'adminPartyDelete',
        type: 'DELETE',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(party), // member 객체를 JSON 문자열로 변환
        success: function(response) {
            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('파티가 삭제되었습니다.');
            loadPartyInfo(); // 멤버 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('파티 삭제에 실패했습니다.');
        }
    });
});
function loadPartyInfo() {
	table = 1;

    $.ajax({
    	url: 'admin/partyInfo?page='+page,
        type: 'GET',
        success: function(data) {
            var partyInfoDiv = $('#partyInfo');
            partyInfoDiv.empty();            
        	// 페이지 버튼 추가
            var pageButtonsDiv = $('<div></div>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="decreasePage()">페이지 감소</button>');
            pageButtonsDiv.append('<span id="currentPage">' + "[" + page + "]" +'</span>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="increasePage()">페이지 증가</button>');
            partyInfoDiv.append(pageButtonsDiv);
            var partyTable = $('<table></table>');
            partyTable.append('<thead><tr><th>파티 seq</th><th>파티 service</th><th>파티 title</th><th>파티 현재인원</th><th>파티 최대인원</th><th>파티 userid</th><th>파티 파티기간</th><th>파티 price</th><th>파티 생성일자</th></tr></thead>');
        	
            
            $.each(data, function(index, party) {
            	var partyForm = $('<form class="party"></form>'); 
            	partyForm.data('party', party);  
                
                var serviceSelect = '<select name="service">'
                    + '<option value="Netflix"' + (party.service === 'Netflix' ? ' selected' : '') + '>Netflix</option>'
                    + '<option value="Youtube"' + (party.service === 'Youtube' ? ' selected' : '') + '>Youtube</option>'
                    + '<option value="Watcha"' + (party.service === 'Watcha' ? ' selected' : '') + '>Watcha</option>'
                    + '<option value="Tving"' + (party.service === 'Tving' ? ' selected' : '') + '>Tving</option>'
                    + '</select>';

                partyTable.append('<tbody><tr><td><input type="text" name="seq" value="' + party.seq + '" readonly></input></td><td>' + serviceSelect + '</td><td><input type="text" name="title" value="' + party.title + '" ></input></td><td><input type="text" name="peoplecnt" value="' + party.peoplecnt + '" ></input></td><td><input type="text" name="peoplemaxcount" value="' + party.peoplemaxcount + '" ></input></td><td><input type="text" name="userid" value="' + party.userid + '" ></input></td><td><input type="text" name="partyday" value="' + party.partyday + '" ></input></td><td><input type="text" name="price" value="' + party.price + '" ></input></td><td><input type="text" name="partydate" value="' + party.partydate + '" ></input></td><td><button type="button" class="btn-hover color-8 edit-button-party">수정</button><button type="button" class="btn-hover color-8 delete-button-party">삭제</button></td></tr></tbody>');

                partyForm.append(partyTable);
                partyInfoDiv.append(partyForm);
            });
        },
        error: function(request, status, error) {
            alert('파티 정보를 가져오는 데 실패했습니다.');
        }
    });
}


/* 계좌 */

$(document).on('click', '.edit-button-account', function() {
    var row = $(this).closest('tr');
    var account = {};

    row.find('input').each(function() {
        var input = $(this);
        account[input.attr('name')] = input.val();
    });
    account['bank'] = row.find('select[name="bank"]').val();

    // AJAX 요청을 통한 수정 처리
    $.ajax({
        url: 'adminAccountUpdate',
        type: 'POST',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(account), // member 객체를 JSON 문자열로 변환
        success: function(response) {
            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('계좌 정보가 수정되었습니다.');
            loadAccountInfo(); // 멤버 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('계좌 정보 수정에 실패했습니다.');
        }
    });
});

$(document).on('click', '.delete-button-account', function() {
    var row = $(this).closest('tr');
    var account = {};

    // 현재 행의 seq 필드에서 데이터를 동적으로 가져옵니다.
    account.seq = row.find('input[name="seq"]').val();

    // AJAX 요청을 통한 삭제 처리
    $.ajax({
        url: 'adminAccountDelete',
        type: 'DELETE',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(account), // member 객체를 JSON 문자열로 변환
        success: function(response) {
            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('계좌가 삭제되었습니다.');
            loadAccountInfo(); // 멤버 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('계좌 삭제에 실패했습니다.');
        }
    });
});
function loadAccountInfo() {
    table = 2;
    $.ajax({
        url: 'admin/accountInfo?page=' + page,
        type: 'GET',
        success: function(data) {
            var accountInfoDiv = $('#accountInfo');
            accountInfoDiv.empty();
            var accountTable = $('<table></table>');
            // 페이지 버튼 추가
            var pageButtonsDiv = $('<div></div>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="decreasePage()">페이지 감소</button>');
            pageButtonsDiv.append('<span id="currentPage">' + "[" + page + "]" +'</span>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="increasePage()">페이지 증가</button>');
            accountInfoDiv.append(pageButtonsDiv);

            accountTable.append('<thead><tr><th>계좌 seq</th><th>계좌 name</th><th>계좌 bank</th><th>계좌 account</th></tr></thead>');
            $.each(data, function(index, account) {
                var accountForm = $('<form class="account"></form>');
                accountForm.data('account', account);

                accountTable.append('<tbody><tr><td><input type="text" name="seq" value="' + account.seq + '" readonly></input></td><td><input type="text" name="name" value="' + account.name + '"></input></td><td><select name="bank"><option value="KB국민은행"' + (account.bank === 'KB국민은행' ? ' selected' : '') + '>KB국민은행</option><option value="신한은행"' + (account.bank === '신한은행' ? ' selected' : '') + '>신한은행</option><option value="우리은행"' + (account.bank === '우리은행' ? ' selected' : '') + '>우리은행</option><option value="하나은행"' + (account.bank === '하나은행' ? ' selected' : '') + '>하나은행</option><option value="KEB하나은행"' + (account.bank === 'KEB하나은행' ? ' selected' : '') + '>KEB하나은행</option><option value="NH농협은행"' + (account.bank === 'NH농협은행' ? ' selected' : '') + '>NH농협은행</option><option value="기업은행"' + (account.bank === '기업은행' ? ' selected' : '') + '>기업은행</option><option value="씨티은행"' + (account.bank === '씨티은행' ? ' selected' : '') + '>씨티은행</option><option value="카카오뱅크"' + (account.bank === '카카오뱅크' ? ' selected' : '') + '>카카오뱅크</option><option value="케이뱅크"' + (account.bank === '케이뱅크' ? ' selected' : '') + '>케이뱅크</option></select></td><td><input type="text" name="account" value="' + account.account + '"></input></td><td><button type="button" class="btn-hover color-8 edit-button-account">수정</button><button type="button" class="btn-hover color-8 delete-button-account">삭제</button></td></tr></tbody>');

                accountForm.append(accountTable);
                accountInfoDiv.append(accountForm);

            });
        },
        error: function(request, status, error) {
            alert('계좌 정보를 가져오는 데 실패했습니다.');
        }
    });
}


/* 결제 */
$(document).on('click', '.edit-button-pay', function() {
    var row = $(this).closest('tr');
    var pay = {};

    row.find('input').each(function() {
        var input = $(this);
        pay[input.attr('name')] = input.val();
    });

    // AJAX 요청을 통한 수정 처리
    $.ajax({
        url: 'adminPayUpdate',
        type: 'POST',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(pay), // pay 객체를 JSON 문자열로 변환
        success: function(response) {
        	console.log(pay);  // 여기에 추가

            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('결제 정보가 수정되었습니다.');
            loadPayInfo(); // 결제 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('결제 정보 수정에 실패했습니다.');
        }
    });
});

$(document).on('click', '.delete-button-pay', function() {
    var row = $(this).closest('tr');
    var pay = {};

    // 현재 행의 seq 필드에서 데이터를 동적으로 가져옵니다.
    pay.seq = row.find('input[name="seq"]').val();
    pay.userid = row.find('input[name="userid"]').val();

    // AJAX 요청을 통한 삭제 처리
    $.ajax({
        url: 'adminPayDelete',
        type: 'DELETE',
        contentType: 'application/json', // 서버에 보내는 데이터의 타입 지정
        data: JSON.stringify(account), // member 객체를 JSON 문자열로 변환
        success: function(response) {
            // 서버로부터 성공적인 응답을 받았을 때의 로직
            alert('결제가 삭제되었습니다.');
            loadPayInfo(); // 멤버 정보를 다시 로드하여 변경사항 반영
        },
        error: function(request, status, error) {
            // 에러 처리 로직
            alert('결제 삭제에 실패했습니다.');
        }
    });
});
function loadPayInfo() {
	table = 3;

 	$.ajax({
    	url: 'admin/payInfo?page='+page,
        type: 'GET',
        success: function(data) {
            var payInfoDiv = $('#payInfo');
            payInfoDiv.empty();
        	
            // 페이지 버튼 추가
            var pageButtonsDiv = $('<div></div>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="decreasePage()">페이지 감소</button>');
            pageButtonsDiv.append('<span id="currentPage">' + "[" + page + "]" +'</span>');
            pageButtonsDiv.append('<button class="btn-hover color" onclick="increasePage()">페이지 증가</button>');
            payInfoDiv.append(pageButtonsDiv);
        	
            $.each(data, function(index, pay) {
                var payForm = $('<form class="pay"></form>'); 
                payForm.data('pay', pay);  
           	
                var payTable = $('<table></table>');

                payTable.append('<thead><tr><th>결제 seq</th><th>결제 userid</th><th>결제 price</th><th>결제 paydate</th><th>결제 imp_uid</th><th>결제 merchant_uid</th><th>결제 result</th></tr></thead>');
            	
                payTable.append('<tbody><tr><td><input type="text" name="seq" value="' + pay.seq + '" readonly></input></td><td><input type="text" name="userid" value="' + pay.userid + '" readonly></input></td><td><input type="text" name="price" value="' + pay.price + '" readonly></input></td><td><input type="text" name="paydate" value="' + pay.paydate + '" readonly></input></td><td><input type="text" name="imp_uid" value="' + pay.imp_uid + '" readonly></input></td><td><input type="text" name="merchant_uid" value="' + pay.merchant_uid + '" readonly></input></td><td><input type="text" name="result" value="' + pay.result + '" ></input></td><td><button type="button" class="btn-hover color-8 edit-button-pay">수정</button><button type="button" class="btn-hover color-8 delete-button-pay">삭제</button></td></tr></tbody>');

                payForm.append(payTable);
                payInfoDiv.append(payForm);
            });
        },
        error: function(request, status, error) {
            alert('결제 정보를 가져오는 데 실패했습니다.');
        }
    });
}


</script>




</head>
<body style="text-align: center;">
	<a href="/" style="text-decoration: none; color: black;">
		<img width="50px" src="https://i.pinimg.com/564x/3a/80/d0/3a80d08597eb583fc0784a694b56169a.jpg" style="no-repeat; opacity : 0.5;">
	<br/>메인
	</a> 
	<div style="border: 1px solid gray;">
	    <h1 onclick="toggleVisibility('adminInfo')">어드민 정보</h1>
	    <div id="adminInfo" class="hidden">
	   		<table>
	   			<thead>
	   				<tr>
	   					<th>이름</th>
	   					<th>카카오ID</th>
	   					<th>닉네임</th>
	   					<th>권한</th>
	   					<th>휴대폰</th>
	   					<th>주소</th>
	   					<th>생일</th>
	   					<th>이메일</th>
	   					<th>티어</th>		
	   				</tr>
	   			</thead>
	   			<tbody>
	   				<tr>
	   					<td>${member.name }</td>
	   					<td>${member.kakaoid }</td>
	   					<td>${member.nickname }</td>
	   					<td>${member.role }</td>
	   					<td>${member.tel }</td>
	   					<td>${member.addr }</td>
	   					<td>${member.birth }</td>
	   					<td>${member.email }</td>
	   					<td>${member.tier }</td>
	   				</tr>
	   			</tbody>
	   		</table>
	    </div>	
	</div>
	
	<div style="border: 1px solid gray; ">
	    <h1 onclick="toggleVisibility('memberInfo')">멤버 정보</h1>
	    <div id="memberInfo" class="hidden">
    </div>
	</div>
	
	<div style="border: 1px solid gray;">
	   <h1 onclick="toggleVisibility('partyInfo')">파티 정보</h1>
		<div id="partyInfo" class="hidden">
		</div>
	</div>
	
	<div style="border: 1px solid gray;">
	   <h1 onclick="toggleVisibility('accountInfo')">계좌 정보</h1>
		<div id="accountInfo" class="hidden">
		</div>
	</div>
	
	<div style="border: 1px solid gray;">
	    <h1 onclick="toggleVisibility('payInfo')">결제 정보</h1>
		<div id="payInfo" class="hidden">
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
     	// 파티 정보 섹션을 표시하는 경우에만 파티 정보를 불러옵니다.
        else if (id === 'partyInfo') {
            loadPartyInfo();
        }
        // 계좌 정보 섹션을 표시하는 경우에만 계좌 정보를 불러옵니다.
        else if (id === 'accountInfo') {
            loadAccountInfo();
        }
        
        // 결제 정보 섹션을 표시하는 경우에만 결제 정보를 불러옵니다.
        else if (id === 'payInfo') {
            loadPayInfo();
        }

    } else {
        element.style.display = "none";
    }
}



</script>
</body>
</html>