package com.vitabucket.web.controller;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import com.vitabucket.web.dto.SignupDTO;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.svc.AuthSvc;
import com.vitabucket.web.svc.MailSvc;
import com.vitabucket.web.svc.UserSvc;

@Controller
@RequestMapping("/member")
@SessionAttributes("user")
public class UserController {
	
	@Autowired
	private UserSvc uSvc;
	@Autowired
	private MailSvc mSvc;
	@Autowired
	private AuthSvc aSvc;
	
	
	//로그인 form
	@GetMapping("/login")
	public String loginForm() {
		return "loginpage/loginForm";
	}
	
	//회원가입 form
	@GetMapping("/signup")
	public String addForm() {
		return "registpage/addForm";
	}
	
	//회원가입
	@PostMapping("/signup")
	public String add(SignupDTO dto,Model m){
		
		boolean add=aSvc.signup(dto);
		if(add) {
			m.addAttribute("name", dto.getName());
			return "registpage/regist";
		} else {
			return "redirect:/member/signup";
		}
	
		
	}

	//회원가입 결과
	@GetMapping("/sign")
	public String regist() {
		return "registpage/regist";
	}
	
	//id 중복
	@PostMapping("/idcheck")
	@ResponseBody
	public Map<String,Boolean> idChecking(@RequestParam("userid") String user_id){
		Map<String, Boolean> map = new HashMap<>();
		
		boolean result=uSvc.idChecking(user_id);
		map.put("result", result);
		return map;
	}
	
	//이메일 중복
	@PostMapping("/emailcheck")
	@ResponseBody
	public Map<String,Boolean> emailChecking(@RequestParam("useremail") String user_email){
		
		boolean result=uSvc.emailChecking(user_email);
		Map<String, Boolean> map = new HashMap<>();
		map.put("result", result);	
		return map;
	}
	
	//id찾기 form
	@GetMapping("idFind")
	public String idFindForm() {
		return "idpwdFindpage/idFindForm";
	}
	
	//id찾기 결과
	@PostMapping("idSuccess")
	public String idResult(@ModelAttribute("uservo") UserVO vo,Model m) {
		
		
		UserVO u=(UserVO)uSvc.getid(vo);
		String fullId=u.getUser_id();
		String uid=uSvc.findId(u.getUser_id());
		
		if(u!=null) {
			m.addAttribute("uid",uid);
			m.addAttribute("fulluid",fullId);
		} else {
			m.addAttribute("uid",null);
		}
		
		return "idpwdFindpage/idResult";
	}
	//pwd 찾기 form
	@GetMapping("pwdFind")
	public String pwdFindForm() {
		return "idpwdFindpage/pwdFindForm";
	}
	
	//pwd 찾기 결과
	@PostMapping("pwdSuccess")
	public String pwdResult(@ModelAttribute("uservo") UserVO vo,Model m) {
		
		UserVO u=uSvc.getpwd(vo);
		if(u!=null) {
			boolean isSent = mSvc.sendUserPwd(vo);
			m.addAttribute("user_email", u.getUser_email());
		} else {
			m.addAttribute("user_email", null);
		}	
		return "idpwdFindpage/pwdResult";
	}
	
	//로그아웃
	@GetMapping("/logout")
	public String  logout(SessionStatus status) {
		
		status.setComplete( );
		return "redirect:/vitabucket/main";
	}
}
