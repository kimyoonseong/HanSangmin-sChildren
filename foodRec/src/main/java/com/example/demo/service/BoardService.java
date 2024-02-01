package com.example.demo.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.example.demo.model.dto.BoardDto;
import com.example.demo.model.entity.Board;
import com.example.demo.model.entity.User;
import com.example.demo.repository.BoardRepository;
import com.example.demo.repository.UserRepository;

@Service
public class BoardService {
	
	private BoardRepository brepo;
	private UserRepository urepo;
	
	// controller에서 값을 받아올 생성자
	@Autowired
	public BoardService(BoardRepository brepo, UserRepository urepo) {
		this.brepo = brepo;
		this.urepo = urepo;
	}
	
	public void writeBoard(BoardDto dto) {
		String userId = dto.getUser_Id(); // 누가 글 썼는지 필요
		User user = urepo.getReferenceById(userId);
		Board board = dto.toEntity();
		board.setUser(user);
		brepo.saveAndFlush(board);
	}
	
	// 전체읽기 - 페이지로 끊어서 값을 가지고 오는 방법 존재 - 221p
	public Page<Board> listBoard(int page){
		// 최신순 정렬 - 내림차순
		Pageable pageable = PageRequest.of(page, 5, Direction.DESC, "no");
		Page<Board> pageInfo = brepo.findAll(pageable);
		return pageInfo;
	}

	// 하나읽기
	public Board detailBoard(int no) {
		// 값이 없는 경우 종료되는게 아니라 에러를 제시하기 위해
		Optional<Board> option = brepo.findById(no); // 값의 존재 확인 가능
		if (option.isPresent()) {
			return option.get();
		} else {
			throw new RuntimeException(no + "라는 글은 없습니다.");
		}
	}
		
		// 수정 - put 사용
		
		
		// 삭제
	public void deleteBoard(int no) {	
		brepo.deleteById(no);		
	}

}
