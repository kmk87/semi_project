<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Share_Life</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="format-detection" content="telephone=no">
  <meta name="apple-mobile-web-app-capable" content="yes">
  
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
  <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="../resources/css/vendor.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="../resources/css/normalize.css">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
    rel="stylesheet">
  <style>
body {
    margin: 0;
    padding: 0;
}

header {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: relative;
}

.container {
    max-width: 1200px;
    margin:  auto;
    padding:  15px;
}

.center-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    margin: 0 auto;
    max-width: 1200px;
    padding-top: 20px; 
}

.center-table {
    margin: 0 auto;
    text-align: center;
    width: 100%;
}

.center-table thead tr th, .center-table tbody tr td {
    border: 1px solid #e1e1e1;
    padding: 10px 3px;
    background-color: #a5a5a5;
}

.mt-5 {
    margin-top: 3rem !important;
}
.mt-3 {
	text-align:right;
	margin: auto;
}
.board-name{
	 align-items: left;
	 text-align: left;
}
.board-write{
	    align-items: right;
}
  </style>
</head>
<body>
  <header>
    <div class="container py-2">
      <div class="row py-4 pb-0 pb-sm-4 align-items-center">
  
        <div class="col-sm-4 col-lg-3 text-center text-sm-start">
          <div class="main-logo">
            <a href="../../index.jsp" style="display: flex; align-items: center;">
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
                  d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
              </svg>
            </form>
          </div>
        </div>
        
        <div class="col-sm-8 col-lg-4 d-flex justify-content-end gap-5 align-items-center mt-4 mt-sm-0 justify-content-center justify-content-sm-end">
          <div class="support-box text-end d-none d-xl-block">
            <span class="fs-6 secondary-font text-muted">로그인</span>
          </div>
          <div class="support-box text-end d-none d-xl-block">
            <span class="fs-6 secondary-font text-muted">회원가입</span>
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
                <a href="/qboard/create" class="dropdown-item">
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
              .nav-item{
                padding-left: 50px;
                font-size: 20px;
              }
            </style>
            <ul class="navbar-nav menu-list list-unstyled d-flex gap-md-3 mb-0">
              <li class="nav-item">
                <a href="../../index.jsp" class="nav-link active">Home</a>
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
  </header>

         <%@page import="com.cm.board.vo.LocationGu, java.util.*" %>
<div class="container mt-5">
        <h2>게시글 작성</h2>
    </div>
    <div class="container mb-3">
        <form action="${pageContext.request.contextPath}/qboard/createEnd" name="create_board_form" method="post" enctype="multipart/form-data">
            <label for="postTitle" class="form-label">제목</label>
            <input type="text" class="form-control" id="postTitle" name="postTitle">
            <input type="file" name="imageName"><br>
            <label for="postText" class="form-label">내용</label>
            <textarea class="form-control" id="postText" name="postText" rows="5"></textarea>

            <!-- 추가된 부분: local_gu_no 선택 -->
            <label for="localGuNo" class="form-label">지역 구 선택</label>
            <select class="form-control" id="localGuNo" name="localGuNo">
                <% 
                    // 여기에 DB에서 location_gu 데이터를 가져와서 출력하는 로직이 필요합니다.
                    List<LocationGu> locationGuList = (List<LocationGu>) request.getAttribute("locationGuList");
                    for (LocationGu gu : locationGuList) {
                %>
                    <option value="<%= gu.getLocalGuNo() %>"><%= gu.getLocalGuName() %></option>
                <% 
                    } 
                %>
            </select>

            <input type="button" class="btn btn-primary" value="등록" onclick="createBoardForm();">
            <input type="reset" class="btn btn-primary" value="취소">
            <a href="${pageContext.request.contextPath}/qboard/list" class="btn btn-primary">뒤로가기</a>
        </form>
    </div>
    <script type="text/javascript">
        function createBoardForm() {
            let form = document.forms["create_board_form"];
            if (!form.postTitle.value) {
                alert("제목을 입력하세요.");
                form.postTitle.focus();
            } else if (!form.postText.value) {
                alert("내용을 입력하세요.");
                form.postText.focus();
            } else if (!form.localGuNo.value) {
                alert("지역 구를 선택하세요.");
                form.localGuNo.focus();
            } else if (form.imageName.value) {
                const val = form.imageName.value;
                const idx = val.lastIndexOf('.');
                const type = val.substring(idx + 1, val.length);
                if (type == 'jpg' || type == 'jpeg' || type == "png") {
                    form.submit();
                } else {
                    alert("이미지 파일만 선택할 수 있습니다.")
                    form.imageName.value = '';
                }
            } else {
                form.submit();
            }
        }
    </script>
	

  <footer id="footer" class="my-5">
    <div class="container py-5 my-5">
      <div class="row">
        <div class="col-md-3">
          <div class="footer-menu">
            <img src="../resources/images/logo.png" alt="logo">
            <p class="blog-paragraph fs-6 mt-3">Subscribe to our newsletter to get updates about our grand offers.</p>
            <div class="social-links">
              <ul class="d-flex list-unstyled gap-2">
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon" icon="ri:facebook-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon" icon="ri:twitter-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon" icon="ri:pinterest-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon" icon="ri:instagram-fill"></iconify-icon>
                  </a>
                </li>
                <li class="social">
                  <a href="#">
                    <iconify-icon class="social-icon" icon="ri:youtube-fill"></iconify-icon>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="col-md-3">
          <div class="footer-menu">
            <h3>Quick Links</h3>
            <ul class="menu-list list-unstyled">
              <li class="menu-item">
                <a href="../../index.jsp" class="nav-link">Home</a>
              </li>
              <li class="menu-item">
                <a href="#" class="nav-link">질문</a>
              </li>
              <li class="menu-item">
                <a href="#" class="nav-link">판매/나눔</a>
              </li>
              <li class="menu-item">
                <a href="#" class="nav-link">번개모임</a>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div class="footer-menu">
            <h3>Help Center</h5>
              <ul class="menu-list list-unstyled">
                <li class="menu-item">
                  <a href="#" class="nav-link">고객센터</a>
                </li>
                <li class="menu-item">
                  <a href="#" class="nav-link">1:1문의하기</a>
                </li>
              </ul>
          </div>
        </div>
        <div class="col-md-3">
          <div>
            <h3>Our Newsletter</h3>
            <p class="blog-paragraph fs-6">Subscribe to our newsletter to get updates about our grand offers.</p>
            <div class="search-bar border rounded-pill border-dark-subtle px-2">
              <form class="text-center d-flex align-items-center" action="" method="">
                <input type="text" class="form-control border-0 bg-transparent" placeholder="Enter your email here" />
                <iconify-icon class="send-icon" icon="tabler:location-filled"></iconify-icon>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </footer>

  <div id="footer-bottom">
    <div class="container">
      <hr class="m-0">
      <div class="row mt-3">
        <div class="col-md-6 copyright">
          <p class="secondary-font">© 2023 Waggy. All rights reserved.</p>
        </div>
        <div class="col-md-6 text-md-end">
          <p class="secondary-font">Free HTML Template by <a href="https://templatesjungle.com/" target="_blank"
              class="text-decoration-underline fw-bold text-black-50"> TemplatesJungle</a> </p>
          <p class="secondary-font">Distributed by <a href="https://themewagon.com/" target="_blank"
              class="text-decoration-underline fw-bold text-black-50"> ThemeWagon</a> </p>
        </div>
      </div>
    </div>
  </div>

  <script src="../resources/js/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <script src="../resources/js/plugins.js"></script>
  <script src="../resources/js/script.js"></script>
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>
