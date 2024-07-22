<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link href="../../resources/css/flashmob/check.css" rel="stylesheet" type="text/css">
<html>
<head>
<meta charset="UTF-8">
<title>글 조회</title>
<%@ page import="com.cm.flashmob.vo.Flashmob,java.util.*" %>
<%@ page import="com.cm.flashmob.vo.FlashmobApply" %>
<%@ page import="com.cm.vo.User" %>
</head>
<body>

<% 
    Flashmob flashmob = (Flashmob) request.getAttribute("post");
    User who = (User)session.getAttribute("user");
    Integer count = (Integer) request.getAttribute("count");
    String name = (String)request.getAttribute("name");
%>

<div class="container">
    <div class="header">
        <div class="title"><%= flashmob.getPost_title() %></div>
        <div class="info">
            <span><%=name%></span>
            <span><%= flashmob.getPost_reg_date() %></span>
            <span>좋아요 <%= flashmob.getLike_count() %></span>
        </div>
    </div>
    <div class="content">
        <p><%= flashmob.getPost_text() %></p>
        <div class="map">
            <img src="<%= request.getContextPath() + "/upload/" + flashmob.getFlashmob_new_image_name() %>" alt="map" style="width: 200px; height: 200px;">
            <table>
                    <colgroup>
                        <col width="10%">
                        <col width="60%">
                        <col width="30%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>자기소개</th>
                            <th>신청일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<FlashmobApply> displayList = (List<FlashmobApply>) request.getAttribute("displayList");
                            if (displayList != null) {
                                for (FlashmobApply apply : displayList) { %>
                                    <tr>
                                        <td><%= apply.getUser_nick() %></td>
                                        <td><%= apply.getApplication_text() %></td>
                                        <td><%= apply.getApplication_date() %></td>
                                    </tr>
                                <% } %>
                            <% } %>
                    </tbody>
                </table>
        </div>

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

        <% if (who != null && who.getUser_no() == flashmob.getUser_no()) { %>
            <div class="actions">
                <div class="likes-comments">
                    <span><img src="people_icon.png" alt="people icon"> <%= count %>/<%= flashmob.getFlashmob_number() %>명</span>
                    <a href="/flashmob/like?post_no=<%= flashmob.getPost_no() %>">좋아요</a>
                </div>
                <a href="/flashmob/delete?post_no=<%= flashmob.getPost_no() %>">삭제하기</a>
                <a href="/flashmob/edit?post_no=<%= flashmob.getPost_no() %>">수정하기</a> 
                <div class="apply">
                <button onclick="openPopup()">신청내역</button>
                </div>
            </div>
            <div id="apply_pop_2" class="apply_pop" style="visibility:hidden;">
                <table>
                    <colgroup>
                        <col width="10%">
                        <col width="60%">
                        <col width="20%">
                        <col width="5%">
                        <col width="5%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>이름</th>
                            <th>자기소개</th>
                            <th>신청일</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <% List<FlashmobApply> list = (List<FlashmobApply>) request.getAttribute("resultList");
                            if (list != null) {
                                for (FlashmobApply apply : list) { %>
                                    <tr>
                                        <td><%= apply.getUser_nick() %></td>
                                        <td><%= apply.getApplication_text() %></td>
                                        <td><%= apply.getApplication_date() %></td>
                                        
                                        <td><a href="javascript:acceptApplication('<%= apply.getApplication_no() %>')">수락</a></td>
                                        <td><a href="javascript:rejectApplication('<%= apply.getApplication_no() %>')">거절</a></td>
                                    </tr>
                                <% } %>
                            <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="actions">
                <div class="likes-comments">
                    <span><img src="people_icon.png" alt="people icon"> <%=count %>/<%= flashmob.getFlashmob_number() %>명</span>
                    <% if(who!=null){ %>
                    <a href="/flashmob/like?post_no=<%= flashmob.getPost_no() %>">좋아요</a>
                <%}else{ %>
                <a href="/user/login">좋아요</a>
                <%} %>
                </div>
                <div class="apply">
                <% if(who!=null){ %>
                    <button class="apply_btn" onclick="openPopuptwo()">신청하기</button>
                    <%}else{ %>
                    <button type="submit" onclick="gologin()">신청하기</button>
                    <%} %>
                </div>
            </div>

            <div id="apply_pop" class="apply_pop" style="visibility:hidden;">
                <h2>모임 신청</h2>
                <div class="pop_inner">
                    <form id="applyForm" action="/flashmob/apply" method="post">
                        <input type="hidden" name="postNo" value="<%= flashmob.getPost_no() %>">
                        <label for="about_me">자기소개</label>
                        <input type="text" name="introduce" id="about_me" placeholder="간단한 자기소개를 해주세요">
                        
                        <button type="submit" onclick="submitApplication()">신청</button>
                        
                        
                        
                        <button type="button" onclick="closePopup()">취소</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div> <!-- 여기가 content div의 종료 태그입니다. -->
</div> <!-- 여기가 container div의 종료 태그입니다. -->

<script>
function acceptApplication(applicationNo) {
    if (confirm("이 신청을 수락하시겠습니까?")) {
        window.location.href = '/flashmob/accept?yn=Y&applyNo=' + encodeURIComponent(applicationNo);
    }
}

function rejectApplication(applicationNo) {
    if (confirm("이 신청을 거절하시겠습니까?")) {
        window.location.href = '/flashmob/accept?yn=N&applyNo=' + encodeURIComponent(applicationNo);
    }
}
function openPopup() {
	document.getElementById('apply_pop_2').style.visibility = 'visible';
    //window.location.href='/flashmob/check?post_no='+postno;
}
function gologin(){
	console.log("비로그인");
	window.location.href='/user/login';
}
function openPopuptwo() {
	console.log(<%=count%>);
    document.getElementById('apply_pop').style.visibility = 'visible';
}
function closePopup() {
    document.getElementById('apply_pop').style.display = 'none';
}

function submitApplication() {
    document.getElementById('applyForm').submit();
}
</script>

</body>
</html>
