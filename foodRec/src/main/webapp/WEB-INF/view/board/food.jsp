<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Image Upload</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
    function uploadImage(){
        let formData = new FormData($("#uploadForm")[0]);
        $.ajax({
            type: "POST",
            url: "http://127.0.0.1:5000/upload", // URL 수정
            data: formData,
            cache: false,
            contentType: false,
            processData: false,
            success: function(res) {
                // 성공적으로 응답을 받았을 때의 처리 코드
                console.log(res.prediction);
    	        $("#prediction").text(res.prediction);
    	        result=res.prediction;
    	        sendAnimalToJavaBackend(res.prediction)
    	        let animalinfoHTML = "<h3>음식 레시피:</h3>";
    	        
    	        
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
    <div id="prediction"></div>
</body>
</html>