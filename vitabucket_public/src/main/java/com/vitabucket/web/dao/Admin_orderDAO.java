package com.vitabucket.web.dao;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.GetMapping;

import com.vitabucket.web.dto.*;
import com.vitabucket.web.mapper.*;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class Admin_orderDAO {
	@Autowired
	Admin_orderMapper mapper;
	
	//검색
	public List<TotalOrder> oSearch(HashMap<String,String> map){
		return mapper.oSearch(map);
	}
	
	//주문 전체리스트
	public List<TotalOrder> total_Oder(){
		return mapper.total_Oder();
	}
	
	
	//주문 전체 번호
	public List<OrderDetail> order(String to_key){	
		return mapper.order(to_key);
	}

	//주문 전체 객체
	public TotalOrder total(String to_key) {
		return mapper.total(to_key);
	}
	
	
	//주문 상세 수정
	public int detail_edit(String to_key,String to_status) {
		log.info("dao값: "+ mapper.detail_edit(to_key,to_status));
		return mapper.detail_edit(to_key,to_status);
	}
	
	
	
	
	
	//주문 입금대기
	public List<TotalOrder> pay_wating() {
		return mapper.pay_wating();
	}
	
	//주문 입금완료
	public List<TotalOrder> order_pay_ok() {
		return mapper.order_pay_ok();
	}
	
	//주문 배송중
	public List<TotalOrder> order_sending() {
		return mapper.order_sending();
	}
	
	//주문 배송완료
	public List<TotalOrder> order_delivered() {
		return mapper.order_delivered();
	}
	
	//취소,환불,반품 등
	public List<TotalOrder> order_etc() {
		return mapper.order_etc();
	}
	
	
}

