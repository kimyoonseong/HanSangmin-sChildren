<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 등록</title>
    <!-- 부트스트랩 CDN을 사용하는 경우 아래 링크를 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <%@include file="/WEB-INF/view/include/header.jsp"%>

    <div class="container mt-4">
        <h1>게시글 등록</h1>

        <form method="post" action="/board/regist" enctype="multipart/form-data">
            <div class="form-group">
                <label for="user_Id">작성자:</label>
                <input type="text" value="${loginUser.id}" class="form-control" readonly name="user_Id">
            </div>
            <div class="form-group">
                <label for="title">글 제목:</label>
                <input type="text" name="title" class="form-control">
            </div>
            <div class="form-group">
                <label for="content">글 내용:</label>
                <textarea rows="10" cols="100" name="content" class="form-control"></textarea>
            </div>
            <div class="form-group">
                <label for="image">이미지 업로드:</label>
                <input type="file" name="image" class="form-control-file">
            </div>

            <button type="submit" class="btn btn-primary">등록</button>
        </form>
    </div>

    <!-- 부트스트랩 JS 및 Popper.js, jQuery CDN을 사용하는 경우 아래 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
