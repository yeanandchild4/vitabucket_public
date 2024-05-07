package com.vitabucket.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.Payment;
import com.vitabucket.web.dto.CartDTO;
import com.vitabucket.web.dto.OrderDetail;
import com.vitabucket.web.dto.PrincipalDetails;
import com.vitabucket.web.dto.TotalOrder;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.svc.CartSvc;
import com.vitabucket.web.svc.MyPageSvc;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartSvc cs;
	
	@Autowired
	private MyPageSvc ms;

	
//장바구니
	//장바구니 목록
	@GetMapping("")
	public String cartList(@AuthenticationPrincipal PrincipalDetails user,Model m) {
		m.addAttribute("cartAddr",cs.cartAddr(user.getUser().getUnum()));
		m.addAttribute("list",cs.cartList(user.getUser().getUnum()));
		m.addAttribute("total",0);
		return "cart/cart";
	}
	
	//선택삭제
	@DeleteMapping("/deleteCart")
	@ResponseBody
	public Map<String, Object> deleteCart(@RequestParam("checked") List<Integer> cart_keys, 
			@AuthenticationPrincipal PrincipalDetails user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", cs.deleteCart(cart_keys));
		} catch (Exception e) {
			e.printStackTrace();
			map.put("ok", false);
		}
		return map;
	}
	
	//상품한개 삭제
	@DeleteMapping("/deleteP")
	@ResponseBody
	public Map<String, Object> deleteCart(@RequestParam("cart_key") int cart_key) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", cs.deleteP(cart_key));
		} catch (Exception e) {
			map.put("ok", false);
		}
		return map;
	}
	
	//수량조절
	@PutMapping("/modifyCnt")
	@ResponseBody
	public Map<String, Object> modifyCnt(CartDTO cart) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ok", cs.modifyCnt(cart));
		return map;
	}
	
	//총가격 계산
	@PostMapping("/calculTotal")
	@ResponseBody
	public String calculTotal(@RequestParam(value="checked[]", required = false) List<Integer> cart_keys) {
			if(cart_keys==null) return "{\"pro_total\":0}";
			else {
				int pro_total = cs.cartTotal(cart_keys);
				return "{\"pro_total\":"+pro_total+"}";
			}
	}
	
	//한상품의 총가격 계산
	@PostMapping("/calculPtotal")
	@ResponseBody
	public String calculTotal(@RequestParam int cart_key) {
			return "{\"ptotal\":"+cs.pTotal(cart_key)+"}";
	}
	
	//구매 버튼 클릭
	@PostMapping("/checkout")
	public String buy(@AuthenticationPrincipal PrincipalDetails user, 
			@RequestParam("checked") List<Integer> cart_keys,
			Model m) {
		m.addAttribute("cart_keys",cart_keys);
		m.addAttribute("cart_list",cs.checkoutList(cart_keys));		
		m.addAttribute("info",ms.getUserInfo(user.getUser().getUnum()));
		m.addAttribute("total",cs.cartTotal(cart_keys));
		return "cart/checkout";
	}
	
	//찜목록에서 추가
	@PostMapping("/addCartWish")
	@ResponseBody
	public Map<String, Object> addCart(CartDTO cart, @AuthenticationPrincipal PrincipalDetails user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", cs.addCart(cart, user.getUser()));
		} catch (Exception e) {
			e.printStackTrace();
			map.put("ok",false);
		}
		return map;
	}
	
	
	
//구매
	//사전검증
	@PostMapping("/payment_prepare")
	@ResponseBody
	public Map<String, Object> payment_prepare(@AuthenticationPrincipal PrincipalDetails user,
			@RequestParam("cart_keys[]") List<Integer> cart_keys,
			TotalOrder to) throws IamportResponseException, Exception {
		to.setUnum(user.getUser().getUnum());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ok", cs.postPrepare(to,cart_keys));
		return map;
	}
	
	//사후검증
	@PostMapping("/payment_validate")
	@ResponseBody
	public Payment payment_validate(TotalOrder to) throws IamportResponseException,Exception {
		return cs.validatePayment(to);
	}
	
	//결제 후 DB 저장
	@PostMapping("/save_order")
	@ResponseBody
	public ResponseEntity<Payment> save_order(@AuthenticationPrincipal PrincipalDetails user,
			Authentication authentication,
			@RequestParam("cart_keys[]") List<Integer> cart_keys,
			TotalOrder to) throws IamportResponseException, Exception {
		to.setUnum(user.getUser().getUnum());
		return new ResponseEntity<Payment>(cs.save_order(to, cart_keys),HttpStatus.OK) ;
	}
	
	//구매 오류 시 사전검증 시 DB에 저장된 내역 삭제
	@PostMapping("/deleteTotalOrder/{to_key}")
	@ResponseBody
	public Map<String, Object> deleteTotalOrder(@PathVariable String to_key) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", cs.deleteTotalOrder(to_key));
		} catch (Exception e) {
			map.put("ok",false);
		}
		return map;
	}
	
//제품상세
	@PostMapping("/insertCart")
	@ResponseBody
	public Map<String, Object> insertCart(CartDTO cart, @AuthenticationPrincipal PrincipalDetails user) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(user==null) {
			map.put("login", false);
			return map;
		}
		map.put("login", true);
		map.put("ok", cs.insertCart(cart, user.getUser()));
		return map;
	}
}
