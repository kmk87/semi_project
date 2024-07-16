<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="../../resources/css/user/create.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../include/nav.jsp" %> 
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
					<input type="text" name="user_id" placeholder="영문6글자이상 10자이하">
					<button onclick="idCheck">중복확인</button>
					<!-- 아이디 중복 체크 여부  -->
					<input type="hidden" name="idDuplication" value="idUncheck"/>
					<div id="idCheckBox"></div><br>
					<label for="user_pw">비밀번호</label>
					<input type="password" name="user_pw" placeholder="비밀번호"> <br>
					<label for="user_pw_check">비밀번호 확인</label>
					<input type="password" name="user_pw_check" placeholder="비밀번호 확인"> <br>
					<label for="user_nick">닉네임</label>
					<input type="text" name="user_nick" placeholder="">
					<button onclick="nickCheck">중복확인</button>
					<div id="nickCheckBox"></div><br><br>
					<label for="user_email">이메일</label>
					<input type="email" name="user_email"><br>
					<label for="email_check">인증번호</label>
					<input type="text" name="email_check" placeholder="인증번호 6자리입력"> <br>
					<label for="user_address">주소</label><br>
					<input type="text" id="sample6_postcode" placeholder="우편번호">
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					<input type="text" id="sample6_address" placeholder="주소"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목"><br>
					
					<input type="submit" value="회원가입" onclick="createUserForm();"><br>
					<input type="reset" value="초기화">
				</form>
			</div>
			<div class="login">
				<a href="/user/login">로그인</a>
			</div>
		</div>
	</section>	
	
	<script>
		/* function idCheck(){
			const userId = document.create_account_form.user_id.value;
			const resultBoxId = document.getElementId('idCheckBox');
			if(!userId){
				alert("아이디를 입력하세요.");
				return;
			}
			
			 const xhr = new XMLHTTPRequest();
			xhr.open("GET","/user/idCheck?user_id="+userId,true);
			xhr.onreadystatechange = function(){
				if(xhr.readystate == 4 && xhr.status == 200){
					if(xhr.responseText == "OK"){
						resultBoxId.innerHTML="사용가능한 아이디입니다.";
						//alert("사용가능한 아이디입니다.");
					}else{
						resultBoxId.innerHTML="이미 사용중인 아이디입니다.";
						//alert("이미 사용 중인 아이디입니다.");
						
					}
					
				}
			};
			xhr.send(); 
			function userNameCheck(){
				const username = $("user_id").val();
				if(username === "" || username === null){
					alert('아이디가 입력되지 않았습니다.');
					return;
				}
				
				const user = {username : username}
				
				$.ajax({
					type : "POST",
					url : "/user?cmd=userNameCheck",
					dataType : "text",
					contentType : "application/json",
					data : JSON.stringify(user),
					success : function(data){
						if(data === "ok"){
							alert("사용할 수 있는 아이디입니다.");
							repeatUserNameCheck = true;
							$('#username').attr('readonly', 'readonly');
						}else{
							alert("사용할 수 없는 아이디입니다.");
						}
					},
					error : function(data){
						alert("통신에러:");
					}
				});
						
			}
		} */
	
		/* 중복확인 */
		/* $(function(){
			$("input[name='id']").on("change",function(){
				const s_id = $('#id').val();
				/* alert("입력값 :"+s_id); */
				
				/*$.ajax({
					data : {
						s_id : s_id
					},
					url : "controller",
					success : function(data){
						if(s_id==""){
							/* alert("아이디를 입력해주세요"); 
							$("#text").css("color","gray");
							$("#text").text("아이디를 입력해주세요");
						}else if(data == '0'){
							$("text").css("color","blue");
							$("#text").text("사용가능한 아이디 입니다.");
						} else if(data == "1"){
							$("#text").css("color","red");
							$("#text").text("이미 사용중인 아이디 입니다.");
						}
					},
					error : function(error){
						alert(error);
					}
				});
				
			});
			
			
		});*/
	 
	
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
				
			} else if(!form.user_address.value){
				alert("인증번호을 입력하세요.");
				form.user_address.focus();
				else{
					form.submit();
				}
			}
		}
		
	</script>
	
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
</script>
</html>







