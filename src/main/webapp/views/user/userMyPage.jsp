<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link href="${pageContext.request.contextPath}/resources/css/userMyPage.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div class="container">
        <nav class="user-nav">
            <ul>
                <li><a href="#">프로필</a></li>
                <li><a href="#">회원정보수정</a></li>
                <li><a href="#">내가 쓴 글</a>
                    <ul>
                        <li><a href="#">질문</a></li>
                        <li><a href="#">답변</a></li>
                    </ul>
                </li>
                <li><a href="#">내 댓글</a>
                    <ul>
                        <li><a href="#">질문</a></li>
                        <li><a href="#">답변</a></li>
                    </ul>
                </li>
                <li><a href="#">좋아요</a>
                    <ul>
                        <li><a href="#">질문</a></li>
                        <li><a href="#">답변</a></li>
                    </ul>
                </li>
                <li><a href="#">판매/나눔</a></li>
                <li><a href="#">내 모임</a></li>
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
</body>
</html>
