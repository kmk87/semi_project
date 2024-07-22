<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.cm.flashmob.vo.Flashmob,java.util.*" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file ="../include/new_header.jsp" %>
	<%Flashmob flashmob = (Flashmob) request.getAttribute("post");%>
	<%java.time.format.DateTimeFormatter formatter = java.time.format.DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
    String formattedDateTime = flashmob.getFlashmob_date().format(formatter);%>
    <%int selectedNumber = flashmob.getFlashmob_number();%>
    <%String privacyValue = flashmob.getPost_release_yn();%>
	<section>
		<div id="section_wrap">
			<div class="word">
				<h3>게시글 수정</h3>
			</div><br>
			<div class="register_book_form">
				<form action='/flashmob/editEnd' name="create_flashmob_form" method="post" enctype="multipart/form-data">	
					<label for="flashmob_post_title">제목 : </label>
					<input type="text" name="flashmob_post_title" id="flashmob_post_title" value="<%= flashmob.getPost_title() %>"> <br>
					<label for="flashmob_location">장소 : </label>
					<input type="text" name="flashmob_location" id="flashmob_location" value="<%= flashmob.getFlashmob_location() %>" readonly> <br>
					<label for="flashmob_post_time">일정 선택 : </label>
					<input type="datetime-local" name="flashmob_time" id="flashmob_time" value="<%= formattedDateTime %>"><br>
					<label for="flashmob_number">인원 선택 : </label>
					<select name="flashmob_number" id="flashmob_number">
            			<option value="1" <%= selectedNumber == 1 ? "selected" : "" %>>1</option>
            			<option value="2" <%= selectedNumber == 2 ? "selected" : "" %>>2</option>
            			<option value="3" <%= selectedNumber == 3 ? "selected" : "" %>>3</option>
            			<option value="4" <%= selectedNumber == 4 ? "selected" : "" %>>4</option>
            			<option value="5" <%= selectedNumber == 5 ? "selected" : "" %>>5</option>
        			</select><br>
        			<label for="flashmob_post_text">내용 : </label>
					<input type="text" name="flashmob_post_text" id="flashmob_post_text" value="<%= flashmob.getPost_text() %>"><br>
					<label for="thumbnail">사진</label>
					<div>
        <label for="current_image">현재 이미지:</label><br>
        <img src="<%= request.getContextPath() + "/upload/" + flashmob.getFlashmob_new_image_name() %>" id="current_image" alt="Current Thumbnail" style="max-width: 300px; max-height: 300px;">
    </div>
    <div>
        <label for="thumbnail">새 이미지 선택:</label><br>
        <input type="file" name="thumbnail" id="thumbnail" accept=".png,.jpg,.jpeg">
    </div><br>
					<input type="checkbox" name="privacy" id="privacy" <%= "N".equals(privacyValue) ? "checked" : "" %>>
					<label for="privacy">비공개</label>
					<input type="hidden" name="postNo" value="<%= flashmob.getPost_no()%>">
					<input type="button" value="등록" onclick="createBoardForm();"> 
					<input type="reset" value="취소">
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		function createBoardForm() {
			let form = document.create_flashmob_form;	
			if(!form.flashmob_post_title.value){
				alert("제목을 입력하세요.");
				form.flashmob_post_title.focus();
			}else if(!form.flashmob_location.value){
				alert("장소를 입력하세요.");
				form.flashmob_location.focus();
			}else if(!form.flashmob_post_time.value){
				alert("일정을 입력하세요.");
				form.flashmob_post_time.focus();
			}else if(!form.flashmob_number.value){
				alert("인원을 입력하세요.");
				form.flashmob_number.focus();
			}else if(!form.flashmob_post_text.value){
				alert("내용을 입력하세요.");
				form.flashmob_post_text.focus();
			}else if(!form.thumbnail.value){
				form.submit();
			}else if(form.thumbnail.value){
				const val = form.thumbnail.value;
				const idx = val.lastIndexOf('.');
				const type = val.substring(idx+1,val.length);
				if(type == 'jpg' || type == 'jpeg' || type == "png"){
					form.submit();
				} else{
					alert("이미지 파일만 선택할 수 있습니다.");
					form.thumbnail.value = '';
				}
			}
		}
	</script>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
    document.getElementById("flashmob_location").addEventListener("click", function(){ //주소입력칸을 클릭하면
        //카카오 지도 발생
        new daum.Postcode({
            oncomplete: function(data) { //선택시 입력값 세팅
                document.getElementById("flashmob_location").value = data.address; // 주소 넣기
            }
        }).open();
    });
}
</script>
</html>