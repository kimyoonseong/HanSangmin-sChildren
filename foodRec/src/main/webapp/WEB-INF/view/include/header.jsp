<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Board</title>
    <!-- Bootstrap CSS 추가 -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 20px;
        }

        h1 {
            color: #007bff;
        }

        .login-container {
            max-width: 400px;
            margin: auto;
        }

        .btn-primary {
            margin-top: 10px;
        }

        .user-info {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>My Board</h1>

    <div class="login-container">
        <c:if test="${empty loginUser}">
            <c:if test="${not empty loginmsg}">
                <div class="alert alert-danger" role="alert">
                    ${loginmsg}
                </div>
            </c:if>

            <form method="post" action="/user/login">
                <div class="form-group">
                    <label for="id">아이디:</label>
                    <input type="text" class="form-control" id="id" name="id" required>
                </div>
                <div class="form-group">
                    <label for="pass">비밀번호:</label>
                    <input type="password" class="form-control" id="pass" name="pass" required>
                </div>
                <button type="submit" class="btn btn-primary">로그인</button>
            </form>
            <a href="/user/join" class="btn btn-link">회원가입</a>
        </c:if>

        <c:if test="${not empty loginUser}">
            <div class="user-info">
                <p>${loginUser.name}님 반갑습니다.</p>
                <a href="/user/logout" class="btn btn-link">로그아웃</a>
                <a href="#" onclick="confirmWithdrawal()" class="btn btn-link">회원탈퇴</a>
                <a href="/board/regist" class="btn btn-primary">게시글 등록</a>
                <a href="/board/list" class="btn btn-primary">게시글 목록</a>
            </div>
        </c:if>
    </div>

    <hr>

    <script>
        function confirmWithdrawal() {
            var confirmWithdraw = confirm("정말 회원 탈퇴하시겠습니까?");
            if (confirmWithdraw) {
                window.location.href = "/user/secession";
            }
        }
    </script>

</div>

</body>
</html>
