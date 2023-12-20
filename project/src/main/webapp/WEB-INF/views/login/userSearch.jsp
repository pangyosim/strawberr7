<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/styles.css" rel="stylesheet" />
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   function search_check(num) {
      if (num == '1') {
         document.getElementById("searchP").style.display = "none";
         document.getElementById("searchI").style.display = "";
      } else {
         document.getElementById("searchI").style.display = "none";
         document.getElementById("searchP").style.display = "";
      }
   }

   // 아이디 & 스토어 값 저장하기 위한 변수
   var idV = "";
   // 아이디 값 받고 출력하는 ajax
   var idSearch_click = function() {
      var uname = document.getElementById('name');
      if (uname.value == '') {
         alert('이름을 입력해주세요.');
         uname.focus();
         return false;
      }
      var utel = document.getElementById('tel');
      if (utel.value == '') {
         alert('전화번호를 입력해주세요.');
         utel.focus();
         return false;
      }
      $.ajax({
         type : "POST",
         url : "${pageContext.request.contextPath}/login/userSearch?name="
               + $('#name').val() + "&tel=" + $('#tel').val(),
         success : function(data) {
            if (data == null) {
               $('#class').text("회원 정보를 확인해주세요!");
            } else {
               $('#class').text(data)
               // 아이디값 별도로 저장
               openPopup();
            }
         }
      });
   }
   function openPopup() {
      $("#popup").show(); // 팝업 표시
      $("body").append('<div class="backon"></div>'); // 배경 오버레이 추가
   }

   function closePopup() {
      $("#popup").hide(); // 팝업 숨기기
      $(".backon").remove(); // 배경 오버레이 제거
   }
</script>
<style type="text/css">
body{
   width: 800px;
   text-align: center;
   font-size: 25px;
   margin: 200px auto;
   padding: 50px;
   box-shadow: 2px 3px 5px 0px;
}
.form-group input{
   width: 320px;
   height: 50px;
   border-radius: 10px;
   font-size: 16px;
   margin-bottom: 10px;
   border: 1px solid black;
}

.mail_input input{
   width: 180px;
   height: 50px;
   border-radius: 10px;
   font-size: 16px;
   margin-bottom: 10px;
   border: 1px solid black;

}
.idForm input{
   width: 375px;
   height: 50px;
   border-radius: 10px;
   font-size: 16px;
   margin-bottom: 10px;
   border: 1px solid black;
}
.mail_number input{
   width: 287px;
   height: 50px;
   border-radius: 10px;
   font-size: 16px;
   margin-bottom: 10px;
   border: 1px solid black;
}
.popup-content input{
   width: 375px;
   height: 50px;
   border-radius: 10px;
   font-size: 16px;
   margin-bottom: 10px;
   border: 1px solid black;
}
#popup2{
   padding: 30px;
}
.parent {
   position: static;
   display: flex;
   flex-direction: column;
   padding: 50px;
}
.custom {
   position: relative; 
   left: 50%; 
   top: 50%; 
   transform: translate(-50%, -50%);
   color: black;
}
.custom-control{
   color: #C1AEEE;
   font-size: 10;
   margin: 0;
   
}

div#pwdShow1, div#pwdShow2{
   position: absolute;
   display: none;
   margin-left: -70px;
   margin-top: 13px;
   font-size: 15px;
    color: gray;
}
</style>
</head>
<body>
<c:import url="../main/header.jsp"/>
   <div class="first">
   <div class="parent">
   <div class="custom">
      <input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
      <label class="custom-control" for="search_1">아이디 찾기</label>
      <input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
      <label class="custom-control" for="search_2">비밀번호 찾기</label>
   </div>
   </div>
   <div id="searchI">
      <div class="form-group">
         <div>
            <input type="text" class="form-control" id="name" name="name" placeholder="NAME">
         </div>
      </div>
      <br/>
      <div class="form-group">
         <div>
            <input type="text" class="form-control" id="tel" name="tel"   placeholder="010-1234-5678">
         </div>
      </div>
      <br/>
      <div class="form-group" style="">
         <button id="searchBtn" type="button" onclick="idSearch_click()"   class="btn btn-primary btn-block">확인</button>
      </div>
      <div id="popup" style="display: none;">
         <div class="popup-content">
            <p id="class"></p>
            <button onclick="closePopup()">닫기</button>
         </div>
      </div>
   </div>
   <div id="searchP" style="display: none;">
      <div class="idForm">
         <div>
            <input type="text" class="form-control" id="id_val" name="id_val" placeholder="ID">
         </div>
      </div>
      <br/>
      <div class="mail_input" id="mail_input" name="mail_input">
         <input type="text" class="mail" name="mail" id="mail" placeholder="Email" maxlength="20" />@ <select class="domain"
            id="domain" name="domain">
            <option value="none">---이메일---</option>
            <option value="naver.com">naver.com</option>
            <option value="gmail.com">gmail.com</option>
            <option value="daum.net">daum.net</option>
            <option value="nate.com">nate.com</option>
         </select>
         <button type="button" id="sendBtn" name="sendBtn"
            onclick="sendNumber()">인증번호</button>
      </div>
      <br />
      <div class="mail_number" id="mail_number" name="mail_number" style="display: none">
         <input type="text" name="number" id="number" placeholder="인증번호 입력" />
         <button type="button" name="confirmBtn" id="confirmBtn" onclick="confirmNumber()">이메일 인증</button>
      </div>
      <br/> 
      <input type="text" id="Confirm" name="Confirm" style="display: none" value="" />
      <div id="popup2" style="display: none;">
         <div class="popup-content">
            <form action="changePwResult" method="post">
               <div class="main">
                  <input type="hidden" id="umail" name="umail" value=""/> 
                  <input type="password" placeholder="비밀번호" id="changePw" name="changePw"/>
                  <div id="pwdShow1">SHOW</div><br/>
                  <input type="password" placeholder="비밀번호 확인" id="changePwdConfirm" name="changePwdConfirm"/>
                  <div id="pwdShow2">SHOW</div>
               </div>
               <button type="submit" onclick="check()">확인</button>
            </form>
         </div>
      </div>
      <script type="text/javascript">
         function sendNumber() {
            var mailf = document.getElementsByClassName('mail')[0];
            var maill = document.getElementsByClassName('domain')[0];
            if (mailf.value == '' || maill.value == 'none') {
               alert('이메일을 입력해주세요.');
               return false;
            }
            var email = mail_input + "@" + domain;
            var exptext = /^[\w]([-_.]?[\w])*@[\w]([-_.]?[\w])*\.[a-zA-Z]{2,3}$/i;
            if (!exptext.test(email)) {
               $("#mail_number").css("display", "block");
               $.ajax({
                  url : "mail",
                  type : "post",
                  dataType : "json",
                  data : {
                      "mail" : $("#mail").val() + "@" + $("#domain").val()
                  },
                  //mail:email,
                  success : function(data) {
                     alert("인증번호 발송");
                     $("#Confirm").attr("value", data);
                     var umail = $("#mail").val() + "@" + $("#domain").val();
                     document.getElementById("umail").value = umail;
                  }
               });
            } else {
               alert("이메일 형식이 올바르지 않습니다");
            }
         }
         function confirmNumber() {
            var number1 = $("#number").val();
            var number2 = $("#Confirm").val();

            if (number1 == number2) {
               alert("인증되었습니다");
               openPopup2();
            } else {
               alert("번호가 다릅니다")
            }
         }
         
         $("#changePw").on("keyup", function(event) {
              if (event.keyCode === 13) {
                event.preventDefault();
                $(".w-btn w-btn-gra3 w-btn-gra-anim").triggerHandler("click");
              } else {
                if (this.value) {
                  $("#pwdShow1").css("display", "inline-block");
                } else {
                  $("#pwdShow1").hide();
                }
              }
            }).focus();

            $("#pwdShow1").on("click", function() {
              if ($("#changePw").attr("type") == "password") {
                $("#changePw").attr("type", "text");
                $($(this)).text("H I D E");
              } else {
                $("#changePw").attr("type", "password");
                $($(this)).text("SHOW");
              }
            });
            
         $("#changePwdConfirm").on("keyup", function(event) {
              if (event.keyCode === 13) {
                event.preventDefault();
                $(".w-btn w-btn-gra3 w-btn-gra-anim").triggerHandler("click");
              } else {
                if (this.value) {
                  $("#pwdShow2").css("display", "inline-block");
                } else {
                  $("#pwdShow2").hide();
                }
              }
            }).focus();

            $("#pwdShow2").on("click", function() {
              if ($("#changePwdConfirm").attr("type") == "password") {
                $("#changePwdConfirm").attr("type", "text");
                $($(this)).text("H I D E");
              } else {
                $("#changePwdConfirm").attr("type", "password");
                $($(this)).text("SHOW");
              }
            });
         
         function openPopup2() {
            $("#popup2").show(); // 팝업 표시
            $("body").append('<div class="backon"></div>'); // 배경 오버레이 추가
         }

         function closePopup2() {
            $("#popup2").hide(); // 팝업 숨기기
            $(".backon").remove(); // 배경 오버레이 제거
         }
         
         function check() {
            // 비밀번호
            var changePw = document.getElementById('changePw');
            if (changePw.value == '') {
               alert('비밀번호를 입력해주세요.');
               changePw.focus();
               return false;
            }

            // 비밀번호 확인
            var changePwdConfirm = document
                  .getElementsByName('changePwdConfirm')[0];
            if (changePwdConfirm.value == '') {
               alert('비밀번호 확인을 입력해주세요.');
               changePwConfirm.focus();
               return false;
            }
         }
      </script>
   </div>
   </div>
</body>
</html>