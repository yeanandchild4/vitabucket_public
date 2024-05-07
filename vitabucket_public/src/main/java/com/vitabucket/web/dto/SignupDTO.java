package com.vitabucket.web.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Component
@AllArgsConstructor
@RequiredArgsConstructor
public class SignupDTO {
	
	private int unum;
	private String name;
	private String user_id;
	private String user_pwd;
	private String user_email;
	
	private String year;
	private String month;
	private String day;
	private  java.sql.Date birthday;
	
	private String user_phone;

	private String addr_zipcode;
	private String addr;
	private String addr_detail;
	private String addr_reference;
	
	private String whole_addr;
	
	public SignupDTO(String name, String user_email) {
		super();
		this.name = name;
		this.user_email = user_email;
	}
	


	
	
}
