<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
</head>
<body>
	<%@ include file="../include/new_header.jsp" %>
    <!-- <img src='../../resources/img/free-icon-sale-7967061.png' id="sale_icon"> -->
	<section id="section_id">
    	<!--  유저 사진 값 -->
    	<img src="../../resources/img/부럽이.jpg"  id="profile_img">
        <img src="../../resources/img/free-icon-heart-1077035.png" id="heart_id">
        <input type="button" value="1:1채팅" id="chat_id">
        <br><br>
        <form action="/sale_share_board/createEnd" method="post" enctype="multipart/form-data" id="form_id" name="form_id">
            <div class="form_group">
                <div style= " width: 100px; height: 100px; background-color: white; cursor: pointer;" >
                    <input type='file' id="myFile" name="thumbnail"><br><br>
                </div>
            </div>
            <br><br>
            <div class="form_group">
                <p><label for="prod_id">상품명</label>
                <input type="text" id="prod_id" name="post_title" placeholder="text">
                <span id="span_leng">0/20</span>
                <span id="error_message">20자리까지 작성가능합니다.</span></p>
                <label for="price_id" id="price_label">가격</label>
                <input type="number" id="price_id" name="prod_price">
                <label>나눔</label>
                <input type="checkbox" id="free_checkBox"><br><br>
                <label for="place" id="place_label">거래장소</label>
                <input type="text" id="place" name="place"><br>
                <br>
                <label>카테고리</label>
                <select name="prod_cate">
                    <option value="0">------------------</option>
                    <option value="1">가구</option>
                    <option value="2">식품</option>
                    <option value="3">가전</option>
                    <option value="4">의류</option>
                    <option value="5">기타</option>
                </select>
                <br><br>
                <label>거래상태</label>
                <select name="deal_status">
                    <option value="0">거래중</option>
                </select>
            </div>
            <div class="form_group">
                <div class="textarea-container">
                    <label for="description">설명</label>
                    <textarea placeholder="자세한 설명 글 올리기" id="description" name="post_text"></textarea>
                </div>
            </div>
            <input type="submit" value="올리기" id="submit_id" onclick="createBoardForm();">
        </form>
    </section>
    <script type="text/javascript">
    	window.onload = function(){
        	document.getElementById("place").addEventListener("click", function(){ 
            	new daum.Postcode({
                	oncomplete: function(data) { 
                    	document.getElementById("place").value = data.address;
                	}
            	}).open();
        	});
    	}
    	$(function(){
        	$('#prod_id').keyup(function(){
            	let text_leng = $(this).val();
            	$('#span_leng').text(text_leng.length+'/20');
            	if(text_leng.length > 20){
                	$('#error_message').text('20자리가 넘습니다.').css('color','red');
            	}else{
                	$('#error_message').text('').css('color','');
            	}
        	});
        	$(document).ready(function() {
            	// 가격 입력 필드에 대한 처리
            	$('#price_id').keyup(function() {
                	let text_price = $(this).val();
                	console.log(text_price);
                	if (text_price == 0) {
                    	$('#free_checkBox').prop('checked', true);
                	} else {
                    	$('#free_checkBox').prop('checked', false);
                	}
            	});

            // 파일 입력 필드에 대한 처리
            $("#myFile").on('change', function() {
                readURL(this);
            });
		function createBoardForm() {
    			let form = document.form_id;
    				if (!form.post_title.value) {
        			alert("제목을 입력하세요.");
        			form.post_title.focus();
    		} else if (!form.post_text.value) {
        			alert("내용을 입력하세요.");
        			form.post_text.focus();
    		} else if (!form.thumbnail.value) {
        			alert('이미지 파일을 선택하세요.');
        			form.thumbnail.focus();
    		} else if (!form.prod_price.value) {
        			alert('금액을 입력해주세요');
        			form.prod_price.focus();
    		} else if (form.prod_cate.value == 0){
    				alert('카테고리를 선택해주세요');
    				form.prod_cate.focus();
    		} else if (form.thumbnail.value) {
        			const val = form.thumbnail.value;
        			const idx = val.lastIndexOf('.');
        			const type = val.substring(idx + 1, val.length);
        			if (type == 'jpg' || type == 'jpeg' || type == 'png') {
            			form.submit();
        			} else {
            			alert('이미지 파일만 선택할 수 있습니다.');
            		form.thumbnail.value = '';
        		}
    		} else {
        		form.submit();
    		}
		}
		
    </script>
</body>
</html>