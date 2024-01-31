package com.example.demo.model.entity;

import com.example.demo.dto.BoardDto;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

public class Board {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)//자동 글번호 생성
	private int no;// 게시판 글 번호
	private String title;//레시피 글 제목
	private String content;//레시피
	@ManyToOne
	@JoinColumn(name="user_id")//Select * from user where id=??
//	User user;
	public BoardDto toDto() {
		BoardDto dto=new BoardDto();
		dto.setNo(this.no);// 글번호 넘기기
		dto.setTitle(this.getTitle);
		dto.setContent(this.getContent());
		dto.setUser_Id(this.getUser().getId());
		return dto;
	}
}
