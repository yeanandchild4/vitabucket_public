package com.vitabucket.web.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(exclude = {"cart_key","unum","pro_cnt","pro_price","pro_stock","pro_total","pro_name","main_img"})
public class CartDTO {
	private int cart_key;
	private int unum;
	private int pro_key;
	private int pro_cnt;
	private int pro_price;
	private int pro_stock;
	private int pro_total;
	private String pro_name;
	private String main_img;
}