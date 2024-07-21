<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<script src="../../resources/js/jquery-1.11.0.min.js"></script>
    <script src="../../resources/js/plugins.js"></script>
    <script src="../../resources/js/script.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/css/normalize.css">
  	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
	<link href='../../resources/css/user/login.css' rel="stylesheet" type="text/css">
</head>
<body>
	<%@ include file ="../include/new_header.jsp" %>
	
	<section>
		<div class="login-container" id="section_wrap" style="margin: 330px auto 0">
			<div class="word">
				<h2>로그인</h2>
			</div>
			<div class="login_form">
				<form action="/user/loginEnd" method="post" name="login_form">
					<label for="user_id">아이디 </label><br>
					<input type="text" id="user_id" name="user_id" required placeholder=" 아이디를 입력해주세요."><br>
					<label for="user_pw">비밀번호 </label><br>
					<input type="password" id="user_pw" name="user_pw" required placeholder=" 비밀번호를 입력해주세요."><br>
					<label>어서오세요! 좋은하루 보내세요.</label><br>
                    
                    
                    
                    <div class="check_btn">
						<button type="button" onclick="loginBtn();">로그인</button>
						<input type="reset" value="초기화">
					</div>
				</form>
			</div>
			<div class="find_id_create_account">
				<a href="/user/findId">아이디 찾기</a>
				<a href="/user/findPw">비밀번호 찾기</a>
				<a href="/user/create">회원 가입</a>
			</div>
		</div>
	
	</section>
	<script>
		function loginBtn(){
			let form = document.login_form;
			if(form.user_id.value == ''){
				alert("아이디를 입력하세요");
				form.user_id.focus();
			} else if(form.user_pw.value == ''){
				alert("비밀번호를 입력하세요");
				form.user_pw.focus();
			} else {
                form.submit();
			}
        }

    </script>
</body>
</html>