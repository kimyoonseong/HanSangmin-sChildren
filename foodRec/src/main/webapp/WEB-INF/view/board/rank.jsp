<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글목록</title>
    <!-- 부트스트랩 CDN을 사용하는 경우 아래 링크를 추가 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <%@include file="/WEB-INF/view/include/header.jsp"%>

    <div class="container mt-4" style="padding-top: 90px">
        <h1>* 레시피 추천 순위 *</h1>

        <table class="table">
            <thead>
                <tr>
                    
                    <th>제목</th>
                    <th>작성자</th>
                    <th>추천수</th>
                    <th>비추천수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${pageInfo.content}" var="board">
                    <tr>
                        <td><a href="/board/detail?no=${board.no}">${board.title}</a></td>
                        <td>${board.user.name}</td>
                        <td>${board.likeRecipe}</td>
                         <td>${board.unlikeRecipe}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <form action="/board/rank" method="get" class="form-inline">
            <div class="form-group mr-2">
                <label for="page">페이지:</label>
                <input type="text" name="page" class="form-control" value="${pageInfo.number + 1}">
            </div>
            <div class="form-group">
                <label for="totalPages">/ ${pageInfo.totalPages}</label>
            </div>
            <button type="submit" class="btn btn-primary">이동</button>
        </form>
    </div>

    <!-- 부트스트랩 JS 및 Popper.js, jQuery CDN을 사용하는 경우 아래 스크립트 추가 -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
