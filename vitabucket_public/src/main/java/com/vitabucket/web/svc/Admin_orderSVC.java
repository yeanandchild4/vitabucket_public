package com.vitabucket.web.svc;

import java.util.*;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.vitabucket.web.dao.Admin_orderDAO;
import com.vitabucket.web.dto.*;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class Admin_orderSVC {
	@Autowired
	private Admin_orderDAO dao;

	//검색
	public List<TotalOrder> oSearch(HashMap<String,String> map){
		return dao.oSearch(map);
	}	
	
	//주문 전체 리스트
	public List<TotalOrder> total_Oder(){
		return dao.total_Oder();
	}


	//주문 상세
	public List<OrderDetail> order(String to_key){
		return dao.order(to_key);
	}
	
	//주문 전체 번호 리스트
	public TotalOrder total(String to_key) {
		return dao.total(to_key);
	}
	
	//주문상세 수정
	public boolean detail_edit(String to_key,String to_status){
		return dao.detail_edit(to_key,to_status)>0;
	}
	
	
	//주문 입금대기
	public List<TotalOrder> pay_wating() {
		return dao.pay_wating();
	}
	
	//주문 입금완료
	public List<TotalOrder> order_pay_ok() {
		return dao.order_pay_ok();
	}
	
	//주문 배송중
	public List<TotalOrder> order_sending() {
		return dao.order_sending();
	}
	
	//주문 배송완료
	@GetMapping("/order_delivered")
	public List<TotalOrder> order_delivered() {
		return dao.order_delivered();
	}
	
	//취소,환불,반품 등
	@GetMapping("/order_etc")
	public List<TotalOrder> order_etc() {
		return dao.order_etc();
	}
	
	
	
	

}
