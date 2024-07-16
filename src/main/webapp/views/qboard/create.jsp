<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
</head>
<body>
	<%@ include file="../include/header.jsp" %>
	<%@ include file="../include/nav.jsp" %>
	<section>
		<div id="section_wrap">
			<div class="word">
				<h3>게시글 등록</h3>
			</div><br>
			<div class="register_board_form">
				<form action='/qboard/createEnd' name="create_board_form" method="post" enctype="multipart/form-data">	
					<input type="text" name="post_title" placeholder="제목을 입력하세요."> <br>
					<input type="text" name="post_text" placeholder="내용을 입력하세요."><br>
<!-- 					<input type="text" name="board_writer" placeholder="작성자를 입력하세요."> <br> -->
					<input type="button" value="등록" onclick="createBoardForm();"> 
					<input type="reset" value="취소">
				</form>
			</div>
		</div>
	</section>
	<script type="text/javascript">
    function createBoardForm() {
        let form = document.create_board_form;
        if (!form.post_title.value) {
            alert("제목을 입력하세요.");
            form.post_title.focus();
        } else if (!form.post_text.value) {
            alert("내용을 입력하세요.");
            form.post_text.focus();
        } else {
            form.submit(); // 폼을 제출하는 코드 추가
        }
    }
		
	</script>
</body>
</html>