package com.example.demo.model.dto;

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
	private int like;
	private int unlike;
	public Board toEntity() {
		Board board = new Board();
		board.setNo(this.getNo());
		board.setTitle(this.getTitle());
		board.setContent(this.getContent());
		board.setLike(this.getLike());
		board.setUnlike(this.getUnlike());
		return board;
	}

}
