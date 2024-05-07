package com.vitabucket.web.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.vitabucket.web.dto.*;
import com.vitabucket.web.svc.*;



@Controller
@RequestMapping("/vitabucket/admin/suppo")
public class Admin_supportController {
	@Autowired
	private Admin_supportSVC svc;
	
	//고객문의
	@GetMapping("")
	public String support(Model m) {
		m.addAttribute("inquiry_list",svc.inquiry_list());
		return "admin/first_page/support";
	}

	
	//문의 상세게시판
	@GetMapping("/inquiry/{board_key}")
	public String inquiry(@PathVariable("board_key") int board_key,Model m) {
		m.addAttribute("in",svc.inquiry(board_key));
		m.addAttribute("com",svc.comment(board_key));
		return "admin/second_page/support_inquiry";
	}
	
	
	//문의게시판_답변_저장
	@PostMapping("/inquiry/{board_key}")
	@ResponseBody
	public Map<String,Object> add(CommentDTO com){		
		Map<String,Object> map = new HashMap<>();
		map.put("in_addSave", svc.in_add(com));
		return map;
	}
	
	
	//문의 상세게시판_답변 수정보이기
	@GetMapping("/inquiry/edit/{comm_key}")
	public String edit(@PathVariable("comm_key")int comm_key,Model m) {
		m.addAttribute("b",svc.board_com(comm_key));
		return "admin/third_page/support_inquiry_edit";
	}
	
	//문의게시판_답변_수정_저장
	@PostMapping("/inquiry/update/{comm_key}")
	@ResponseBody
	public Map<String,Object> update(CommentDTO com){		
		Map<String,Object> map = new HashMap<>();
		map.put("in_updated", svc.in_updated(com));
		return map;
	}
	
	//문의게시판_답변_삭제
	@PostMapping("/inquiry/deleted/{comm_key}")
	@ResponseBody
	public Map<String,Object> deleted(@PathVariable("comm_key") int comm_key){		
		Map<String,Object> map = new HashMap<>();
		map.put("in_Del", svc.in_Del(comm_key));
		return map;
	}	
	
	
	//리뷰게시판
	@GetMapping("/review")
	public String review(Model m) {
		m.addAttribute("review_list",svc.review_list());
		return "admin/second_page/support_review";
	}
	
	//리뷰상세게시판
	@GetMapping("/review/{board_key}")
	public String review(@PathVariable("board_key") int board_key,Model m) {
		m.addAttribute("re",svc.review_detail(board_key));
		return "admin/third_page/support_review_detail";
	}
	
}
