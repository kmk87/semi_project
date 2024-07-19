<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 찾기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl5/6LfOB5ijFVn6X6ZZz5Gdf0kLk3e5q7/UuFiC5S" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<h2 class="mt-5">ID/Password Recovery</h2>
        <div class="row">
            <div class="col-md-6">
                <h3>Find ID</h3>
                <form action="/user/findId" method="post">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Find ID</button>
                </form>
            </div>
            <div class="col-md-6">
                <h3>Reset Password</h3>
                <form action="/user/resetPassword" method="post">
                    <div class="mb-3">
                        <label for="user_id" class="form-label">User ID</label>
                        <input type="text" class="form-control" id="user_id" name="user_id" required>
                    </div>
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Reset Password</button>
                </form>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-WZ8Em2yyE57J+2blJ8J0eisf1fz1Z8NRTpGdtrbr3ckRfUjBzxXtld68Gf9tT1IN"
        crossorigin="anonymous"></script>
</body>


</html>