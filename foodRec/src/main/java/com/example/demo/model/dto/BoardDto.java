package com.example.demo.model.dto;

import org.springframework.web.multipart.MultipartFile;

import com.example.demo.model.entity.Board;

import jakarta.persistence.Column;
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
	private int likeRecipe;
	private int unlikeRecipe;
	
	public Board toEntity() {
		Board board = new Board();
		board.setNo(this.getNo());
		board.setTitle(this.getTitle());
		board.setContent(this.getContent());
		board.setImagePath(this.getImagePath());
		board.setLikeRecipe(this.getLikeRecipe());
		board.setUnlikeRecipe(this.getUnlikeRecipe());
		return board;
	}

}
