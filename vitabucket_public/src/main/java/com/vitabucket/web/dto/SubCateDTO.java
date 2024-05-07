package com.vitabucket.web.dto;

import org.springframework.stereotype.Component;

import lombok.*;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SubCateDTO {
	private int sub_cat_key;
	private int main_cat_key;
	private String sub_cat_name;
	
	private String main_cat_name;
}
