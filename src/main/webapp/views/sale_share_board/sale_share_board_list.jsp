<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script type="text/JavaScript" src="jquery-3.7.1.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <link href="../../resources/css/listSale.css" rel="stylesheet" type="text/css">
    <link href="../../resources/css/paging.css" rel="stylesheet" type="text/css">
    <script type="text/JavaScript" src="jquery-3.7.1.js"></script>
    <title>판매/나눔 게시판</title>
</head>
<body>
	<%@ include file="../include/new_header.jsp" %>
	<% List<SaleShareList> list = (List<SaleShareList>)request.getAttribute("resultList");%>
	<section id="section">
    <div id="sale_share">
        <span class="circle">전체</span>
        <a href="/sale_share_board/sale_share_board_cate?key='free'" class="circle">나눔</a>
        <a href="/sale_share_board/sale_share_board_cate?key='share'" class="circle">판매</a>
    </div>
    <br>
    <div id="prod_category" onclick="cate_click();">
        <span class="cate">전체</span>
        <span class="cate">가구</span>
        <span class="cate">식품</span>
        <span class="cate">의류</span>
        <span class="cate">가전</span>
        <span class="cate">기타</span>
    </div><br>
    <hr>
    <section>
    <div class="post">
        <%@ page import ="com.cm.sale_share_board.vo.SaleShareList, java.util.*" %>
        <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
        <%@ page import="java.time.Duration, java.time.format.DateTimeFormatter" %>
        <div class="list">
        	<table>
        		<colgroup>
        			<col width="10%">
        			<col width="20%">
        			<col width="20%">
					<col width="20%">
					<col width="20%">
        	<thead>
						<tr>
							<th>사진</th>
							<th>제목</th>
							<th>금액</th>
							<th>작성자</th>
							<th>시간</th>
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
            	<td><%= board.getUser_no() %></td>
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
            </tr>
            <% } %>
            </tbody>
            </table>
    	</div>
    	</div>
</section>
		<input type="text" placeholder="검색해주세요" name="search_text" id="search_text">
   <% SaleShareList paging = (SaleShareList)request.getAttribute("paging");%>
	<% if(paging != null){ %>
		<div class="center">
			<div class="pagination">
				<% if(paging.isPrev()){ %>
					<a href="/sale_share_board/sale_share_board_list?nowPage=<%=(paging.getPageBarStart()-1)%>">
						&laquo;
					</a>
				<%}%>
				<% for(int i = paging.getPageBarStart() ; i <= paging.getPageBarEnd() ; i++) {%>
					<a href="/sale_share_board/sale_share_board_list?nowPage=<%=i%>" 
					<%=paging.getNowPage() == i ? "class='active'" : ""%>>
						<%=i%>
					</a>
				<%}%>
				<% if(paging.isNext()){%>
					<a href="/sale_share_board/sale_share_board_list?nowPage=<%=(paging.getPageBarEnd()+1)%>">&raquo;</a>
				<%}%>
			</div>
		</div>
	<% } %>
    <script>
    	
        const sale_share_click = function(){
			
        }
        const cate_click = function(){
			
        }
    </script>
    </section>
</body>
</html>