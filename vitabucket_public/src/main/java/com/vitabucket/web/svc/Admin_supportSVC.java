package com.vitabucket.web.svc;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.vitabucket.web.dao.Admin_supportDAO;
import com.vitabucket.web.dto.BattachDTO;
import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.CommentDTO;

@Service
public class Admin_supportSVC {
	@Autowired
	private Admin_supportDAO dao;

	//문의게시판
	public List<BoardDTO>inquiry_list(){
		List<BoardDTO> blist = dao.inquiry_list();		
		for(BoardDTO b : blist) {
			b.setComment(dao.comment(b.getBoard_key()));
		}
		return blist;
	}
	
	//리뷰+리뷰사진게시판
	public List<BoardDTO>review_list(){		
		List<BoardDTO> blist = dao.review_list();		
		for(BoardDTO b : blist) {
			b.setAttachs(dao.bAttach(b.getBoard_key()));
		}
		return blist;
	}
	
	//문의_상세
	public BoardDTO inquiry(int board_key){
		return dao.inquiry(board_key);
	}
	
	//문의_상세_답변보기
	public CommentDTO comment(int board_key){
		return dao.comment(board_key);
	}
	
	//문의 상세 답변 수정보기
	public BoardDTO board_com(int comm_key){
		return dao.board_com(comm_key);
	}

	
	//문의 상세_수정_저장
	public boolean in_updated(CommentDTO com) {
		return dao.in_updated(com)>0;
	}
	
	//문의 상세_삭제
	public boolean in_Del(int comm_key) {
		return dao.in_Del(comm_key)>0;
	}
	
	
	//문의_상세_답변 추가
	public boolean in_add(CommentDTO com){
		return dao.in_add(com)>0;
	}
	
	//리뷰 상세보기
	public List<BoardDTO>review_detail(int board_key){
		List<BoardDTO> blist = dao.review_detail(board_key);	
		for(BoardDTO b : blist) {
			b.setAttachs(dao.bAttach(board_key));
		}
		return blist;
	}


	
}
