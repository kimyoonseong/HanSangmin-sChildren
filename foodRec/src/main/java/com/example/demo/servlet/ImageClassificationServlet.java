package com.example.demo.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;

public class ImageClassificationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 이미지 처리 로직
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (isMultipart) {
            try {
                ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
                List<FileItem> items = upload.parseRequest(request);

                for (FileItem item : items) {
                    if (!item.isFormField()) {
                        // 여기에서 item.getInputStream()을 사용하여 이미지를 분류하고 결과를 반환
                        String classificationResult = classifyImage(item.getInputStream());
                        response.setContentType("text/plain");
                        response.setCharacterEncoding("UTF-8");
                        response.getWriter().write(classificationResult);
                        return;
                    }
                }
            } catch (Exception e) {
                throw new ServletException("Image classification failed.", e);
            }
        }
    }

    private String classifyImage(InputStream imageStream) {
        // 이미지 분류 로직 구현
        // 예: return "피자";
        return "가상의 분류 결과";
    }
}