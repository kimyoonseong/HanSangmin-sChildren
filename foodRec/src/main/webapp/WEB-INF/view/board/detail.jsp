<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세</title>
    <!-- 부트스트랩 CDN을 사용하는 경우 아래 링크를 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <%@include file="/WEB-INF/view/include/header.jsp"%>

    <div class="container mt-4" style="padding-top: 90px">
        <h1 class="mb-4">게시글 상세</h1>
        <form method="post" action="/board/update" enctype="multipart/form-data">
            <div class="form-group">
                <input type="hidden" name="user_Id" value="${board.user.id}" class="form-control">
            </div>
            <div class="form-group">
                <label for="no">글 번호:</label>
                <input type="text" name="no" value="${board.no}" class="form-control" readonly>
            </div>
            <div class="form-group">
                <label for="name">작성자:</label>
                <input type="text" value="${board.user.name}" class="form-control" disabled>
            </div>
            <div class="form-group">
                <label for="title">제목:</label>
                <input type="text" name="title" value="${board.title}" class="form-control">
            </div>
            <!-- CKEditor 사용을 위한 textarea 및 히든 필드 추가 -->
			<div class="form-group">
    <label for="content">내용:</label>
    
        <div id="renderedContent">${board.content}</div>
    </div>
</div>

            <!-- 이미지 추가 -->
            <div class="form-group">
                <c:if test="${not empty board.imagePath}">
                    <img src="<%= request.getContextPath() %>/upload/${board.imagePath}" class="img-fluid" alt="이미지" width="300px">
                </c:if>
                <c:if test="${empty board.imagePath}">
                    <span>이미지 없음</span>
                </c:if>
            </div>

            <c:if test="${not empty loginUser && loginUser.id == board.user.id}">
                <button type="submit" class="btn btn-primary">수정</button>
                <a href="/board/delete?no=${board.no}" class="btn btn-danger">삭제</a>
            </c:if>
        </form>
       
        			<form method="POST" action="/board/recommend">
        				<input type="hidden" name="no" value="${board.no}">
					    <button type="submit" class="btn btn-primary">추천</button>
					    
					</form>
					<form method="POST" action="/board/notrecommend">
        				<input type="hidden" name="no" value="${board.no}">
					    <button type="submit" class="btn btn-danger">비추</button>
					    
					</form>
			
    </div>

    <!-- 부트스트랩 JS 및 Popper.js, jQuery CDN을 사용하는 경우 아래 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
