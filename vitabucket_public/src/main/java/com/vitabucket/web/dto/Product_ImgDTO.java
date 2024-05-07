package com.vitabucket.web.dto;

import org.springframework.stereotype.Component;

import lombok.*;

@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class Product_ImgDTO {
	private int pro_img_key;
	private int pro_key;
	private String main_img;
	private String main_img_addr;
	private String img1;
	private String img1_addr;
	private String img2;
	private String img2_addr;
	private String img3;
	private String img3_addr;
	private String img4;
	private String img4_addr;
	
	
}
