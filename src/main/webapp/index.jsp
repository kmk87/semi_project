<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<title>Share_Life</title>
<link href="resources/css/user/style.css">
</head>
<body> 
	<%@ include file="views/include/hearder2.jsp" %>
 
  <div class="swiper-container container my-3 py-5 slider1">
    <h5 style="font-size:40px;" class="display-3 fw-normal">
      <img src="resources/images/fire.png" style="padding-bottom: 12px;">
      인기 게시글</h5>
    <div class="swiper-wrapper my-5">
        <div class="swiper-slide col text-center card" >카드 1</div>
        <div class="swiper-slide col text-center card">카드 2</div>
        <div class="swiper-slide col text-center card">카드 3</div>
        <div class="swiper-slide col text-center card">카드 4</div>
        <div class="swiper-slide col text-center card">카드 5</div>
        <div class="swiper-slide col text-center card">카드 6</div>
        <div class="swiper-slide col text-center card">카드 7</div>
        <div class="swiper-slide col text-center card">카드 8</div>
        <div class="swiper-slide col text-center card">카드 9</div>
        <div class="swiper-slide col text-center card">카드 10</div>
    </div>
    <!-- 추가적으로 네비게이션 버튼 등을 넣을 수 있는 부분 -->
    
  </div>
  <div class="swiper-button-prev swiper-button-prev1"></div>
  <div class="swiper-button-next swiper-button-next1"></div>

<div class="swiper-container container my-3 py-5 slider2">
  <h5 style="font-size:40px;" class="display-3 fw-normal">
    <img src="resources/images/pink_fire.png" style="padding-bottom: 12px;">
    인기 모임</h5>
  	<div class="swiper-wrapper my-5">
      <div class="swiper-slide col text-center card" >카드 1</div>
      <div class="swiper-slide col text-center card">카드 2</div>
      <div class="swiper-slide col text-center card">카드 3</div>
      <div class="swiper-slide col text-center card">카드 4</div>
      <div class="swiper-slide col text-center card">카드 5</div>
      <div class="swiper-slide col text-center card">카드 6</div>
      <div class="swiper-slide col text-center card">카드 7</div>
      <div class="swiper-slide col text-center card">카드 8</div>
      <div class="swiper-slide col text-center card">카드 9</div>
      <div class="swiper-slide col text-center card">카드 10</div>
  </div> 
  <!-- 추가적으로 네비게이션 버튼 등을 넣을 수 있는 부분 -->

  
</div>
<div class="swiper-button-prev swiper-button-prev2"></div>
<div class="swiper-button-next swiper-button-next2"></div>

<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<script>
  var swiper = new Swiper('.slider1', {
      slidesPerView: 5,  // 한 번에 보여질 슬라이드 개수
      spaceBetween: 20,  // 슬라이드 간의 간격
      loop: true,        // 무한 루프 여부 (선택사항)
      navigation: {
          nextEl: '.swiper-button-next1',  // 다음 버튼 클래스
          prevEl: '.swiper-button-prev1'   // 이전 버튼 클래스
      }
  });
  var swiper = new Swiper('.slider2', {
      slidesPerView: 5,  // 한 번에 보여질 슬라이드 개수
      spaceBetween: 20,  // 슬라이드 간의 간격
      loop: true,        // 무한 루프 여부 (선택사항)
      navigation: {
          nextEl: '.swiper-button-next2',  // 다음 버튼 클래스
          prevEl: '.swiper-button-prev2'   // 이전 버튼 클래스
      }
  });
  
 


</script>

  <footer id="footer" class="my-5">
    <div class="container py-5 my-5">
      <div class="row">

        <div class="col-md-3">
          <div class="footer-menu">
            <img src="resources/images/logo.png" alt="logo">
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
                <a href="#" class="nav-link">Home</a>
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