package com.vitabucket.web.dto;

import java.sql.Date;
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
public class OrderDetail {
	private int od_key;
	private int to_key;
	private int pro_key;
	private String pro_name;
	private String main_img;
	private int pro_cnt;
	private int pro_total;
	private Timestamp to_date;
	private boolean reviewd;
}
