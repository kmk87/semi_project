<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href='../../resources/css/user/login.css' rel="stylesheet" type="text/css">

<!-- <script src="https://code.jquery.com/jquery-3.6.0.js"></script> -->
</head>
<body>
	<%-- <%@ include file ="../include/header.jsp" %>
	<%@ include file ="../include/loginHeader.jsp" %> --%>
	<%-- <%@ include file="../include/nav.jsp" %> --%>
	<%-- <%@ include file="../include/loginNav.jsp" %> --%>
	<%@ include file ="../include/new_header.jsp" %>
	
	<section>
		<div class="login-container" id="section_wrap" style="margin: 330px auto 0">
			<div class="word">
				<h2>로그인 화면</h2>
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
				<a href="/user/findIdPass">아이디 찾기</a>
				<a href="#">비밀번호 찾기</a>
				<a href="/user/create">회원 가입</a>
				<%-- <a href="<c:url value='user/create'/>">회원 가입</a> --%>
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

        /* function setCookie(name, value, expiredays) {
            var todayDate = new Date();
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
        }

        function getCookie(name) {
            var search = name + "=";
            if (document.cookie.length > 0) { 
                offset = document.cookie.indexOf(search);
                if (offset != -1) { 
                    offset += search.length; 
                    end = document.cookie.indexOf(";", offset);
                    if (end == -1)
                        end = document.cookie.length;
                    return unescape(document.cookie.substring(offset, end));
                }
            }
        }
        window.onload = function() {
            let savedId = getCookie("id");
            if(savedId) {
                document.getElementById("user_id").value = savedId;
                document.getElementById("saveId").checked = true;
            }
        }
         */
        
    </script>
</body>
</html>