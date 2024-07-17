<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="../../resources/css/user/create.css" rel="stylesheet">
</head>
<body>
	<%@ include file ="../include/header.jsp" %>
	<%@ include file ="../include/loginHeader.jsp" %>
	<%-- <%@ include file="../include/nav.jsp" %> --%>
	<%-- <%@ include file="../include/loginNav.jsp" %> --%>
	<section>
		<div id="section_wrap">
			<div class="word">
				<h3>회원가입</h3>
				<br>
				<!-- <span>※아이디는 추후에 수정할 수 없습니다.
				<br>신중하게 선택해주세요.</span> -->
			</div><br>
			<div class="create_account_form">
				<form name="create_account_form" action="/user/createEnd" method="post">
					<!-- <label for="user_name">이름</label>
					<input type="text" name="user_name" placeholder="이름"> <br> -->
					<label for="user_id">아이디</label>
					<input type="text" id="user_id" placeholder="영문6글자이상 10자이하">
					<button type="button" onclick="idCheck();" id="idBoxBottomRight" disabled>중복확인</button>
					<div id="idCheckBox"></div>
					<!-- 아이디 중복 체크 여부  -->
					<input type="hidden" name="idDuplication" value="idUncheck"/>
					<div id="idCheckBox"></div><br>
					<label for="user_pw">비밀번호</label>
					<input type="password" name="user_pw" id="user_pw" placeholder="비밀번호"> <br>
					<label for="user_pw_check">비밀번호 확인</label>
					<input type="password" name="user_pw_check" id="user_pw_check" placeholder="비밀번호 확인"> <br>
					<label for="user_nick">닉네임</label>
					<input type="text" id="user_nick" >
					<button onclick="nickCheck();" id="nickBoxBottomRight" disabled>중복확인</button>
					<div id="nickCheckBox"></div><br><br>
					<label for="user_email">이메일</label>
					<input type="email" name="user_email" id="user_email"><br>
					<label for="email_check">인증번호</label>
					<input type="text" name="email_check" id="email_check" placeholder="인증번호 6자리입력"> <br>
					<label for="user_address">주소</label>
					<!-- <input type="text" id="sample6_postcode" id="user_address" placeholder="우편번호"> -->
					<input type="text" id="user_address" value="주소찾기 클릭"><br>
					
					
					<input type="button" value="회원가입" onclick="createUserForm();"><br>
					<input type="reset" value="초기화">
				</form>
			</div>
			<div class="login">
				<a href="/user/login">로그인</a>
			</div>
		</div>
	</section>	
	
	<script>
	
	const contextPath = '<%= request.getContextPath() %>';
		
	// 아이디, 닉네임 중복확인 버튼관련,사용자가 입력을 환료한 후에 버튼 활성화
	document.getElementById("user_id").addEventListener("input", function() {
	    document.getElementById("idBoxBottomRight").disabled = this.value.length < 6 || this.value.length > 10;
	});

	document.getElementById("user_nick").addEventListener("input", function() {
	    document.getElementById("nickBoxBottomRight").disabled = this.value.length < 2;
	});
		
	// 아이디 중복확인
		document.getElementById("idBoxBottomRight").addEventListener("click", function() {
    const mid = document.getElementById("user_id").value;
    $.ajax({
        type: 'GET',
        url: contextPath + '/IdcheckServlet?user_id=' + mid,
        success: function(result){
            if(result == 1){
                $('#idCheckBox').text("사용가능한 아이디입니다.");
                $('#idCheckBox').css("color","blue");
            } else {
                $('#idCheckBox').text("이미 사용중인 아이디입니다.");
                $('#idCheckBox').css("color","red");
            }
        },
        error: function(request, status, error){
            console.log(request.status);
            console.log(request.responseText);
            console.log(error);
        }
    }); 
});

		// 닉네임 중복확인
		
		
	/* const nickDoubleCheckBtn = document.getElementById("nickBoxBottomRight"); */
		
		
	document.getElementById("nickBoxBottomRight").addEventListener("click", function() {
			const mnick = $("#user_nick").val();
			$.ajax({
				type : 'GET',
				url : contextPath + '/NickcheckServlet?user_nick=' + mnick,
				success : function(result){
					if(result == 1){
						$('#nickCheckBox').text("사용가능한 아이디입니다.");
						$('#nickCheckBox').css("color","blue");
					
					}else {
						$('#nickCheckBox').text("이미 사용중인 아이디입니다.");
						$('#nickCheckBox').css("color","red");
					}
				},
				error : function(request, status, error){
					console.log(request.status);
					console.log(request.responseText);
					console.log(error);
				}
			
			
				});	
			});
		
		
		function createUserForm(){
			
		
			const form = document.create_account_form;
			
			if(!form.user_id.value){
				alert("아이디를 입력하세요.");
				form.user_id.focus();
			
				 //form.user_id.value -> 비어있는 문자열 -> false -> ! -> true
				
			} else if(!form.user_pw.value){
				alert("비밀번호를 입력하세요");
				form.user_pw.focus();
				// 정규식으로 특수문자 , 비밀번호 몇자이상 ->사용가능
				
			} else if(!form.user_pw_check.value){
				alert("비밀번호 확인을 입력하세요.")
				form.user_pw_check.focus();
				
			} else if(form.user_pw.value != form.user_pw_check.value){
				alert("비밀번호가 일치하는지 확인하세요.");
				form.user_pw.focus();
				
			} else if(!form.user_nick.value){
				alert("닉네임을 입력하세요.");
				form.user_name.focus();
				
			} else if(!form.user_email.value){
				alert("이메일을 입력하세요.");
				form.user_email.focus();
				
			} else if(!form.email_check.value){
				alert("인증번호을 입력하세요.");
				form.email_check.focus();
				
			}else if(!form.user_address.value){
		        alert("주소를 입력하세요.");
		        form.user_address.focus();
		    } else {
				form.submit();
			}
		}
	
		
	</script>
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("user_address").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("user_address").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>

</html>



<!-- 현재 문제점 -->
<!-- 아이디 입력할 때 중복확인 버튼 활성화 안됌 -> 입력하면 버튼 활성화되게 해놓음 -->
<!-- 중복확인이 되는지 확인이 안되는 상황... -->
<!-- 입력하지 않은 내용이 있음에도 회원 가입이 완료됨 -->

