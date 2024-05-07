package com.vitabucket.web.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
	private int pro_key;
	private Product_ImgDTO imgs;
	private int sub_cat_key;
	private String pro_name;
	private String pro_manufacturer;
	private int pro_price;
	private int pro_stock;
	private String pro_comment;
	private java.sql.Date pro_best_by;
	private String pro_serving_size;
	private String pro_servings_percont;
	private String pro_main_ing;
	private String pro_other_ing;
	private String pro_warnings;
	private String pro_allergy;
	private int pro_hit;
	private String sub_cat_name;
	private String main_cat_name;
	private int main_cat_key;
	
	public ProductDTO(int pro_key, int sub_cat_key, String pro_name, String pro_manufacturer, int pro_price,
			int pro_stock, String pro_comment, java.sql.Date pro_best_by, String pro_serving_size, String pro_servings_percont,
			String pro_main_ing, String pro_other_ing, String pro_warnings, String pro_allergy, int pro_hit) {
		this.pro_key = pro_key;
		this.sub_cat_key = sub_cat_key;
		this.pro_name = pro_name;
		this.pro_manufacturer = pro_manufacturer;
		this.pro_price = pro_price;
		this.pro_stock = pro_stock;
		this.pro_comment = pro_comment;
		this.pro_best_by = pro_best_by;
		this.pro_serving_size = pro_serving_size;
		this.pro_servings_percont = pro_servings_percont;
		this.pro_main_ing = pro_main_ing;
		this.pro_other_ing = pro_other_ing;
		this.pro_warnings = pro_warnings;
		this.pro_allergy = pro_allergy;
		this.pro_hit = pro_hit;
	}
	
	
	
	
}
