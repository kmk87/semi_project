<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
    <title>판매/나눔 게시글</title>
    <script type="text/JavaScript" src="jquery-3.7.1.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="../../resources/css/createSale.css" rel="stylesheet" type="text/css">
    
</head>
<body>
	<%@ include file="../include/new_header.jsp" %>
    <!-- <img src='../../resources/img/free-icon-sale-7967061.png' id="sale_icon">판매나눔 -->
    <%@ page import ="com.cm.sale_share_board.vo.SaleShareList, java.util.*" %>
        <%@ page import="java.time.LocalDateTime, java.time.format.DateTimeFormatter" %>
        <%@ page import="java.time.Duration, java.time.format.DateTimeFormatter" %>
        <% SaleShareList list = (SaleShareList)request.getAttribute("list");%>
	<section id="section_id">
        <img src="../../resources/img/free-icon-heart-1077035.png" id="heart_id">
        <input type="button" value="1:1채팅" id="chat_id">
        
        <form action="/views/sale_share_board/createEnd" method="post" enctype="multipart/form-data" id="form_id" name="form_id">
            <div class="form_group">
                <img src="../../upload/<%= list.getImage_new_name() %>" width="200px" height="200px">
            </div>
            <div class="form_group">
                <p><label for="prod_id">상품명</label>
                <input type="text" id="prod_id" name="post_title" placeholder="text" value="<%= list.getPost_title() %>" disabled><br><br>
                <label for="price_id" id="price_label">가격</label>
                <input type="number" id="price_id" name="prod_price" value="<%= list.getProd_price() %>" disabled>
                <label>나눔</label>
                <input type="checkbox" id="free_checkBox" disabled><br><br>
                <label for="place" id="place_label" >거래장소</label>
                <input type="text" id="place" name="place" value="서울시 <%= list.getLocal_gu_name() %>" disabled><br>
                <br>
                <label>카테고리</label>
                <select name="prod_cate" disabled>
                    <option>
                    <% switch(list.getProd_cate()){
                    	case 1 : out.print("가구"); break;
                    	case 2 : out.print("식품"); break;
                    	case 3 : out.print("가전"); break;
                    	case 4 : out.print("의류"); break;
                    	default : out.print("기타"); 
                    	}%>
                    </option>
                </select>
                <br><br>
                 <label>거래상태</label>
                <select name="deal_status" disabled>
                	<option>
                    <% switch(list.getDeal_status()) {
                    	case 0 : out.print("거래중"); break;
                    	case 1 : out.print("예약중"); break;
                    	case 2 : out.print("거래완료"); break;
                    	}%>
                	</option>
                </select>
            </div>
            <div class="form_group">
                <div class="textarea-container">
                    <label for="description">설명</label>
                    <textarea placeholder="자세한 설명 글 올리기" id="description" name="post_text" disabled><%= list.getPost_title() %></textarea>
                </div>
            </div>
        </form>
        <form action="/sale_share_borad/comment" method="post" >
        <div class="comment-container">
        <label class="comment-label">이름(user_nic)</label><br>
        <textarea class="comment-textarea" name="comment_text"></textarea>
        <div class="button-container">
            <input type="button" value="등록">
            <input type="button" value="취소">
        </div>
   		</div>
        </form>
        <!-- 뒤로가기 -->
        <input type="button" value="목록" onclick = "window.history.back();" style="float:right; margin-right :20px">
        <!-- 수정하기 -->
        <a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_edit?id=<%= list.getPost_no()%>"> 수정하기</a>
        <a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_delete?id=<%= list.getPost_no() %>">삭제하기</a>
        <a href="<%= request.getContextPath() %>/sale_share_board/sale_share_board_pull?id=<%=list.getPost_no() %>">끌어올리기</a>
    </section>
    <script>
    $('#price_id').keyup(function(){
        let text_price = $(this).val();
        console.log(text_price);
        if(text_price == 0){
            $('#free_checkBox').prop('checked',true).prop('disabled',true);
        }else{
            $('#free_checkBox').prop('checked',false).prop('disabled',false);
        }
    })
    </script>
		
</body>
</html>