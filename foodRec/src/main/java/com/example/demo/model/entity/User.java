package com.example.demo.model.entity;

import java.util.List;

import com.example.demo.model.dto.UserDto;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

//@Builder
@Data
@NoArgsConstructor
@Entity
@ToString(exclude="boards")
public class User {
	@Id
	private String id;
	private String name;
	private String pass;
	private String grade;
	
	// Board와 연결
	@OneToMany(mappedBy="Board")
//	List<Board> boards;
	
	// entity ->dto to Dto
	public UserDto toDto() {
		UserDto dto = new UserDto();
		dto.setId(this.getId());
		dto.setName(this.getName());
		dto.setPass(this.getPass());
		dto.setGrade(this.getName());
		return dto;
	}
	
}
