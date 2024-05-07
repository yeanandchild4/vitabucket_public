package com.vitabucket.web.dto;

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
public class AddressDTO {
	private int addr_key;
	private int unum;
	private String addr_name;
	private int addr_zipcode;
	private String addr;
	private String addr_detail;
	private String addr_tel;
	private String addr_req;
	private String addr_reference;
	private String whole_addr;
	
}
