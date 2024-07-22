<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.cm.board.vo.QBoard" %>
<%@ page import="com.cm.board.vo.QBoardComment" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Question Board Detail</title>
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
        .table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .table th, .table td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        .table th {
            background-color: #f2f2f2;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin-right: 5px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            text-align: center;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        .btn-primary {
            background-color: #007bff;
        }
    </style>
</head>
<body>
    <header>
        <!-- 헤더 내용 그대로 유지 -->
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
                            <input type="text" class="form-control border-0 bg-transparent" placeholder="통합검색" style="padding-left: 20px; padding-top: 23px;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                <path fill="currentColor" d="M21.71 20.29L18 16.61A9 9 0 1 0 16.61 18l3.68 3.68a1 1 0 0 0 1.42 0a1 1 0 0 0 0-1.39ZM11 18a7 7 0 1 1 7-7a7 7 0 0 1-7 7Z" />
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
                            <a href="#" class="mx-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvasSearch" aria-controls="offcanvasSearch">
                                <iconify-icon icon="tabler:search" class="fs-4"></iconify-icon>
                            </a>
                        </li>
                    </ul>
                </div>
                <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar" aria-controls="offcanvasNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
                    <div class="offcanvas-header justify-content-center">
                        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                    </div>
                    <div class="offcanvas-body justify-content-between">
                        <a class="nav-link dropdown-toggle" role="button" id="pages" data-bs-toggle="dropdown" aria-expanded="false" style="padding-top: 10px; font-size: 20px;">글쓰기</a>
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
    <%@page import="com.cm.board.vo.QBoard, java.util.* ,com.cm.user.vo.User" %>
    <section>
        <div class="container">
            <div class="post-title">게시판글 보기</div>
            <div class="post-meta">
                            <%
                    QBoard qboard = (QBoard) request.getAttribute("qboard"); 
                            
                %>
                <span>게시물 번호: <%= qboard.getPostNo() %></span> | 
                <span>지역 구 번호: <%= qboard.getLocalGuNo() %></span> | 
                <span>작성자 번호: <%= qboard.getUserNo() %></span>
            </div>
            <div class="post-content">
                <h2><%= qboard.getPostTitle() %></h2>
                <p><%= qboard.getPostText() %></p>
                <img src="<%= request.getContextPath() + "/upload/" + qboard.getImageNewName() %>" alt="Post Image">
            </div>
            <div class="post-meta">
                <span>작성일: <%= qboard.getPostRegDate() %></span> | 
                <span>게시 여부: <%= qboard.getPostReleaseYn() %></span>
            </div>
            <div class="post-actions">
                <a href="/QBoard/like?post_no=<%= qboard.getPostNo() %>" class="btn btn-primary">좋아요</a>
                <a href="/qboard/list" class="btn btn-primary">뒤로가기</a>
                <a href="<%= request.getContextPath() %>/qboard/update?post_no=<%= qboard.getPostNo() %>" class="btn btn-primary">수정</a>
                <form action="<%= request.getContextPath() %>/qboard/delete" method="post" style="display:inline;" onsubmit="return confirmDelete()">
                    <input type="hidden" name="post_no" value="<%= qboard.getPostNo() %>">
                    <button type="submit" class="btn btn-danger">삭제</button>
                </form>
            </div>
        </div>
    </section>
    <section class="comments-section">
        <div class="container">
            <h2>댓글</h2>
            <form action="/qboard/comment/insert" method="post" class="comment-form">
                <input type="hidden" name="post_no" value="<%= request.getParameter("post_no") %>">
                <input type="hidden" name="user_no" value="1"> <!-- 예시로 사용자 번호를 1로 설정 -->
                <textarea name="comment_text" rows="4" placeholder="댓글을 작성하세요"></textarea>
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
                			<%
    			List<QBoardComment> commentList = (List<QBoardComment>) request.getAttribute("commentList");
			%>
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
    </section>
    <script>
        function confirmDelete() {
            return confirm("정말로 이 게시글을 삭제하시겠습니까?");
        }
    </script>
</body>
</html>
