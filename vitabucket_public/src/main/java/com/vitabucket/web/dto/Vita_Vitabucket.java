package com.vitabucket.web.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class Vita_Vitabucket {
	private String co_name;
	private String ceo_name;
	private String co_addr;
	private String co_tel;
	private String co_email;
	private String co_fax;
	private String bin_no;
	private String co_anniversary;

}
