<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.cm.vo.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Share_Life</title>
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
 	<link rel="stylesheet" type="text/css" href="../../resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/normalize.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
<meta charset="UTF-8">
</head>
<body>
<header>

    <div class="container py-2">
        <div class="row py-4 pb-0 pb-sm-4 align-items-center">
            <div class="col-sm-4 col-lg-3 text-center text-sm-start">
                <div class="main-logo">
                    <a href="index.jsp" style="display: flex; align-items: center;">
                        <img src="../../resources/images/집.png" alt="logo" class="img-fluid" style="height: 30px; width: 30px;">
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
            
        <!-- <div id="nav_wrap" class="col-sm-2"> -->
		<%
			User user = (User)session.getAttribute("user");
			if(user == null){
		%>

     	<!-- <div class="menu d-flex align-items-center justify-content-end">
     	<div id="all">  -->    	
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
     				<a href="customer_center.html"> 
     				<span class="fs-6 secondary-font text-muted">고객센터</span> 
     				</a> 
     			</div>
     		</div>
     		<!-- </div> -->
     		
     	<!-- </div> -->
     	<% } else { %>
     	<!-- <div class="menu"> -->
     		<!-- <div class="menu d-flex align-items-center justify-content-end"> -->
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
     		</div>
     	<!-- </div> -->
     	<% } %>
     </div>
     </div>
     
    
    
    <div class="container-fluid">
        <hr class="m-0">
    </div>
    <div class="container">
        <nav class="main-menu d-flex navbar navbar-expand-lg ">
            <div class="d-flex d-lg-none align-items-end mt-3">
                <ul class="d-flex justify-content-end list-unstyled m-0">
                    <li>
                        <a href="account.html" class="mx-3">
                            <iconify-icon icon="token:chat" width="24" height="24"></iconify-icon>
                        </a>
                    </li>
                    <li>
                        <a href="wishlist.html" class="mx-3">
                            <iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
                        </a>
                    </li>
                    <li>
                        <a href="#" class="mx-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSearch"
                           aria-controls="offcanvasSearch">
                            <iconify-icon icon="tabler:search" class="fs-4"></iconify-icon>
                        </a>
                    </li>
                </ul>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                    aria-controls="offcanvasNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                <div class="offcanvas-header justify-content-center">
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body justify-content-between">
                    <a class="nav-link dropdown-toggle" role="button" id="pages" data-bs-toggle="dropdown"
                       aria-expanded="false" style="padding-top: 10px; font-size: 20px;">글쓰기</a>
                    <style>
                        .dropdown_icon {
                            margin-bottom: 5px;
                        }

                        .dropdown-menu {
                            font-size: 20px;
                        }
                    </style>
                    <ul class="dropdown-menu" aria-labelledby="pages">
                        <li>
                            <a href="/views/qboard/create.jsp" class="dropdown-item">
                                <img class="dropdown_icon" src="../resources/images/질문.png">
                                질문 게시글
                            </a>
                        </li>
                        <li>
                            <a href="shop.html" class="dropdown-item">
                                <img class="dropdown_icon" src="../resources/images/판매,나눔.png">
                                판매/나눔 게시글
                            </a>
                        </li>
                        <li>
                            <a href="single-product.html" class="dropdown-item">
                                <img class="dropdown_icon" src="../resources/images/번개.png">
                                번개모임 게시글
                            </a>
                        </li>
                    </ul>
                    <style>
                        .nav-item {
                            padding-left: 50px;
                            font-size: 20px;
                        }
                    </style>
                    <ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
                        <li class="nav-item">
                            <a href="index.jsp" class="nav-link active">Home</a>
                        </li>
                        <li class="nav-item">
                            <a href="/qboard/list" class="nav-link">질문</a>
                        </li>
                        <li class="nav-item">
                            <a href="blog.html" class="nav-link">판매/나눔</a>
                        </li>
                        <li class="nav-item">
                            <a href="contact.html" class="nav-link">번개모임</a>
                        </li>
                    </ul>
                    <div class="d-none d-lg-flex align-items-end">
                        <ul class="d-flex justify-content-end list-unstyled m-0">
                            <li>
                                <a href="account.html" class="mx-3">
                                    <iconify-icon icon="token:chat" width="24" height="24"></iconify-icon>
                                </a>
                            </li>
                            <li>
                                <a href="wishlist.html" class="mx-3">
                                    <iconify-icon icon="mdi:heart" class="fs-4"></iconify-icon>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
    </div> 
    <!-- </div> -->
     <!-- </div> -->
    </header>
     

<script src="js/jquery-1.11.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
<script src="js/plugins.js"></script>
<script src="js/script.js"></script>
<script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>