package com.example.demo.model.dto;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.entity.Board;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class BoardDto {
	
	private int no;
	private String title;
	private String content;
	private String user_Id;
	
	private String imagePath;
	private MultipartFile image;
	
	public Board toEntity() {
		Board board = new Board();
		board.setNo(this.getNo());
		board.setTitle(this.getTitle());
		board.setContent(this.getContent());
		board.setImagePath(this.getImagePath());
		return board;
	}

}
