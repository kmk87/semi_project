<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link href="../../resources/css/user/userMyPage.css" rel="stylesheet" type="text/css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" rel="stylesheet">
</head>
<body>
<%-- <%@ include file="/views/include/header2.jsp" %> --%>
  <!-- <header>
    <div class="container py-2">
      <div class="row py-4 pb-0 pb-sm-4 align-items-center">
  
        <div class="col-sm-4 col-lg-3 text-center text-sm-start">
          <div class="main-logo">
            <a href="index.html" style="display: flex; align-items: center;">
              <img src="../resources/css/images/집.png" alt="logo" class="img-fluid" style="height: 30px; width: 30px;">
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
                  d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
              </svg>
            </form>
          </div>
        </div>
        
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
                </span>
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
              .dropdown_icon{
                margin-bottom: 5px;
              }
              .dropdown-menu{
                font-size: 20px;
              }
            </style>
            <ul class="dropdown-menu" aria-labelledby="pages">
              <li>
                <a href="about.html" class="dropdown-item">
                  <img class="dropdown_icon" src="/resources/images/질문.png">
                  질문 게시글
                </a>
              </li>
              <li>
                <a href="shop.html" class="dropdown-item">
                  <img class="dropdown_icon" src="/resources/images/판매,나눔.png">
                  판매/나눔 게시글
                </a>
              </li>
              <li>
                <a href="single-product.html" class="dropdown-item">
                  <img class="dropdown_icon" src="/resources/images/번개.png">
                  번개모임 게시글
                </a>
              </li>
            </ul>
            <style>
              .nav-item{
                padding-left: 50px;
                font-size: 20px;
              }
            </style>
            <ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
              <li class="nav-item">
                <a href="index.html" class="nav-link active">Home</a>
              </li>
              <li class="nav-item">
                <a href="shop.html" class="nav-link">질문</a>
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
  </header>  -->

    <%-- <div class="container">
        <nav class="user-nav">
            <ul>
                <li><a href="/user/profile">프로필</a></li>
                <li><a href="/user/userInfoChange">회원정보수정</a></li>
                <li><a href="/user/userWrite">내가 쓴 글</a></li>
                <li><a href="/user/userReply">내 댓글</a></li>
                <li><a href="/user/userLike">좋아요</a></li>
                <li><a href="/user/userShop">판매/나눔</a></li>
                <li><a href="/user/userMeeting">내 모임</a></li>
            </ul>
        </nav>
        <div class="profile">
            <img src="${pageContext.request.contextPath}/resources/images/profile.png" alt="프로필 사진">
            <h2>코코몽</h2>
            <p>게시글 수: 20 | 댓글 수: 21 | 좋아요: 3</p>
            <p>자바 웹개발 개발자가 되고 싶어요! 자바 웹개발 개발자가 되고 싶어요!</p>
            <button>프로필 설정</button>
        </div>
        <div class="content">
            <div class="section">
                <h3>내가 쓴 글</h3>
                <div class="posts">
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/post1.png" alt="포스트 이미지">
                        <p>유용한 웹서버 소개글</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/post2.png" alt="포스트 이미지">
                        <p>자주 묻는 질문</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/post3.png" alt="포스트 이미지">
                        <p>알고리즘 소개글</p>
                    </div>
                </div>
                <a href="#">더보기</a>
            </div>
            <div class="section">
                <h3>내 판매/나눔 글</h3>
                <div class="posts">
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/item1.png" alt="아이템 이미지">
                        <p>의자</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/item2.png" alt="아이템 이미지">
                        <p>책상</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/item3.png" alt="아이템 이미지">
                        <p>기타</p>
                    </div>
                </div>
                <a href="#">더보기</a>
            </div>
            <button class="member-withdraw">회원탈퇴</button>
        </div>
    </div> --%>
    <header>
    <div class="container py-2">
      <div class="row py-4 pb-0 pb-sm-4 align-items-center">
  
        <div class="col-sm-4 col-lg-3 text-center text-sm-start">
          <div class="main-logo">
            <a href="index.html" style="display: flex; align-items: center;">
              <img src="../resources/css/images/집.png" alt="logo" class="img-fluid" style="height: 30px; width: 30px;">
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
                  d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
              </svg>
            </form>
          </div>
        </div>
        
        <div
          class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
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
                </span>
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
              .dropdown_icon{
                margin-bottom: 5px;
              }
              .dropdown-menu{
                font-size: 20px;
              }
            </style>
            <ul class="dropdown-menu" aria-labelledby="pages">
              <li>
                <a href="about.html" class="dropdown-item">
                  <img class="dropdown_icon" src="/resources/images/질문.png">
                  질문 게시글
                </a>
              </li>
              <li>
                <a href="shop.html" class="dropdown-item">
                  <img class="dropdown_icon" src="/resources/images/판매,나눔.png">
                  판매/나눔 게시글
                </a>
              </li>
              <li>
                <a href="single-product.html" class="dropdown-item">
                  <img class="dropdown_icon" src="/resources/images/번개.png">
                  번개모임 게시글
                </a>
              </li>
            </ul>
            <style>
              .nav-item{
                padding-left: 50px;
                font-size: 20px;
              }
            </style>
            <ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
              <li class="nav-item">
                <a href="index.html" class="nav-link active">Home</a>
              </li>
              <li class="nav-item">
                <a href="shop.html" class="nav-link">질문</a>
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
  </header>

    <div class="container">
        <nav class="user-nav">
            <ul>
                <li><a href="/user/profile">프로필</a></li>
                <li><a href="/user/userInfoChange">회원정보수정</a></li>
                <li><a href="/user/userWrite">내가 쓴 글</a></li>
                <li><a href="/user/userReply">내 댓글</a></li>
                <li><a href="/user/userLike">좋아요</a></li>
                <li><a href="/user/userShop">판매/나눔</a></li>
                <li><a href="/user/userMeeting">내 모임</a></li>
            </ul>
        </nav>
        <div class="profile">
            <img src="${pageContext.request.contextPath}/resources/images/profile.png" alt="프로필 사진">
            <h2>코코몽</h2>
            <p>게시글 수: 20 | 댓글 수: 21 | 좋아요: 3</p>
            <p>자바 웹개발 개발자가 되고 싶어요! 자바 웹개발 개발자가 되고 싶어요!</p>
            <button>프로필 설정</button>
        </div>
        <div class="content">
            <div class="section">
                <h3>내가 쓴 글</h3>
                <div class="posts">
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/post1.png" alt="포스트 이미지">
                        <p>유용한 웹서버 소개글</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/post2.png" alt="포스트 이미지">
                        <p>자주 묻는 질문</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/post3.png" alt="포스트 이미지">
                        <p>알고리즘 소개글</p>
                    </div>
                </div>
                <a href="#">더보기</a>
            </div>
            <div class="section">
                <h3>내 판매/나눔 글</h3>
                <div class="posts">
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/item1.png" alt="아이템 이미지">
                        <p>의자</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/item2.png" alt="아이템 이미지">
                        <p>책상</p>
                    </div>
                    <div class="post">
                        <img src="${pageContext.request.contextPath}/resources/images/item3.png" alt="아이템 이미지">
                        <p>기타</p>
                    </div>
                </div>
                <a href="#">더보기</a>
            </div>
            <button class="member-withdraw">회원탈퇴</button>
        </div>
    </div>
    

<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
