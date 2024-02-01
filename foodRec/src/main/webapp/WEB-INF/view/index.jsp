<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>환영합니다!</title>
    <!-- 부트스트랩 CDN을 사용하는 경우 아래 링크를 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body {
            padding: 20px;
            padding-top: 100px;
        }

        hr {
            margin-top: 20px;
            margin-bottom: 20px;
        }

        img {
            max-width: 100%;
            height: auto;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <%@include file="/WEB-INF/view/include/header.jsp"%>

    <div class="container mt-4" style="padding-top: 90px">
        <h1>환영합니다!</h1>
        <p>안녕하세요! 홈페이지에 오신 것을 환영합니다.</p>
        <hr>
        <!-- static 폴더가 기본 폴더가 됨 -->
        <img src="/upload/shin.png" class="img-fluid" alt="Shin 이미지">
    </div>

    <!-- 부트스트랩 JS 및 Popper.js, jQuery CDN을 사용하는 경우 아래 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
