package com.vitabucket.web.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class Vita_Terms {
	private int terms_key; 
	private String terms_name; 
	private String terms_content; 
	private Character terms_required;
}
