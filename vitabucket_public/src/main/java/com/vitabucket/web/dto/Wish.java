package com.vitabucket.web.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Wish {
	private int wish_key;
	private int unum;
	private int pro_key;
	private String pro_name;
	private String main_img;
	private int pro_price;
}
