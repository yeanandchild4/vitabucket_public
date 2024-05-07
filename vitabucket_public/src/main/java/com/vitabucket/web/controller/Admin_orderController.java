package com.vitabucket.web.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.vitabucket.web.dto.TotalOrder;
import com.vitabucket.web.svc.*;


@Controller
@RequestMapping("/vitabucket/admin/order")
public class Admin_orderController {
	@Autowired
	private Admin_orderSVC svc;
		
	//주문 전체 리스트
	@GetMapping("")
	public String order(Model m) {
		m.addAttribute("tolist",svc.total_Oder());
		
		return "admin/first_page/order";
	}
	
	//주문 전체 번호
	@GetMapping("/detail/{to_key}")
	public String order_detail(Model m,@PathVariable("to_key") String to_key) {
		m.addAttribute("olist",svc.order(to_key));
		m.addAttribute("to",svc.total(to_key));
		return "admin/second_page/order_detail";
	}
	
	//검색
	@PostMapping("")
	public String search(@RequestParam HashMap<String,String> map, Model m){
		m.addAttribute("tolist",svc.oSearch(map));
		return "admin/first_page/order";
	}	
	
	
	//주문 상세정보 수정저장
	@PostMapping("/edit/{to_key}")
	@ResponseBody
	public Map<String,Object> detail_edit(@PathVariable("to_key") String to_key,String to_status){
		Map<String,Object> map = new HashMap<>();
		map.put("order_edit",svc.detail_edit(to_key,to_status));
		return map;
	}
	
	
	
	/*주문목록 여러개로 쪼개기*/
	//주문 입금대기
	@GetMapping("/pay_wating")
	public String pay_wating(Model m) {
		m.addAttribute("tolist",svc.pay_wating());
		return "admin/second_page/order_pay_wating";
	}
	
	//주문 입금완료
	@GetMapping("/pay_ok")
	public String pay_ok(Model m) {
		m.addAttribute("tolist",svc.order_pay_ok());
		return "admin/second_page/order_pay_ok";
	}
	
	//주문 배송중
	@GetMapping("/sending")
	public String sending(Model m) {
		m.addAttribute("tolist",svc.order_sending());
		return "admin/second_page/order_sending";
	}
	
	//주문 배송완료
	@GetMapping("/delivered")
	public String delivered(Model m) {
		m.addAttribute("tolist",svc.order_delivered());
		return "admin/second_page/order_delivered";
	}
	
	//취소,환불,반품 등
	@GetMapping("/etc")
	public String etc(Model m) {
		m.addAttribute("tolist",svc.order_etc());
		return "admin/second_page/order_etc";
	}	
	

	
}
