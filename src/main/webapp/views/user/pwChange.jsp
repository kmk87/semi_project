<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="javax.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<link rel="stylesheet" type="text/css" href="../../resources/css/user/find_pw_success.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
	<div class="container">
           <div class="logo">
                   <img src="../../resources/images/집.png" alt="logo" class="img-fluid" style="height: 30px; width: 30px;">
                   <div style="font-size: 40px; padding-left: 15px; margin-top: 5px;">Share Life</div>
           </div>
	<div class="form-container">
		<form action="/user/pwChangeEnd" method="post">
			<label for="user_id">아이디</label>
			<input type="text" id="user_id" name="user_id" placeholder="아이디를 입력해주세요"><br>
			<label for="user_email">이메일</label>
			<input type="email" id="user_email" name="user_email" placeholder="이메일을 입력해주세요"><br>
			<label for="pwChange">변경비밀번호</label>
			<input type="password" id="pwChange" name="pwChange" placeholder="변경할 비밀번호">
			<button type="submit">변경</button>
			<div class="others">
				<a href='/'>홈으로</a>
				<a href='/user/login'>로그인</a>
			</div>
		</form>
	</div>
</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- <script src="js/jquery-1.11.0.min.js"></script> -->
	<script>
	document.querySelector("form").addEventListener("submit", function(event) {
		event.preventDefault(); // 기본 폼 제출 막기
		const userId = document.getElementById("user_id").value;
	    const userEmail = document.getElementById("user_email").value;
		const checkPw = document.getElementById("pwChange").value;
		$.ajax({
			type : 'POST',
			url : '/user/pwChangeEnd',
			data: {
				 user_id: userId,
		         user_email: userEmail,
		         pwChange: checkPw
			},
			success : function(result){
				if(result.trim() === 'success'){
					alert("비밀번호 변경에 성공하였습니다.");
					/* nickChecked = true; */
					window.location.href = "/views/user_page/userMyPage.jsp";
				
				}else if (result.trim() === "error_same_password") {
	                alert("기존과 동일한 비밀번호입니다.");
	                document.getElementById("pwChange").value = ""; 
	            } else if(result.trim() === "error_failed_to_change"){
	                alert("비밀번호 변경에 실패하였습니다.");
	                //window.location.href = "/views/user/pwChange.jsp";
	            }else {
	                alert("알 수 없는 오류가 발생했습니다.");
	            }
			},
			error : function(request, status, error) {
	            console.error("Error:", status, error);
	            alert("오류가 발생했습니다. 다시 시도해주세요.");
			}
		
		
			});	
		});
	  <%-- <% 
            String successMessage = (String) session.getAttribute("success_message");
	  		String errorMessage = (String) session.getAttribute("error_message");
            if (successMessage != null) { 
                session.removeAttribute("success_message"); // 메시지를 출력한 후 세션에서 제거
        %>
               alert("<%= successMessage %>"); 
        <% 
            }else if (errorMessage != null) {
                session.removeAttribute("error_message");
        %>
        	alert("<%= errorMessage %>");
        <% } %> --%>
    </script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>