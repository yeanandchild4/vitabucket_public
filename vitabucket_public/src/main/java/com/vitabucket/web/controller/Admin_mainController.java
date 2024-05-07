package com.vitabucket.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.vitabucket.web.svc.Admin_orderSVC;


@Controller
@RequestMapping("/vitabucket/admin")
public class Admin_mainController {
	@Autowired
	private Admin_orderSVC orSvc;
	
	//메인화면
	@GetMapping("/main")
	public String main(Model m) {
		//전체 주문리스트
		m.addAttribute("tolist",orSvc.total_Oder());
		
		//입금대기
		m.addAttribute("pay_wat",orSvc.pay_wating());
		//입금완료
		m.addAttribute("order_pay",orSvc.order_pay_ok());
		//배송중
		m.addAttribute("order_send",orSvc.order_sending());
		//배송완료
		m.addAttribute("order_delive",orSvc.order_delivered());
		//취소,환불,반품
		m.addAttribute("order_etc",orSvc.order_etc());
		return "admin/Admin_main";
	}
	
	

}
