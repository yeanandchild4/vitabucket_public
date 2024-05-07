package com.vitabucket.web.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class InfoDTO {
	private int unum;
	private String name;
	private String user_id;
	private String user_pwd;
	private String user_email;
	private Date user_birth;
	private boolean withdraw;
	private String user_phone;
	private String user_authority;
	private AddressDTO user_addr;
	
}
