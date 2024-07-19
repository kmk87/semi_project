<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 실패</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
  <link href="../../resources/css/user/login_fail.css" rel="stylesheet" type="text./css">
</head>
<body>
	<%-- <%@ include file ="../include/header.jsp" %>
	<%@ include file ="../include/loginHeader.jsp" %> --%>
	<%-- <%@ include file="../include/nav.jsp" %>
	<%@ include file="../include/loginNav.jsp" %> --%>
	<%@ include file ="../include/new_header.jsp" %>
	<section>
		<div id="secting_wrap">
			<div class="word">
				<h3>로그인에 실패하였습니다.</h3>
				<span>(아이디 또는 비밀번호를 확인해주세요.)</span>
			</div>	
			<div class="others">
				<a href='/user/create'>회원가입</a>
				<a href='/user/login'>로그인</a>
			</div>
		</div>
	
	</section>
	
</body>
</html>