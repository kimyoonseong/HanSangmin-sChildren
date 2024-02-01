package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.entity.Board;
//
public interface BoardRepository  extends JpaRepository<Board,Integer>{

	List<Board> findByTitleContaining(String query);

}
