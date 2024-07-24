<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.cm.board.vo.QBoard" %>
<!DOCTYPE html>
<html>
<head>
    <title>좋아요 한 게시글</title>
    
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
  <link rel="stylesheet" type="text/css" href="../../resources/css/vendor.css">
  <link rel="stylesheet" type="text/css" href="../../resources/css/style.css">
  <link rel="stylesheet" type="text/css" href="../../resources/css/normalize.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
      <style>
    header {
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    position: relative;
}
    </style>
</head>
<body>
<%@ include file="../include/new_header.jsp" %>
    <div class="container mt-5">
        <h2>좋아요 한 게시글</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>좋아요 수</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<QBoard> likedPosts = (List<QBoard>) request.getAttribute("likedPosts");
                    if (likedPosts != null) {
                        for (QBoard post : likedPosts) {
                %>
                <tr>
                    <td><%= post.getPostNo() %></td>
                    <td><a href="<%= request.getContextPath() %>/qboard/detail?post_no=<%= post.getPostNo() %>"><%= post.getPostTitle() %></a></td>
                    <td><%= post.getLikeCount() %></td>
                    <td><%= post.getPostView() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="4">게시글이 없습니다.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
 <footer id="footer" class="my-5">
    <div class="container py-5 my-5">
      <div class="row">
        <div class="col-md-3">
          <div class="footer-menu">
            <img src="../resourse/images/logo.png" alt="logo">
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

  <script src="../../resources/js/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <script src="../../resources/js/plugins.js"></script>
  <script src="../../resources/js/script.js"></script>
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>
