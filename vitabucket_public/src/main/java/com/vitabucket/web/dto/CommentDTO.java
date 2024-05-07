package com.vitabucket.web.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
	private int comm_key;
	private int unum;
	private int board_key;
	private String comments;
	private Date comm_date;
}
