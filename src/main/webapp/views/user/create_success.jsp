<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- <link href="../../resources/css/user/create_result.css" rel="stylesheet" type="text./css"> -->

<style>
    body {
        font-family: 'Jua', sans-serif;
        text-align: center;
        background-color: #f5f5f5;
    }
    #section_wrap {
        background: white;
        width: 360px;
        margin: 100px auto;
        padding: 20px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
    }
    .word {
        margin-bottom: 20px;
    }
    .other a {
        display: inline-block;
        background: #ff5722;
        color: white;
        text-decoration: none;
        padding: 10px 20px;
        border-radius: 5px;
    }
    .other a:hover {
        background: #e64a19;
    }
</style>
</head>
<body>
	<%-- <%@ include file ="../include/header.jsp" %>
	<%@ include file ="../include/loginHeader.jsp" %> --%>
	<%-- <%@ include file="../include/nav.jsp" %> --%>
	<%-- <%@ include file="../include/loginNav.jsp" %> --%>
	<%@ include file ="../include/new_header.jsp" %>
	<section>
		<div id="section_wrap">
			<div class="word">
			<h3>회원가입에 성공하였습니다. 로그인해주세요.</h3>
				
			</div>
			<div class="other">
				<a href="/user/login">로그인</a>
			</div>
		</div>
	</section>
</body>
</html>