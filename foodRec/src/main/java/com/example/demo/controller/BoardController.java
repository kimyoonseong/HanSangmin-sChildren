package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.dto.BoardDto;
import com.example.demo.service.BoardService;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {
	private BoardService service;
	
	//객체 생성자
	public BoardController(BoardService service) {
		this.service=service;
	}
	// 레시피를 form으로 받아서 전달
	@PostMapping("/regist") 
	public String registBoard(@ModelAttribute BoardDto board) { 
		//service.writeBoard(board);
		return "redirect:/board/list";
	}
}
