<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="com.cm.board.vo.QBoard , java.util.* , com.cm.board.vo.QBoardComment" %>
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
    <link rel="stylesheet" type="text/css" href="../css/vendor.css">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <link rel="stylesheet" type="text/css" href="../css/normalize.css">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap"
    rel="stylesheet">
   <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .post-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .post-meta {
            font-size: 14px;
            color: #777;
            margin-bottom: 20px;
        }
        .post-content {
            font-size: 16px;
            margin-bottom: 20px;
        }
        .post-content img {
            max-width: 100%;
            height: auto;
            margin-top: 10px;
        }
        .comments-section {
            margin-top: 40px;
        }
        .comment {
            padding: 10px;
            background-color: #f9f9f9;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            margin-bottom: 10px;
        }
        .comment .comment-author {
            font-weight: bold;
        }
        .comment .comment-meta {
            font-size: 12px;
            color: #777;
            margin-bottom: 5px;
        }
        .comment .comment-text {
            font-size: 14px;
        }
        .comment-form {
            margin-top: 20px;
        }
        .comment-form textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            resize: none;
        }
        .comment-form button {
            margin-top: 10px;
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 8px;
            cursor: pointer;
        }
        .comment-form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%@ include file="../include/new_header.jsp" %>
  <div class="container">
        <div class="post-title">게시판글 보기</div>
        <table class="table">
            <thead>
                <tr>
                    <th>항목</th>
                    <th>내용</th>
                </tr>
            </thead>
            <tbody>
                <%
                    QBoard qboard = (QBoard) request.getAttribute("qboard"); 
                %>
                <tr>
                    <td>게시물 번호</td>
                    <td><%= qboard.getPostNo() %></td>
                </tr>
                <tr>
                    <td>지역 구 번호</td>
                    <td><%= qboard.getLocalGuNo() %></td>
                </tr>
                <tr>
                    <td>작성자 번호</td>
                    <td><%= qboard.getUserNo() %></td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><%= qboard.getPostTitle() %></td>
                </tr>
                <tr>
                    <td>내용</td>
                    <td>
                    <%= qboard.getPostText() %><br>
                    <img src="<%= request.getContextPath() + "/upload/" + qboard.getImageNewName() %>" alt="post image" style="width: 200px; height: 200px;">
                    </td>
                </tr>
                <tr>
                    <td>작성일</td>
                    <td><%= qboard.getPostRegDate() %></td>
                </tr>
                <tr>
                    <td>게시 여부</td>
                    <td><%= qboard.getPostReleaseYn() %></td>
                </tr>
                <tr>
                    <td>
                    <a href="/QBoard/like?post_no=<%=qboard.getPostNo()%>" class="btn btn-primary">좋아요</a>
                    </td>
                </tr>
            </tbody>
        </table>
        <a href="/qboard/list" class="btn btn-primary">뒤로가기</a>
        <a href="<%=request.getContextPath()%>/qboard/update?post_no=<%= qboard.getPostNo() %>" class="btn btn-primary">수정</a>
        <form action="<%=request.getContextPath()%>/qboard/delete" method="post" style="display:inline;" onsubmit="return confirmDelete()">
            <input type="hidden" name="post_no" value="<%= qboard.getPostNo() %>">
            <button type="submit" class="btn btn-danger">삭제</button>
        </form>
    </div>
</section>
<script>
function confirmDelete() {
    return confirm("정말로 이 게시글을 삭제하시겠습니까?");
}
</script>
<section>
    <div class="container">
        <div class="comments-section">
            <%
                List<QBoardComment> commentList = (List<QBoardComment>) request.getAttribute("commentList");
            %>
            <h2>댓글</h2>
            <form action="/qboard/comment/insert" method="post" class="comment-form">
                <input type="hidden" name="post_no" value="<%= request.getParameter("post_no") %>">
                <input type="hidden" name="user_no" value="1"> <!-- 예시로 사용자 번호를 1로 설정 -->
                <textarea name="comment_text" rows="4" cols="50"></textarea>
                <button type="submit">댓글 작성</button>
            </form>
            <h3>댓글 목록</h3>
            <table class="table">
                <thead>
                    <tr>
                        <th>작성자 번호</th>
                        <th>댓글 내용</th>
                        <th>작성일</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <% if (commentList != null && !commentList.isEmpty()) {
                        for (QBoardComment comment : commentList) { %>
                            <tr>
                                <td><%= comment.getUserNo() %></td>
                                <td><%= comment.getCommentText() %></td>
                                <td><%= comment.getCommentRegDate() %></td>
                                <td>
                                    <form action="/qboard/comment/delete" method="post" style="display:inline;">
                                        <input type="hidden" name="comment_no" value="<%= comment.getCommentNo() %>">
                                        <input type="hidden" name="post_no" value="<%= qboard.getPostNo() %>">
                                        <button type="submit" class="btn btn-danger">삭제</button>
                                    </form>
                                </td>
                            </tr>
                        <% }
                    } else { %>
                        <tr>
                            <td colspan="4">댓글이 없습니다.</td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
</section>
  <footer id="footer" class="my-5">
    <div class="container py-5 my-5">
      <div class="row">
        <div class="col-md-3">
          <div class="footer-menu">
            <img src="images/logo.png" alt="logo">
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

  <script src="../js/jquery-1.11.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
    crossorigin="anonymous"></script>
  <script src="../js/plugins.js"></script>
  <script src="../js/script.js"></script>
  <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
</body>
</html>
