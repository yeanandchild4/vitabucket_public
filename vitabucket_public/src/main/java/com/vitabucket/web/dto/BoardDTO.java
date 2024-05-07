package com.vitabucket.web.dto;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class BoardDTO {
	private int board_key;
	private int unum;
	private String name;
	private int pro_key;
	private int od_key;
	private String pro_name;
	private String main_img;
	private String board_type;
	private String board_title;
	private Date board_posted;
	private String board_content;
	private List<BattachDTO> attachs;
	private CommentDTO comment;
	private boolean answer_complete;
	
	public BoardDTO(int board_key, int unum, int pro_key, String board_type, String board_title, java.sql.Date board_posted,
			String board_content) {
		this.board_key = board_key;
		this.unum = unum;
		this.pro_key = pro_key;
		this.board_type = board_type;
		this.board_title = board_title;
		this.board_posted = board_posted;
		this.board_content = board_content;
	}
}
