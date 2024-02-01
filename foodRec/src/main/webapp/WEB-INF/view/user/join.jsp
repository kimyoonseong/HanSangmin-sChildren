<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <!-- 부트스트랩 CDN을 사용하는 경우 아래 링크를 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
     body {
            background-color: #f8f9fa;
            padding: 20px;
        }
    

        h1 {
            margin-bottom: 20px;
        }

        form {
            max-width: 400px;
            margin: auto;
        }

        input {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>



    <div class="container mt-4" style="padding-top: 90px">
        <h1>회원 가입</h1>

        <form action="/user/join" method="post">
            <div class="form-group">
                <input type="text" name="id" class="form-control" placeholder="사용자 ID" required>
                <c:if test="${not empty msg}">
                    <small class="text-danger">${msg}</small>
                </c:if>
            </div>
            <div class="form-group">
                <input type="text" name="name" class="form-control" placeholder="사용자 이름" required>
            </div>
            <div class="form-group">
                <input type="password" name="pass" class="form-control" placeholder="사용자 비밀번호" required>
            </div>
            <div class="form-group">
                <input type="text" name="grade" class="form-control" placeholder="사용자 등급" value="GUEST">
            </div>
            <button type="submit" class="btn btn-primary  float-right" >회원 가입</button>
        </form>
    </div>

    <!-- 부트스트랩 JS 및 Popper.js, jQuery CDN을 사용하는 경우 아래 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
