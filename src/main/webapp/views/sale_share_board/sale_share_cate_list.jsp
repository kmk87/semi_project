<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
      <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
	<link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
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
    <link rel="stylesheet" type="text/css" href="../../resources/css/listSale.css">
    <link rel="stylesheet" type="text/css" href="../../resources/css/paging.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Chilanka&family=Montserrat:wght@300;400;500&display=swap" rel="stylesheet">
    <title>판매/나눔 게시판</title>
</head>
<body>
	<%@ include file="../include/new_header.jsp" %>
	<% List<SaleShareList> list = (List<SaleShareList>)request.getAttribute("resultList");%>
	<section id="section">
    <div id="sale_share">
        <a href="/sale_share_board/sale_share_board_cate?key='all'" class="circle">전체</a>
        <a href="/sale_share_board/sale_share_board_cate?key='share'" class="circle">나눔</a>
        <a href="/sale_share_board/sale_share_board_cate?key='sell'" class="circle">판매</a>
    </div>
    <form action="/sale_share_board/share_array" method="post" id="arrayForm">
      <select name="array" onchange="arrayForm();" id="arraySelect">
		<option value="0">최신순</option>
    	<option value="1">가격낮은순</option>
    	<option value="2">가격높은순</option>
    	</select>
    </form>
    <hr>
    <section>
    <div class="post">
        <%@ page import ="com.cm.sale_share_board.vo.SaleShareList, java.util.*" %>
        <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
        <%@ page import="java.time.Duration, java.time.format.DateTimeFormatter" %>
        <div class="list">
        	<table>
        		<colgroup>
        			<col width="20%">
        			<col width="20%">
        			<col width="5%">
					<col width="15%">
					<col width="10%">
					<col width="15%">
					<col width="15%">
        	<thead>
						<tr>
							<th>사진</th>
							<th>제목</th>
							<th>금액</th>
							<th>작성자</th>
							<th>시간</th>
							<th>조회수</th>
							<th>좋아요</th>
						</tr>
			</thead>
			<tbody>
            

           <% for(int i = 0; i < list.size(); i++) {
                SaleShareList board = list.get(i);
            %>
            <tr>
            	<td><img src="<%= request.getContextPath() %>/upload/<%= board.getImage_new_name() %>" alt="Product Image"></td>
            	<!-- servlet 경로설정 -->
            	<td><a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_detail?id=<%= board.getPost_no() %>"><%= board.getPost_title() %></a>
            		<% 
						String dealText = ""; 
            			String color = "";
            			switch(board.getDeal_status()){
            				case 0 : dealText = ""; break;
            				case 1 : dealText = "예약중"; color = "green"; break;
            				case 2 : dealText = "거래완료"; color = "red"; break;
            		} %>
            		<span style="color:<%= color %>; font_size ='12'"><%= dealText %></span>
            	</td>
            	<td><%= board.getProd_price() %>원</td>
            	<td><%= board.getUser_nic() %></td>
            	<td><%
                		LocalDateTime now = LocalDateTime.now();
                		LocalDateTime modDate = list.get(i).getProd_mod_date();
                		
                		// 두 날짜 사이의 차이 계산
                		Duration duration = Duration.between(modDate,now);
                		
                		// 초 단위로 변환
                		long secondsDiff = duration.getSeconds();
                		
                		if(secondsDiff < 60){%>
							<%= secondsDiff +"초 전" %>
							<% } else if(secondsDiff < 3600){ 
								long minutesDiff = secondsDiff /60 ;%>
								<%= minutesDiff +"분 전" %>
								<%}else if(secondsDiff < 86400){ 
								long hoursDiff = secondsDiff / 3600;%>
								<%= hoursDiff + "시간 전" %>
								<%}else{
									DateTimeFormatter dft = DateTimeFormatter.ofPattern("yy-MM-dd");
									String formattedDate = dft.format(modDate); %>
									<%= formattedDate %>
								<% }%>
            </td>
            <td><%= board.getPost_view() %></td>
            <td><%= board.getDeal_status() %></td>
            </tr>
            <% } %>
            </tbody>
            </table>
    	</div>
    	</div>
</section>
   <% SaleShareList paging = (SaleShareList)request.getAttribute("paging");%>
	<% if(paging != null){ %>
		<div class="center">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/sale_share_board/sale_share_board_cate?key=<%= request.getParameter("key") %>&nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%}%>
				<% for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++) {%>
					<a href="/sale_share_board/sale_share_board_cate?key=<%= request.getParameter("key") %>&nowPage=<%=i%>"  
					<%=paging.getNowPage() == i ? "class='active'" : ""%>>
						<%=i%>
					</a>
				<%}%>
				<% if(paging.isNext()){%>
					 <a href="/sale_share_board/sale_share_board_cate?key=<%= request.getParameter("key") %>&nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
				<%}%>
			</div>
		</div>
	<% } %>
	<form action="/sale_share/searchList" method="get">
    	<select name="search">
        	<option value="1">제목</option>
        	<option value="2">내용</option>
        	<option value="3">닉네임</option>
    	</select>
    	<input type="text" placeholder="검색해주세요" name="search_text" id="search_text">
    	<input type="submit" value="검색">
	</form>
    </section>
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