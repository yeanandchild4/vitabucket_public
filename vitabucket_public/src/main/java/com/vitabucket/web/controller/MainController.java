package com.vitabucket.web.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.vitabucket.web.dto.MainCateDTO;
import com.vitabucket.web.dto.PrincipalDetails;
import com.vitabucket.web.dto.ProductDTO;
import com.vitabucket.web.dto.Product_ImgDTO;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.dto.Vita_Vitabucket;
import com.vitabucket.web.mapper.ProductMapper;
import com.vitabucket.web.mapper.VitaMapper;
import com.vitabucket.web.svc.ProductSvc;
import com.vitabucket.web.svc.UserSvc;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/vitabucket")
@Slf4j
public class MainController {
	

	@Autowired
	private UserSvc svc;
	@Autowired
	private VitaMapper vDao;
	@Autowired
	private ProductSvc pSvc;
	
	
	
	
	@GetMapping("/main")
	public String mainpage(Model m) {
		
		m.addAttribute("path", "/product/");
		m.addAttribute("pd_list", pSvc.getBestList());
		
		
		return "mainpage/main";
	}
	
	@GetMapping("/popup")
	public String pop() {
		return "popup/pop";
	}
	
	
	@PostMapping("/cate")
	@ResponseBody
	public Map<String,Object> cate() {
		
		List<MainCateDTO> list=pSvc.mainCates();
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		return map;
	}
	
	
	@GetMapping("/faq")
	public String faqpage(Model m) {
		
		m.addAttribute("mainCat", pSvc.mainCates());
		
		return "faqpage/faq";
	}
	
	
	@GetMapping("/introduce")
	public String companyInfo(Model m) {
		Vita_Vitabucket v=vDao.getVita();
		m.addAttribute("v", v);
		
		return "footerpage/introduce";
	}
	
	@GetMapping("/userterm")
	public String termpage() {
		return "footerpage/userTerm";
	}
	
	@GetMapping("/privacy-policy")
	public String policy() {
		return "footerpage/privacy";
	}
	
	@PostMapping("/denied")
	public String deniedpage() {
		return "deniedpage/denied";
	}
	
	

}
