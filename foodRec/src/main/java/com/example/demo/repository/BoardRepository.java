package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.entity.Board;

public interface BoardRepository  extends JpaRepository<Board,Integer>{

}
