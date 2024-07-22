<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/normalize.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
</head>
<style>
		body, html {
        	height: 100%;
        	margin: 0;
        	font-family: 'Jua', sans-serif;
        	display: flex;
        	justify-content: center;
        	align-items: center;
    	}

    	.container {
        	display: flex;
        	flex-direction: column;
        	align-items: center;
        	text-align: center;
    	}
		.form-container {
        	display: flex;
        	flex-direction: column;
        	align-items: center;
        	width: 100%;
        	max-width: 400px;
    	}
        .form-control {
            width: 100%;
        }
        .btn-container {
            display: flex;
            justify-content: space-between;
       	 	width: 100%;
        	margin-top: 20px;
        	
        }
        
        .btn-container .btn {
        	margin: 0 10px; /* 버튼 사이 간격 설정 */
    	}
    
        input[type="email"] {
        	text-transform: none; /* First character should not be uppercase */
    	}
</style>
<body>
    <div class="container mt-5" style="display: flex; justify-content: center; align-items: center;">
        <h2>회원정보 수정</h2>
        <form action="<%=request.getContextPath()%>/user/userInfoChangeEnd" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" id="email" name="email" required autocapitalize="none" autocomplete="off" autocorrect="off" placeholder=" 수정하실 이메일을 입력해주세요.">
            </div>
            <!-- <div class="mb-3">
                <label for="address" class="form-label">주소</label>
                <input type="text" class="form-control" id="address" name="address" required>
            </div> -->
          	<div class="btn-container">
            	<button type="submit" class="btn btn-primary">수정하기</button>
            	<a href="<%=request.getContextPath()%>/" class="btn btn-primary">홈으로</a>
        	</div>
        </form>
    </div>
<script>

		document.getElementById('email').addEventListener('focus', function() {
    		this.placeholder = '';
		});

		document.getElementById('email').addEventListener('blur', function() {
    		if (this.value === '') {
        		this.placeholder = '수정하실 이메일을 입력해주세요.';
    		}
		});

        window.onload = function() {
            let message = '<%= (session.getAttribute("message") != null) ? session.getAttribute("message") : "" %>';
            let error = '<%= (session.getAttribute("error") != null) ? session.getAttribute("error") : "" %>';
            if (message) {
                alert(message);
                <% session.removeAttribute("message"); %>
            }
            if (error) {
                alert(error);
                <% session.removeAttribute("error"); %>
            }
        };
    </script>
<script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/js/plugins.js"></script>
<script src="<%=request.getContextPath()%>/js/script.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>