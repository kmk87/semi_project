<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link href='../../resources/css/user/login.css' rel="stylesheet" type="text/css">
<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../include/nav.jsp" %>
	<section>
		<div id="section_wrap">
			<div class="word">
				<h2>로그인 화면</h2>
			</div>
			<div class="login_form">
				<form action="/user/loginEnd" method="post" name="login_Form">
					<label for="user_id">아이디 </label><br>
					<input type="text" id="user_id" name="user_id" required placeholder=" 아이디를 입력해주세요."><br>
					<label for="user_pw">비밀번호 </label><br>
					<input type="password" id="user_pw" name="user_pw" required placeholder=" 비밀번호를 입력해주세요."><br>
					<input type="checkbox">
					<button onclick="autoLogin();">자동로그인</button><br>
					<input type="checkbox">
					<button onclick="saveId();">아이디저장</button><br>
					<button onclick="loginBtn();">로그인</button><br>
					<input type="reset" value="초기화">
				</form>
			</div>
			<div class="find_id_create_account">
				<a href="#">아이디 찾기</a>
			</div>
			<div class="find_password_create_account">
				<a href="#">비밀번호 찾기</a>
				<a href="<c:url value='user/create'/>">회원 가입</a>
			</div>
		</div>
	
	</section>
	<script>
		function loginForm(){
			let form = document.login_form;
			if(form.user_id.value == ''){
				alert("아이디를 입력하세요");
				form.user_id.focus();
			} else if(form.user_pw.value == ''){
				alert("비밀번호를 입력하세요");
				form.user_pw.focus();
			} else{
				form.submit();
			}
		}
		function idPwFail(){
			let failView = document.getElementById('idPwFail');
			let loginId = document.getElementByID('user_id').value;
			let loginPw = document.getElementById('user_pw').value;
			
				if()
			
		}
		
		
		function loginFail(){
			
			
		}
		
		
		// 자동로그인
		//쿠키 저장 함수
		function setCookie(name, value, expiredays) {
		    var todayDate = new Date();
		    todayDate.setDate(todayDate.getDate() + expiredays);
		    document.cookie = name + "=" + escape(value) + "; path=/; expires="
		        + todayDate.toGMTString() + ";"
		}
		//쿠키 불러오기 함수
		function getCookie(name) {
		    var search = name + "=";
		    if (document.cookie.length > 0) { // 어떤 쿠키라도 있다면
		        offset = document.cookie.indexOf(search);
		        if (offset != -1) { // 쿠키 존재 시 
		            offset += search.length; // 첫번째 값의 인덱스 셋팅 
		            end = document.cookie.indexOf(";", offset); // 마지막 쿠키 값의 인덱스 셋팅
		            if (end == -1)
		                end = document.cookie.length;
		            return unescape(document.cookie.substring(offset, end));
		        }
		    }
		}

		 function loginBtn() {
		        if(document.loginForm.autoLogin.checked === true) { //자동로그인 체크시
		        	//"autoLogin"이라는 키 값에 "Y" 값 셋팅
		            setCookie("autoLogin", "Y", 30); 
		            //"id"라는 키 값에 form에 입력한 아이디 값 셋팅
		            setCookie("id", document.loginForm.userId.value, 30);
		            //"password"라는 키 값에 form에 입력한 비밀번호 값 셋팅
		            setCookie("password", document.loginForm.password.value, 30);
		        } else { //자동로그인 체크 해제시
		        	//쿠키 값 제거
		            setCookie("autoLogin", "Y", 0);
		           	//아이디 저장 클릭 시 
		            if (document.loginForm.saveId.checked === true) { // 아이디 저장을 체크 하였을때
		                setCookie("id", document.loginForm.userId.value, 30); 
		            } else { // 아이디 저장을 체크 하지 않았을때
		                setCookie("id", document.loginForm.userId.value, 0); //날짜를 0으로 저장하여 쿠키삭제
		            }
					//비밀번호 저장 클릭 시
		            if(document.loginForm.savePassword.checked === true) {
		                setCookie("password", document.loginForm.password.value, 30);
		            } else {
		                setCookie("password", document.loginForm.password.value, 0);
		            }
		        }
				//로그인 실행
		        document.loginForm.method="post";
		        document.loginForm.action="url지정";
		        document.loginForm.submit();
		    }
	
	</script>
	
	
</body>
</html>