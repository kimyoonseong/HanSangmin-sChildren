package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.model.dto.UserDto;
import com.example.demo.service.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {
	
	private UserService service;
	// 생성자
	public UserController (UserService service) {
		this.service = service;
	}
	// 회원가입 빈 화면으로 전달
	@GetMapping("/join")
	public String joinFrom() {
		return "user/join";
	}
	
	// 회원가입 form에서 받은 정보를 전달
	@PostMapping("/join")
	public String doJoin(@ModelAttribute UserDto dto, Model model) {
		try {
			service.join(dto);
			return "redirect:/"; // 기본적으로는 localhost:8080/ 주소로 이동을 하게 된다. 
		} catch (RuntimeException e) {
			model.addAttribute("msg", dto.getId() + "는 사용할 수 없습니다.");
			return "user/join";
		}
		
	}
	
	@PostMapping("/login")
	public String login(@ModelAttribute UserDto dto, Model model, HttpSession session) {
		try {
			UserDto result = service.login(dto);
			session.setAttribute("loginUser", result);
			return "redirect:/";
		} catch (Exception e) {
			model.addAttribute("loginmsg", e.getMessage());
			return "index";
		}
	}
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/secession")
	public String secession(HttpSession session, Model model) {
		UserDto dto = (UserDto)session.getAttribute("loginUser");// 삭제될 id
		String d_id = dto.getId();
		service.deleteUser(d_id);
		session.invalidate();

		return "redirect:/";
	}
}
