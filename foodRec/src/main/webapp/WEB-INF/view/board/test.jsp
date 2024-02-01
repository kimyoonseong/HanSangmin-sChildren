<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이미지 업로드</title>
    <%@include file="/WEB-INF/view/include/header.jsp"%>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .image-upload-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            margin-top: 20px; /* 상단 여백 조정 */
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f8f9fa; /* 배경색 설정 */
        }

        .image-upload-container input[type="file"] {
            margin-bottom: 10px;
        }

        .recipe-title {
            font-size: 36px; /* 글씨 크기 설정 */
            color: #007bff; /* 부트스트랩 'primary' 색상 */
            margin-top: 20px; /* 상단 여백 설정 */
            padding: 120px; /* 패딩 설정 */
            background-color: #f0f0f0; /* 회색 배경 설정 */
            border-radius: 5px; /* 테두리 둥글게 설정 */
            width: 100%; /* 너비 설정 */
            text-align: center; /* 텍스트 중앙 정렬 */
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="recipe-title">모두의 레시피</div>
        <div class="image-upload-container">
            <form id="uploadForm" enctype="multipart/form-data">
                <input type="file" name="image" required>
                <input type="button" value="Upload Image" onclick="uploadImage();">
            </form>
            <div id="prediction" style="margin-top: 20px;"></div>
            <div id="recipe" style="margin-top: 10px;"></div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function uploadImage() {
            let formData = new FormData($("#uploadForm")[0]);
            $.ajax({
                type: "POST",
                url: "http://127.0.0.1:5000/upload", // Flask 서버 업로드 URL
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function(res) {
                    console.log(res.prediction);
                    $("#prediction").html("<h3>예측된 음식: " + res.prediction + "</h3>").css("font-size", "24px");
                    if (res.recipe) {
                        $("#recipe").html("<p>레시피: " + res.recipe + "</p>");
                    } else {
                        $("#recipe").html("<p>음식 레시피 정보가 없습니다.</p>");
                    }
                },
                error: function(xhr, status, error) {
                    console.error("Error: " + error);
                    $("#prediction").html("<p>분류에 실패했습니다.</p>");
                    $("#recipe").empty();
                }
            });
        }
    </script>
</body>
</html>
