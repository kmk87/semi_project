
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href='../../resources/css/include/nav.css' rel="stylesheet" type="text/css">
<nav>
   <div id="nav_wrap">   
      <div class="menu">
         <ul>
            <li>
               <a href="/user/login.jsp">로그인</a>
            </li>
            <li>
               <a href="/user/create">회원가입</a>
            </li>
         </ul>
      </div>
      <div class="search">
         <form action="/board/list" name="search_board_form" method="get">
            <input type="text" name="board_title" placeholder="통합검색">
            <input type="submit" value="검색">
         </form>
      </div>
   </div>
</nav>