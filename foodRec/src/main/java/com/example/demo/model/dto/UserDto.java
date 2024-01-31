package com.example.demo.model.dto;

import com.example.demo.model.entity.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {
	private String id; // userid
	private String name; // username
	private String pass; // pw
	private String grade; // 등급
	
	//Dto -> Entity로 데이터 전송
	public User toEntity() {
		User user = new User();
		user.setId(this.getId());
		user.setName(this.getName());
		user.setPass(this.getPass());
		user.setGrade(this.getGrade());
		return user;
		
	}

	
	
	
}
