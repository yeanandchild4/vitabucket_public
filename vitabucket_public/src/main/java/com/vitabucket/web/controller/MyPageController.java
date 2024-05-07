
package com.vitabucket.web.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import com.vitabucket.web.dto.AddressDTO;
import com.vitabucket.web.dto.BoardDTO;
import com.vitabucket.web.dto.InfoDTO;
import com.vitabucket.web.dto.OrderDetail;
import com.vitabucket.web.dto.PrincipalDetails;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.svc.MyPageSvc;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import retrofit2.http.GET;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Autowired
	private MyPageSvc ms;
	
	@Autowired
	private BCryptPasswordEncoder pe;
	
	//주문내역
	@GetMapping("/order")
	public String order(@AuthenticationPrincipal PrincipalDetails user,Model m) {
		m.addAttribute("list",ms.totalOrderList(user.getUser().getUnum()));
		return "mypage/order";
	}
	
	
	//주문 상세 내역
	@GetMapping("/order/{to_key}")
	public String orderDetail(@PathVariable String to_key, Model m) {
		m.addAttribute("to",ms.totalOrderDetail(to_key));
		m.addAttribute("od",ms.orderDetail(to_key));
		return "mypage/orderDetail";
	}
	
	
	//찜목록
	@GetMapping("/wishList") 
	public String wishList(@AuthenticationPrincipal PrincipalDetails user,Model m) {
		m.addAttribute("list",ms.wishList(user.getUser().getUnum()));
		return "mypage/wishList";
	}
	@DeleteMapping("/deleteWish/{wish_key}")
	@ResponseBody
	public Map<String, Object> deleteWish(@PathVariable int wish_key) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ok", ms.deleteWish(wish_key));
		return map;
	}
	
	
	//작성한 후기
	@GetMapping("/review")
	public String review(@AuthenticationPrincipal PrincipalDetails user,Model m) {
		m.addAttribute("list",ms.reviewList(user.getUser().getUnum()));
		return "mypage/review";
	}
	@PostMapping("/editReview")
	@ResponseBody
	public Map<String, Object> editReview(@RequestParam MultipartFile[] files, BoardDTO b,
			@AuthenticationPrincipal PrincipalDetails user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean ok = ms.editReview(user.getUser(),files,b);
			System.out.println("결과 확인:" + ok);
			map.put("ok", ok);
		} catch (Exception e) {
			map.put("ok", false);
		}
		return map;
	}
	@DeleteMapping("/deleteReview")
	@ResponseBody
	public Map<String, Object> deleteReview(int board_key) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", ms.deleteReview(board_key));
		} catch (Exception e) {
			e.printStackTrace();
			map.put("ok", false);
		}
		return map;
	}
	@DeleteMapping("/deleteRevieImg")
	@ResponseBody
	public Map<String, Object> deleteRevieImg(@RequestParam("b_attach_key") int b_attach_key) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ok", ms.deleteRevieImg(b_attach_key));
		return map;
	}
	
	//작성가능한 후기
	@GetMapping("/unReviewd")
	public String unReviewd(@AuthenticationPrincipal PrincipalDetails user,Model m) {
		m.addAttribute("list",ms.unReviewList(user.getUser().getUnum()));
		return "mypage/unreview";
	}
	@PostMapping("/addReview")
	@ResponseBody
	public Map<String, Object> addReview(@RequestParam MultipartFile[] files, BoardDTO b,
			@AuthenticationPrincipal PrincipalDetails user) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", ms.addReview(user.getUser(), b, files));
		} catch (Exception e) {
			map.put("ok", false);
		}
		return map;
	}
	
	
	//개인문의
	@GetMapping("/inquiry")
	public String ona(Model m,@AuthenticationPrincipal PrincipalDetails user) {
		m.addAttribute("list",ms.inquiryList(user.getUser().getUnum()));
		return "mypage/inquiry";
	}
	@DeleteMapping("/deleteInquiry")
	@ResponseBody
	public Map<String, Object> deleteInquiry(int board_key) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", ms.deleteInquiry(board_key));
		} catch (Exception e) {
			e.printStackTrace();
			map.put("ok", false);
		}
		return map;
	}
	
	//개인정보수정
	@GetMapping("/info")
	public String info(@AuthenticationPrincipal PrincipalDetails user, Model m) {
		m.addAttribute("info",ms.getUserInfo(user.getUser().getUnum()));
		return "mypage/info";
	}
	@PostMapping("/info")
	@ResponseBody
	public String info_modify(@AuthenticationPrincipal PrincipalDetails user, InfoDTO pwd,
			HttpServletRequest request, Model m) {
		InfoDTO info = ms.getUserInfo(user.getUser().getUnum());
		boolean ok = pe.matches(pwd.getUser_pwd(), info.getUser_pwd());
		if(ok) request.getSession().setAttribute("info_modify", ok);
		return "{\"ok\":"+ok+"}";
	}
	@GetMapping("/info/modify")
	public String getMethodName(@SessionAttribute(name = "info_modify", required = false) boolean ok,
			HttpServletRequest request,
			@AuthenticationPrincipal PrincipalDetails user, Model m) {
		if(ok) {
			m.addAttribute("info",ms.getUserInfo(user.getUser().getUnum()));
			request.getSession().removeAttribute("info_modify");
			return "mypage/info_modify";
		} else {
			return "redirect:/mypage/info";
		}
	}
	@PostMapping("/editInfo")
	@ResponseBody
	public Map<String, Object> editInfo(InfoDTO info,AddressDTO addr) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			map.put("ok", ms.editInfo(info, addr));
		} catch (Exception e) {
			e.printStackTrace();
			map.put("ok", false);
		}
		return map;
	}
}
