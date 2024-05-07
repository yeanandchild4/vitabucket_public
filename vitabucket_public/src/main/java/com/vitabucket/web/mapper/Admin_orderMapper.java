package com.vitabucket.web.mapper;

import java.util.*;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.GetMapping;

import com.vitabucket.web.dto.*;

import lombok.extern.slf4j.Slf4j;


@Mapper
public interface Admin_orderMapper {
	
	//검색
	public List<TotalOrder> oSearch(HashMap<String,String> map);

	//주문 전체 리스트
	@Select("SELECT t.*,u.name FROM VITA_TOTALORDER t INNER JOIN VITA_CUSTOMER u ON t.unum=u.unum ORDER BY to_key DESC")
	public List<TotalOrder> total_Oder();	

	
	//주문 상세 번호
	@Select("SELECT o.*,img.* FROM VITA_ORDERDETAIL o INNER JOIN VITA_PRODUCT_IMG img ON o.PRO_KEY=img.PRO_KEY WHERE to_key=#{to_key} ORDER BY to_key DESC")
	public List<OrderDetail> order(String to_key);
	
	//주문 전체 객체 
	@Select("SELECT t.*,u.name FROM VITA_TOTALORDER t INNER JOIN VITA_CUSTOMER u ON t.unum=u.unum WHERE to_key=#{to_key}")
	public TotalOrder total(String to_key);
	
	
	//주문 상세 수정
	public int detail_edit(String to_key,String to_status);
	
	
	
	//주문 입금대기
	@Select("SELECT t.*,u.name FROM VITA_TOTALORDER t INNER JOIN VITA_CUSTOMER u ON t.unum=u.unum WHERE TO_STATUS='입금대기' ORDER BY to_key DESC")
	public List<TotalOrder> pay_wating(); 
	
	//주문 결제완료
	@Select("SELECT t.*,u.name FROM VITA_TOTALORDER t INNER JOIN VITA_CUSTOMER u ON t.unum=u.unum WHERE TO_STATUS='입금완료' OR TO_STATUS='paid' ORDER BY to_key DESC")
	public List<TotalOrder> order_pay_ok();
	
	//주문 배송중
	@Select("SELECT t.*,u.name FROM VITA_TOTALORDER t INNER JOIN VITA_CUSTOMER u ON t.unum=u.unum WHERE TO_STATUS='배송중' ORDER BY to_key DESC")
	public List<TotalOrder> order_sending();
	
	//주문 배송완료
	@Select("SELECT t.*,u.name FROM VITA_TOTALORDER t INNER JOIN VITA_CUSTOMER u ON t.unum=u.unum WHERE TO_STATUS='배송완료' ORDER BY to_key DESC")
	public List<TotalOrder> order_delivered();
	
	//취소,환불,반품 등
	@Select("SELECT t.*,u.name FROM VITA_TOTALORDER t INNER JOIN VITA_CUSTOMER u ON t.unum=u.unum WHERE TO_STATUS LIKE '%취소%' OR TO_STATUS LIKE '%환불%' OR TO_STATUS LIKE '%반품%' ORDER BY to_key DESC")
	public List<TotalOrder> order_etc();
	
	
}
