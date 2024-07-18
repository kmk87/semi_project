<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.cm.flashmob.vo.Flashmob,java.util.*" %>
<link href="../../resources/css/flashmob/check.css" rel="stylesheet" type="text/css">
<html>
<head>
<meta charset="UTF-8">
<title>글 조회</title>
</head>
<body>
	<%
    Flashmob flashmob = (Flashmob) request.getAttribute("post");
%>
<div class="container">
    <div class="header">
        <div class="title"><%= flashmob.getPost_title() %></div>
        <div class="info">
            <span><%=flashmob.getUser_no() %></span>
            <span><%= flashmob.getPost_reg_date() %></span>
            <span>좋아요 <%= flashmob.getLike_count() %></span>
        </div>
    </div>
    <div class="content">
        <p> <%= flashmob.getPost_text() %></p>

    <div class="details">
        <div class="location">
            <strong>모임 위치</strong><br>
            <%= flashmob.getFlashmob_location() %>
        </div>
        <div class="time">
            <strong>모임 시간</strong><br>
            <%= flashmob.getFlashmob_date().toLocalDate() %><br>
            <%= flashmob.getFlashmob_date().toLocalTime() %>
        </div>
    </div>
    <div id="map" style="width:300px;height:300px;margin-top:10px;display:none">
    </div>
    <div class="actions">
        <div class="likes-comments">
            <span><img src="people_icon.png" alt="people icon"> 1/3명</span>
            <span><img src="clock_icon.png" alt="clock icon"> 04:20:00</span>
        </div>
        <div class="apply">
            <button class="apply_btn" onclick="openPopup()">신청하기</button>
        </div>
    </div>
</div>



<div id="apply_pop" class="apply_pop" style="display:none;">
	<h2>모임 신청</h2>
	<div class="pop_inner">
	<form id="applyForm" action="/flashmob/apply" method="post">
		<input type="hidden" name="postNo" value="<%= flashmob.getPost_no()%>">
		<label for="about_me">자기소개</label>
		<input type="text" name="introduce" id="about_me" placeholder="가입신청을 위한 간단한 자기소개를 해주세요">
		<button type="submit" onclick="submitApplication()">신청</button>
		<button type="button" onclick="closePopup()">취소</button>
	</form>
	</div>
</div>
<script>
	function openPopup(){
		document.getElementById('apply_pop').style.display='block';
	}
	function closePopup(){
		document.getElementById('apply_pop').style.display='none';
	}
	function submitApplication(){
		alert('신청이 완료되었습니다!');
		closePopup();
	}
</script>
</body>
</html>