<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	
	<img src="https://www.flaticon.com/kr/free-icons/" >
	<h2>나 혼자 산다</h2>
	<form action="login" method="post" name="loginForm">
	<label for="user_id">아이디 </label><br>
	<input type="text" id="user_id" name="user_id" required placeholder=" 아이디를 입력해주세요."><br>
	<label for="user_pw">비밀번호 </label><br>
	<input type="password" id="user_pw" name="user_pw" required placeholder=" 비밀번호를 입력해주세요."><br>
	<div id="idPwFail" name="idPwFail">
		
	</div>
	<input type="checkbox" id="autoLogin" name="autoLogin">
	<label>자동로그인</label><br>
	<input type="checkbox" id="saveId" name="saveId">
	<label>아이디 저장</label><br>
	<button onclick="loginBtn();">로그인</button><br>
	<a href="#">아이디 찾기</a>
	<a href="#">비밀번호 찾기</a>
	<a href="#">회원 가입</a>
	</form>
	

	
	<script>
		function idPwFail(){
			let failView = document.getElementById('idPwFail');
			let loginId = document.getElementByID('user_id').value;
			let loginPw = document.getElementById('user_pw').value;
			
				if()
			
		}
		
		
		function loginFail(){
			
			
		}
	
	</script>
	
	
</body>
</html>