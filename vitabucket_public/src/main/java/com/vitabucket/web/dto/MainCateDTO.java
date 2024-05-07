package com.vitabucket.web.dto;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.*;

@Component
@Data
@AllArgsConstructor
@NoArgsConstructor
public class MainCateDTO {
	private int main_cat_key;
	private String main_cat_name;
	private List<SubCateDTO> sub;
	
	public MainCateDTO(int main_cat_key, String main_cat_name) {
		this.main_cat_key = main_cat_key;
		this.main_cat_name = main_cat_name;
	}
	
	
}
