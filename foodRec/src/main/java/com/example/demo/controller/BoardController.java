package com.example.demo.controller;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.model.dto.BoardDto;
import com.example.demo.model.entity.Board;
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
	// 레시피 목록 출력
	@GetMapping("/list")  // Model - spring ui 입력받은 값을 바로 화면에서 ${ }로 사용할 수 있는 requestScope로 전달
	public String list(@RequestParam(required = false, defaultValue =  "1") Integer page, Model model) { 
		page--;
		//Page<Board> pageInfo = service.listBoard(page);
		model.addAttribute("pageInfo", pageInfo);
		
		log.debug("page: {}",page);
		log.debug("pageInfo: {}",pageInfo);
		return "board/list";

	} 
	//특정 레시피 조회 
	@GetMapping("/detail")
	public String detail(@RequestParam int no, Model model) {
		try {
			Board board = service.detailBoard(no);
			model.addAttribute("board", board);  // ${board.title} ${board.content}
		return "/board/detail";
		} catch (RuntimeException e) { // 없는 글번호를 요청했을 때 
			return "/board/list";  // /WEB-INF/view/list.jsp
		 }
		}
}
