package com.vitabucket.web.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitabucket.web.dto.BattachDTO;
import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.CommentDTO;
import com.vitabucket.web.mapper.Admin_supportMapper;

@Repository
public class Admin_supportDAO {
	@Autowired
	Admin_supportMapper mapper;
	
	
	//문의게시판
	public List<BoardDTO> inquiry_list() {		 
		return mapper.inquiry_list();
	}
	
	//리뷰게시판
	public List<BoardDTO> review_list() {		 
		return mapper.review_list();
	}
	
	//리뷰사진
	public List<BattachDTO> bAttach(int board_key){
		return mapper.bAttach(board_key);
	}
	
	//문의_상세
	public BoardDTO inquiry(int board_key) {		 
		return mapper.inquiry(board_key);
	}
		
	//문의_상세_답변
	public int in_add(CommentDTO com) {
		return mapper.in_add(com);
	}
	
	
	//문의_상세_답변보기
	public CommentDTO comment(int board_key){
		return mapper.comment(board_key);
	}
	
	//문의 상세 답변 수정보기
	public BoardDTO board_com(int comm_key) {
		return mapper.board_com(comm_key);
	}
	
	//문의 상세_수정_저장
	public int in_updated(CommentDTO com) {
		return mapper.in_updated(com);
	}
	
	//문의 상세_삭제
	public int in_Del(int comm_key) {
		return mapper.in_Del(comm_key);
	}

	//리뷰 상세보기
	public List<BoardDTO>review_detail(int board_key){
		return mapper.review_detail(board_key);
	}
	
}

