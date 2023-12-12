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
        border: 1px solid #000;  
        margin-bottom: 10px; 
    }
    form {
    	margin: 0 auto;
		width: 300px;
	}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
/* 멤버 */
function loadMemberInfo() {
    $.ajax({
    	url: 'admin/memberInfo',
        type: 'GET',
        success: function(data) {
            var memberInfoDiv = $('#memberInfo');
            memberInfoDiv.empty();
            $.each(data, function(index, member) {
            	var memberForm = $('<form class="member"></form>'); 
                memberForm.data('member', member);  // 멤버의 정보를 form의 data 속성에 저장
                memberForm.append('<p>멤버 seq :</p><input type="text" name="seq" value="' + member.seq + '" readonly></input>');
                memberForm.append('<p>멤버 kakaoid :</p><input type="text" name="kakaoid" value="' + member.kakaoid + '" readonly></input>');
                memberForm.append('<p>멤버 id :</p><input type="text" name="id" value="' + member.id + '"></input>');
                memberForm.append('<p>멤버 pw :</p><input type="text" name="pw" value="' + member.pw + '"></input>');
                memberForm.append('<p>멤버 name :</p><input type="text" name="name" value="' + member.name + '"></input>');
                memberForm.append('<p>멤버 nickname:</p><input type="text" name="nickname" value="' + member.nickname + '"></input>');
                memberForm.append('<p>멤버 role :</p><select name="role"><option value="USER"' + (member.role === 'USER' ? ' selected' : '') + '>USER</option><option value="PARTYKING"' + (member.role === 'PARTYKING' ? ' selected' : '') + '>PARTYKING</option><option value="ADMIN"' + (member.role === 'ADMIN' ? ' selected' : '') + '>ADMIN</option></select>');
                memberForm.append('<p>멤버 tel :</p><input type="text" name="tel" value="' + member.tel + '"></input>');
                memberForm.append('<p>멤버 addr :</p><input type="text" name="addr" value="' + member.addr + '"></input>');
                memberForm.append('<p>멤버 birth :</p><input type="text" name="birth" value="' + member.birth + '"></input>');
                memberForm.append('<p>멤버 email :</p><input type="text" name="email" value="' + member.email + '"></input>');
                memberForm.append('<p>멤버 tier :</p><input type="text" name="tier" value="' + member.tier + '"></input>');

                var updateButton = $('</br><input type="submit" value="수정"/>');
                updateButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var memberForm = $(this).closest('form');
                    
                    var member = {
                            seq: memberForm.find('input[name="seq"]').val(),
                            kakaoid: memberForm.find('input[name="kakaoid"]').val(),
                            id: memberForm.find('input[name="id"]').val(),
                            pw: memberForm.find('input[name="pw"]').val(),
                            name: memberForm.find('input[name="name"]').val(),
                            nickname: memberForm.find('input[name="nickname"]').val(),
                            role: memberForm.find('select[name="role"]').val(),
                            tel: memberForm.find('input[name="tel"]').val(),
                            addr: memberForm.find('input[name="addr"]').val(),
                            birth: memberForm.find('input[name="birth"]').val(),
                            email: memberForm.find('input[name="email"]').val(),
                            tier: memberForm.find('input[name="tier"]').val()
                    };                    
                    $.ajax({
                        url: 'adminUpdate',
                        type: 'POST',
                        data: JSON.stringify(member),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("수정");
                        	loadMemberInfo();
                        },
                        error: function(request, status, error) {
                            alert('멤버 정보를 수정하는 데 실패했습니다.');
                        }
                    });
                });
                memberForm.append(updateButton); 

                var deleteButton = $('<input type="submit" value="삭제"/>');
                deleteButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var memberForm = $(this).closest('form');
                    var member = memberForm.data('member');  // form의 data 속성에서 멤버의 정보를 가져옴
                    $.ajax({
                        url: 'adminDelete',
                        type: 'DELETE',
                        data: JSON.stringify(member),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("삭제");
                        	loadMemberInfo();
                        },
                        error: function(request, status, error) {
                            alert('멤버 정보를 삭제하는 데 실패했습니다.');
                        }
                    });
                });
                memberForm.append(deleteButton);

                memberInfoDiv.append(memberForm);
            });
        },
        error: function(request, status, error) {
            alert('멤버 정보를 가져오는 데 실패했습니다.');
        }
    });
} 

/* 파티 */

function loadPartyInfo() {
    $.ajax({
    	url: 'admin/partyInfo',
        type: 'GET',
        success: function(data) {
            var partyInfoDiv = $('#partyInfo');
            partyInfoDiv.empty();
            $.each(data, function(index, party) {
            	var partyForm = $('<form class="party"></form>'); 
            	partyForm.data('party', party);  
            	partyForm.append('<p>파티 seq :</p><input type="text" name="seq" value="' + party.seq + '" readonly></input>');
            	var serviceSelect = '<select name="service">'
                    + '<option value="Netflix"' + (party.service === 'Netflix' ? ' selected' : '') + '>Netflix</option>'
                    + '<option value="Youtube"' + (party.service === 'Youtube' ? ' selected' : '') + '>Youtube</option>'
                    + '<option value="Watcha"' + (party.service === 'Watcha' ? ' selected' : '') + '>Watcha</option>'
                    + '<option value="Tving"' + (party.service === 'Tving' ? ' selected' : '') + '>Tving</option>'
                    + '</select>';

                partyForm.append('<p>파티 service :</p>' + serviceSelect);
                partyForm.append('<p>파티 title :</p><input type="text" name="title" value="' + party.title + '"></input>');
            	partyForm.append('<p>파티 peoplecnt :</p><input type="text" name="peoplecnt" value="' + party.peoplecnt + '"></input>');
            	partyForm.append('<p>파티 userid :</p><input type="text" name="userid" value="' + party.userid + '"></input>');
            	partyForm.append('<p>파티 파티기간:</p><input type="text" name="partyday" value="' + party.partyday + '"></input>');
            	partyForm.append('<p>파티 price :</p><input type="text" name="price" value="' + party.price + '"></input>');
            	partyForm.append('<p>파티 생성일자 :</p><input type="text" name="partydate" value="' + party.partydate + '"readonly></input>');
            	
                var updateButton = $('</br><input type="submit" value="수정"/>');
                updateButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var partyForm = $(this).closest('form');
                    
                    var party = {
                        seq: partyForm.find('input[name="seq"]').val(),
                        service: partyForm.find('select[name="service"]').val(),
                        title: partyForm.find('input[name="title"]').val(),
                        peoplecnt: partyForm.find('input[name="peoplecnt"]').val(),
                        userid: partyForm.find('input[name="userid"]').val(),
                        partyday: partyForm.find('input[name="partyday"]').val(),
                        price: partyForm.find('input[name="price"]').val(),
                        partydate: partyForm.find('input[name="partydate"]').val()
                    };
        
                    $.ajax({
                        url: 'adminPartyUpdate',
                        type: 'POST',
                        data: JSON.stringify(party),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("수정");
                        	loadPartyInfo();
                        },
                        error: function(request, status, error) {
                            alert('파티 정보를 수정하는 데 실패했습니다.');
                        }
                    });
                });
                partyForm.append(updateButton); 

                var deleteButton = $('<input type="submit" value="삭제"/>');
                deleteButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var partyForm = $(this).closest('form');
                    var party = partyForm.data('party');  // form의 data 속성에서 멤버의 정보를 가져옴
                    $.ajax({
                        url: 'adminPartyDelete',
                        type: 'DELETE',
                        data: JSON.stringify(party),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("삭제");
                        	loadPartyInfo();
                        },
                        error: function(request, status, error) {
                            alert('파티 정보를 삭제하는 데 실패했습니다.');
                        }
                    });
                });
                partyForm.append(deleteButton);

                partyInfoDiv.append(partyForm);
            });
        },
        error: function(request, status, error) {
            alert('파티 정보를 가져오는 데 실패했습니다.');
        }
    });
} 

/* 계좌 */

function loadAccountInfo() {
 	$.ajax({
    	url: 'admin/accountInfo',
        type: 'GET',
        success: function(data) {
            var accountInfoDiv = $('#accountInfo');
            accountInfoDiv.empty();
            $.each(data, function(index, account) {
            	var accountForm = $('<form class="account"></form>'); 
            	accountForm.data('account', account);  
            	accountForm.append('<p>계좌 seq :</p><input type="text" name="seq" value="' + account.seq + '" readonly></input>');
            	accountForm.append('<p>계좌 name :</p><input type="text" name="name" value="' + account.name + '" ></input>');
            	accountForm.append('<p>계좌 bank :</p><select name="bank">'
            		    + '<option value="' + account.bank + '" selected>' + account.bank + '</option>'
            		    + '<option value="KB국민은행">KB국민은행</option>'
            		    + '<option value="신한은행">신한은행</option>'
            		    + '<option value="우리은행">우리은행</option>'
            		    + '<option value="하나은행">하나은행</option>'
            		    + '<option value="KEB하나은행">KEB하나은행</option>'
            		    + '<option value="NH농협은행">NH농협은행</option>'
            		    + '<option value="기업은행">기업은행</option>'
            		    + '<option value="씨티은행">씨티은행</option>'
            		    + '<option value="카카오뱅크">카카오뱅크</option>'
            		    + '<option value="케이뱅크">케이뱅크</option>'
            		    + '</select>');
            	accountForm.append('<p>계좌 account :</p><input type="text" name="account" value="' + account.account + '"></input>');
          
                var updateButton = $('</br><input type="submit" value="수정"/>');
                updateButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var accountForm = $(this).closest('form');
                    
                    var account = {
                    		seq: accountForm.find('input[name="seq"]').val(),
                    		name: accountForm.find('input[name="name"]').val(),
                    		bank: accountForm.find('select[name="bank"]').val(),
                    		account: accountForm.find('input[name="account"]').val(),
                  
                    };                    
                    $.ajax({
                        url: 'adminAccountUpdate',
                        type: 'POST',
                        data: JSON.stringify(account),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("수정");
                        },
                        error: function(request, status, error) {
                            alert('계좌 정보를 수정하는 데 실패했습니다.');
                        }
                    });
                });
                accountForm.append(updateButton); 

                var deleteButton = $('<input type="submit" value="삭제"/>');
                deleteButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var accountForm = $(this).closest('form');
                    var account = accountForm.data('account');  // form의 data 속성에서 멤버의 정보를 가져옴
                    $.ajax({
                        url: 'adminAccountDelete',
                        type: 'DELETE',
                        data: JSON.stringify(account),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("삭제");
                        },
                        error: function(request, status, error) {
                            alert('계좌 정보를 삭제하는 데 실패했습니다.');
                        }
                    });
                });
                accountForm.append(deleteButton);

                accountInfoDiv.append(accountForm);
            });
        },
        error: function(request, status, error) {
            alert('계좌 정보를 가져오는 데 실패했습니다.');
        }
    });
} 

/* 결제 */

function loadPayInfo() {
 	$.ajax({
    	url: 'admin/payInfo',
        type: 'GET',
        success: function(data) {
            var payInfoDiv = $('#payInfo');
            payInfoDiv.empty();
            $.each(data, function(index, pay) {
            	var payForm = $('<form class="pay"></form>'); 
            	payForm.data('pay', pay);  
            	payForm.append('<p>결제 seq :</p><input type="text" name="seq" value="' + pay.seq + '" readonly></input>');
            	payForm.append('<p>결제 userid :</p><input type="text" name="userid" value="' + pay.userid + '" ></input>');
            	payForm.append('<p>결제 price :</p><input type="text" name="price" value="' + pay.price + '" ></input>');
            	payForm.append('<p>결제 paydate :</p><input type="text" name="paydate" value="' + pay.paydate + '" ></input>');
            	payForm.append('<p>결제 imp_uid :</p><input type="text" name="imp_uid" value="' + pay.imp_uid + '" ></input>');
            	payForm.append('<p>결제 merchant_uid :</p><input type="text" name="merchant_uid" value="' + pay.merchant_uid + '" ></input>');
            	payForm.append('<p>결제 result :</p><input type="text" name="result" value="' + pay.result + '" ></input>');
            	
                var updateButton = $('</br><input type="submit" value="수정"/>');
                updateButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var payForm = $(this).closest('form');
                    
                    var pay = {
                    		seq: payForm.find('input[name="seq"]').val(),
                    		userid: payForm.find('input[name="userid"]').val(),
                    		price: payForm.find('input[name="price"]').val(),
                    		paydate: payForm.find('input[name="paydate"]').val(),
                    		imp_uid: payForm.find('input[name="imp_uid"]').val(),
                    		merchant_uid: payForm.find('input[name="merchant_uid"]').val(),
                    		result: payForm.find('input[name="result"]').val(),
                  
                    };                    
                    $.ajax({
                        url: 'adminPayUpdate',
                        type: 'POST',
                        data: JSON.stringify(pay),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("수정");
                        },
                        error: function(request, status, error) {
                            alert('결제 정보를 수정하는 데 실패했습니다.');
                        }
                    });
                });
                payForm.append(updateButton); 

                var deleteButton = $('<input type="submit" value="삭제"/>');
                deleteButton.click(function(event) {
                    event.preventDefault();  // form의 기본 제출 동작을 막음
                    var payForm = $(this).closest('form');
                    var pay = payForm.data('pay');  // form의 data 속성에서 멤버의 정보를 가져옴
                    $.ajax({
                        url: 'adminPayDelete',
                        type: 'DELETE',
                        data: JSON.stringify(pay),
                        contentType: 'application/json',
                        success: function(response) {
                        	alert("삭제");
                        },
                        error: function(request, status, error) {
                            alert('결제 정보를 삭제하는 데 실패했습니다.');
                        }
                    });
                });
                payForm.append(deleteButton);

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