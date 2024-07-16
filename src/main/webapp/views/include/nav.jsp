<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.cm.vo.User" %>
<link href='../../resources/css/include/nav.css' rel="stylesheet" type="text/css">
<nav>
	<div id="nav_wrap">
		<%
			User user = (User)session.getAttribute("user");
			if(user == null){
		%>
		<div class="menu">
			<ul>
				<li>
					<a href="/user/login">로그인</a>
				</li>
				<li>
					<a href="/user/create">회원가입</a>
				</li>
			</ul>
		
		</div>
		<% } else{ %>
			<div class="menu">
				<ul>
					<li>
						<a href="/board/create">게시판</a>
					</li>
					<li>
						<a href="/user/logout">로그아웃</a>
					</li>
					<li>
						<a href="#">회원정보 수정</a>
					</li>
				</ul>
			</div>
		<% } %>
		<div class="search">
			<form action="/board/list" name="search_board_form" method="get">
				<input type="text" name="board_title" placeholder="통합검색">
				<input type="submit" value="검색">
			
			</form>		
		
		
		</div>
			
			
			
			
	</div>	




</nav>

<!-- <header>
   <div id="header_wrap">
      <div class="title">   
         <h3>
            <a href="#">HOME</a>
            <a href="#">질문</a>
            <a href="#">소통</a>
            <a href="#">번개모임</a>
            <a href="#">판매/나눔</a>
            <a href="#">글쓰기</a>
         </h3>
      </div>
   </div>
</header> -->