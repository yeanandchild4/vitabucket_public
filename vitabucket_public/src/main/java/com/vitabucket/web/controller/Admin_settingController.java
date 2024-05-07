package com.vitabucket.web.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.vitabucket.web.dto.*;
import com.vitabucket.web.svc.*;


@Controller
@RequestMapping("/vitabucket/admin/sett")
public class Admin_settingController {
	@Autowired
	private Admin_settingSVC svc;
	
	//환경설정
	@GetMapping("")
	public String setting(Model m) {
		m.addAttribute("c",svc.bagic());
		return "admin/first_page/setting";
	}
	
	//기본환경설정_회사정보
	@PostMapping("")
	@ResponseBody
	public Map<String,Object> settingSave(Vita_Vitabucket vv){
		Map<String,Object> map =new HashMap<>();
		map.put("settSave",svc.settSave(vv));
		return map;
	}
	
	//약관설정
	@GetMapping("/terms")
	public String terms_setting(Model m) {
		m.addAttribute("terms_list",svc.terms_list());
		return "admin/second_page/setting_terms";
	}
	
	//약관 상세보기
	@GetMapping("/terms/detail/{terms_key}")
	public String terms_detail(Model m,@PathVariable("terms_key")int terms_key) {
		m.addAttribute("t",svc.terms_keyFind(terms_key));
		return "admin/third_page/setting_terms_detail";
	}
	
	//약관설정_저장
	@PostMapping("/terms")
	@ResponseBody
	public Map<String,Object> terms_settingSave(Vita_Terms vt){
		Map<String,Object> map =new HashMap<>();
		map.put("termsSave",svc.terms_settingSave(vt));
		return map;
	}
	
	//약관설정_수정
	@GetMapping("/terms/edit/{terms_key}")
	public String terms_edit(@PathVariable("terms_key") int terms_key,Model m) {
		m.addAttribute("t",svc.terms_keyFind(terms_key));
		return "admin/third_page/setting_terms_edit";
	}
	
	//약관설정_수정저장
	@PostMapping("/terms/edit/{terms_key}")
	@ResponseBody
	public Map<String,Object> terms_settingEditSave(@ModelAttribute("Vita_Terms")Vita_Terms vt){
		Map<String,Object> map =new HashMap<>();
		map.put("termEditSave",svc.terms_settingEditSave(vt));
		return map;
	}
	
	//약관설정_삭제
	@PostMapping("/terms/dele/{terms_key}")
	@ResponseBody
	public Map<String,Object> terms_dele(@PathVariable("terms_key") int terms_key,Model m) {
		Map<String,Object> map =new HashMap<>();
		map.put("termsDel",svc.terms_delete(terms_key));
		return map;
	}
	
	
}
