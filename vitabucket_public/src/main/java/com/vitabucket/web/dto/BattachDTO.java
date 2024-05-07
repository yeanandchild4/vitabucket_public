package com.vitabucket.web.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BattachDTO {

	private int b_attach_key;
	private int board_key;
	private String fname;
	private String savedfname;
}
