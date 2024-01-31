package com.example.demo.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.dto.UserDto;
import com.example.demo.model.entity.User;
import com.example.demo.repository.UserRepository;

import jakarta.transaction.Transactional;

@Service
public class UserService {
	
	private UserRepository urepo;
	
	@Autowired
	public UserService (UserRepository urepo) {
		this.urepo = urepo;
	}
	@Transactional
	public void join(UserDto dto) {
		User user = dto.toEntity();
		if (urepo.findById(user.getId()).isPresent()) {
		// 이미 존재하는 회원 에러
			throw new RuntimeException("이미 존재하는 회원입니다.");
		}
		
		// 아니라면 저장
		urepo.saveAndFlush(user);
		
	}
	public UserDto login(UserDto dto) {
		Optional<User> result = urepo.findById(dto.getId()); //isPresent()
		
		if (result.isPresent()) {
			User selected = result.get();
			if (selected.getPass().equals(dto.getPass())) {
				return selected.toDto();
			}
		}
		
		throw new RuntimeException("아이디나 비밀번호를 확인해주세요.");
	}
}

