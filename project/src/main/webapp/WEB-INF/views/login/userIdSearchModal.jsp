<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>userIdSearchModal</title>
</head>
<body>
    <div id="background_modal" class="background_modal">
        <div class="modal_contents">
            <h4>
                <b>님 아이디는?</b><span class="close">&times;</span>
            </h4>
            <br>
            <h2 id="id"></h2>
            <br>
            <button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
                <i class="fa fa-envelope"></i>비밀번호 찾기
            </button>
        </div>
    </div>
</body>
</html>
