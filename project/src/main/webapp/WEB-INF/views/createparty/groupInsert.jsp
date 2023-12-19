<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>groupInsert</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
   integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
   crossorigin="anonymous"></script>
<script type="text/javascript">
   function changeSelect() {
      if ($("#service option:selected").val() == 'youtube') {
         document.getElementById("peoplecnt_max").value = 5;
      } else if ($("#service option:selected").val() == 'netflix') {
         document.getElementById("peoplecnt_max").value = 4;
      } else if ($("#service option:selected").val() == 'watcha') {
         document.getElementById("peoplecnt_max").value = 4;
      } else if ($("#service option:selected").val() == 'tving') {
         document.getElementById("peoplecnt_max").value = 4;
      } else if ($("#service option:selected").val() == 'wavve') {
         document.getElementById("peoplecnt_max").value = 4;
      }
   }

   function calcprice() {
      if ($("#service").val() == 'youtube') {
         document.getElementById("price").value = document
               .getElementById("partyday").value * 14900;
      } else if ($("#service").val() == 'netflix') {
         document.getElementById("price").value = document
               .getElementById("partyday").value * 17000;
      } else if ($("#service").val() == 'watcha') {
         document.getElementById("price").value = document
               .getElementById("partyday").value * 12900;
      } else if ($("#service").val() == 'tving') {
         document.getElementById("price").value = document
               .getElementById("partyday").value * 17000;
      } else if ($("#service").val() == 'wavve') {
         document.getElementById("price").value = document
               .getElementById("partyday").value * 13900;
      }
   }

   document.addEventListener("DOMContentLoaded", function() {
      // Get a reference to your form
      var groupForm = document.getElementById("myForm");

      // Set opacity to 1 after a short delay for the fade-in effect
      setTimeout(function() {
         groupForm.style.opacity = "10";
      }, 100);
   });
</script>
<style type="text/css">
@
keyframes fadeIn {from { opacity:0;
   
}

to {
   opacity: 1;
}

}
body {
   font-family: 'Arial', sans-serif;
   background-color: #f4f4f4;
   margin: 0;
   padding: 0;
   display: flex;
   justify-content: center;
   align-items: center;
   height: 100vh;
}

/* form {
   background-color: #fff;
   padding: 20px;
   border-radius: 8px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   width: 400px;
   text-align: center;
   margin: auto; /* Center the form horizontally 
}
 */
form {
   animation: fadeIn 1s ease-in-out;
   background-color: #fff;
   padding: 20px;
   border-radius: 8px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   width: 800px;
   text-align: center;
   margin: auto; /* Center the form horizontally */
}

h1 {
   color: #333;
}

label {
   display: block;
   margin: 10px 0;
   text-align: left;
}

select, input {
   width: 70%;
   padding: 10px;
   margin-top: 5px;
   margin-bottom: 15px;
   box-sizing: border-box;
   border: 1px solid #ccc;
   border-radius: 4px;
   font-size: 16px;
}

input[type="submit"] {
   background-color: #4caf50;
   color: white;
   padding: 10px 20px;
   font-size: 18px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
}

input[type="submit"]:hover {
   background-color: #45a049;
}

a {
   text-decoration: none;
   color: #333;
   display: block;
   margin-top: 10px;
}

a:hover {
   color: #4caf50;
}
</style>

<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body align="center">
   <c:import url="../main/header.jsp" />
   <form action="groupOk" method="post" id="myform"
      style="margin-top: 150px; ">
      <div style="margin: 0 160px;">
	      <h1>파티 생성</h1>
	      <label for="service">서비스 종류 &nbsp;<!--  <input type="text" id="service" name="service" required><br/> -->
	         <select class="sevice_form" id="service" name="service"
	         onchange="changeSelect()">
	            <option value="" selected disabled>---select---</option>
	            <option value="youtube">youtube</option>
	            <option value="watcha">watcha</option>
	            <option value="netflix">netflix</option>
	            <option value="tving">tving</option>
	            <option value="wavve">wavve</option>
	      </select>
	      </label> <label for="title">파티 제목&nbsp; <input type="text" id="title"
	         name="title" required><br /> <input type="hidden" value="1"
	         name="peoplecnt" id="peoplecnt" />
	      </label> <label for="peoplecnt">파티 인원 &nbsp;<input type="number"
	         id="peoplecnt_max" name="peoplecnt_max" value=" "><br />
	      </label> <label for="userid">공유할 ID &nbsp;<input type="text" id="userid"
	         name="userid" required><br />
       	  </label> <label for="userpw">공유할 PW &nbsp;<input type="text" id="userpw"
	         name="userpw" required><br />
	      </label> <label for="userid">파티장 ID &nbsp;<input type="text"
	         id="partykingid" name="partykingid" value="${member.email }" readonly><br />
	      </label>
	       <label for="partyday">파티 기간&nbsp; 
	          <input type="text" id="partyday" name="partyday" onchange="calcprice()" required><br />
	      </label> 
	      <label for="price">
	         가입 가격&nbsp; <input type="number" id="price" name="price"><br />
	      </label> 
	      <input type="submit" value="그룹 생성" /> <a href="/">메인으로 돌아가기</a>
      </div>
   </form>
   <br />
   <c:import url="../main/footer.jsp" />
</body>
</html>