<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.cm.vo.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
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
 	<link rel="stylesheet" type="text/css" href="../../resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/normalize.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
</head>
<body>
	<header>
    <div class="container py-2">
        <div class="row py-4 pb-0 pb-sm-4 align-items-center">
            <div class="col-sm-4 col-lg-3 text-center text-sm-start">
                <div class="main-logo">
                    <a href="index.jsp" style="display: flex; align-items: center;">
                        <img src="../resources/images/집.png" alt="logo" class="img-fluid" style="height: 30px; width: 30px;">
                        <div style="font-size: 40px; padding-left: 15px; margin-top: 5px;">Share Life</div>
                    </a>
                </div>
            </div>
            <div style="padding-left: 50px;" class="col-sm-6 offset-sm-2 offset-md-0 col-lg-5 d-none d-lg-block">
                <div class="search-bar border rounded-2 px-3 border-dark-subtle">
                    <form id="search-form" class="text-center d-flex align-items-center" action="" method="">
                        <input type="text" class="form-control border-0 bg-transparent"
                               placeholder="통합검색" style="padding-left: 20px; padding-top: 23px;">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                            <path fill="currentColor"
                                  d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z"/>
                        </svg>
                    </form>
                </div>
            </div>
            <%
				User user = (User)session.getAttribute("user");
				if(user == null){
			%>
            <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
                <div class="support-box text-end d-none d-xl-block">
                	<a href="/user/login">
                    <span class="fs-6 secondary-font text-muted">로그인</span>
                    </a>
                </div>
                <div class="support-box text-end d-none d-xl-block">
                	<a href="/user/create">
                    	<span class="fs-6 secondary-font text-muted">회원가입</span>
                    </a>
                </div>
                <div class="support-box text-end d-none d-xl-block">
                    <a href="/customerCenter">
                        <span class="fs-6 secondary-font text-muted">고객센터</span>
                    </a>
                </div>
            </div>
            <% } else { %>
            <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end"> 
     			<div class="support-box text-end d-none d-xl-block"> 
     				<a href="/user/userMyPage">
     				<span class="fs-6 secondary-font text-muted">마이페이지</span>
     				</a>
     			</div>
     			<div class="support-box text-end d-none d-xl-block"> 
     				<a href="/user/logout">
     				<span class="fs-6 secondary-font text-muted">로그아웃</span> 
     				</a>
     			</div>
     			<div class="support-box text-end d-none d-xl-block">
                    <a href="/customerCenter">
                        <span class="fs-6 secondary-font text-muted">고객센터</span>
                    </a>
                </div> 
     		</div>
     	<!-- </div> -->
     	<% } %>
     </div>
     </div>
</header>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12 text-center">
            <h1>사용자 마이페이지</h1>
        </div>
    </div>
    <div class="row mt-4">
        <div class="col-md-3">
            <ul class="nav flex-column nav-pills" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="profile-tab" data-bs-toggle="tab" href="#" role="tab" aria-controls="profile" aria-selected="true">프로필</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="edit-info-tab" data-bs-toggle="tab" href="/user/userInfoChange" role="tab" aria-controls="edit-info" aria-selected="false">회원정보수정</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="edit-info-tab" data-bs-toggle="tab" href="#" role="tab" aria-controls="edit-info" aria-selected="false">내가 쓴 글</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="sales-tab" data-bs-toggle="tab" href="#" role="tab" aria-controls="sales" aria-selected="false">판매/나눔</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="my-meetings-tab" data-bs-toggle="tab" href="#" role="tab" aria-controls="my-meetings" aria-selected="false">내 모임</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link text-danger" id="leave-tab" data-bs-toggle="tab" href="/user/userLeave" role="tab" aria-controls="leave" aria-selected="false">회원탈퇴</a>
                </li>
            </ul>
        </div>
        <div class="col-md-9">
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                    <div class="card">
                        <div class="card-body text-center">
                            <img src="../../resources/images/default-profile.png" alt="프로필 이미지" class="profile-img mb-3">
                            <h2>닉네임</h2>
                            <p>좋아요 3</p>
                            <p>자바 백엔드 개발자가 되고 싶어요!</p>
                            <button class="btn btn-primary">프로필 설정</button>
                        </div>
                    </div>
                </div>
                <!-- 회원정보수정, 내가 쓴 글, 판매/나눔, 내 모임, 회원탈퇴 탭 내용 추가 필요 -->
            </div>
        </div>
    </div>
</div>

</body>
</html>
