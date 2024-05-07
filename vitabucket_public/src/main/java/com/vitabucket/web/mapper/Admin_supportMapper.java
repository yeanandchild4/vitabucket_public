package com.vitabucket.web.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;
import com.vitabucket.web.dto.*;

import retrofit2.http.DELETE;



@Mapper
public interface Admin_supportMapper {
	
	//문의게시판
	public List<BoardDTO>inquiry_list();
	
	//리뷰게시판
	public List<BoardDTO>review_list();
	
	//리뷰+리뷰사진
	@Select("SELECT * FROM vita_board_attach board WHERE board_key=#{board_key}")
	public List<BattachDTO> bAttach(int board_key);
	
	//문의_상세
	@Select("SELECT * FROM VITA_BOARD WHERE board_type='inquiry' AND board_key=${board_key}")
	public BoardDTO inquiry(int board_key);	
	
	
	//문의_상세_답변보기
	public CommentDTO comment(int board_key);
	
	//문의 상세 답변 수정
	public BoardDTO board_com(int comm_key);

	//문의 상세_수정_저장
	@Update("UPDATE VITA_COMMENT SET COMMENTS=#{comments} WHERE comm_key=#{comm_key}")
	public int in_updated(CommentDTO com);
	
	//문의 상세_삭제
	@Delete("DELETE FROM VITA_COMMENT WHERE comm_key = #{comm_key}")
	public int in_Del(int comm_key);	
	
	//문의_상세_답변
	public int in_add(CommentDTO com);	
	
	
	//리뷰 상세보기
	public List<BoardDTO>review_detail(int board_key);
	
}
