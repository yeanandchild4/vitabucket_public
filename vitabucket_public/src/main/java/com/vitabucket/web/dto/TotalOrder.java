package com.vitabucket.web.dto;

import java.math.BigDecimal;
import java.sql.Timestamp;

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
public class TotalOrder {
	private String imp_uid;
	private String to_key;
	private int unum;
	private String name;
	private Timestamp to_date;
	private BigDecimal to_total;
	private String to_status;
	private String to_payment;
	private String to_name;
	private int to_addr_key;
	private int to_zipcode;
	private String to_addr;
	private String to_addr_detail;
	private String whole_addr;
	private String to_tel;
	private String to_req;
	private int to_pro_cnt;
	private String to_pro_img;
	private String to_pro_name;
	private String to_refund_reason;
}