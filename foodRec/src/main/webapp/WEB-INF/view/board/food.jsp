<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/view/include/header.jsp"%>

    <meta charset="UTF-8">
    <title>Image Upload</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    function uploadImage(){
        let formData = new FormData($("#uploadForm")[0]);
        $.ajax({
            type: "POST",
            url: "http://127.0.0.1:5000/upload", // Flask 서버 업로드 URL
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function(res) {
                console.log(res.prediction); // 콘솔에 예측 결과 로깅
                $("#prediction").html(res.prediction + "</h3>").css("font-size", "24px");
                // 레시피 정보를 표시하는 코드
                if (res.recipe) { // 응답에 레시피 정보가 포함되어 있는 경우
                    $("#recipe").html(res.recipe + "</p>"); // 레시피 정보 표시
                } else {
                    $("#recipe").html("<h3>음식 레시피 정보가 없습니다.</h3>"); // 레시피 정보가 없는 경우의 처리
                }
            },
            error: function(xhr, status, error) {
                console.error("Error: " + error); // 에러 로깅
                $("#prediction").html("<p>분류에 실패했습니다.</p>"); // 에러 메시지 표시
                $("#recipe").empty(); // 기존에 표시된 레시피 정보 제거
            }
        });
    }
    </script>
</head>
<body>
    <form id="uploadForm" enctype="multipart/form-data">
        <input type="file" name="image" />
        <input type="button" value="Upload Image" onclick="uploadImage();" />
    </form>
    <div id="prediction"></div> <!-- 예측된 클래스 이름을 표시할 div -->
    <div id="recipe"></div> <!-- 레시피 정보를 표시할 div -->
</body>
</html>
