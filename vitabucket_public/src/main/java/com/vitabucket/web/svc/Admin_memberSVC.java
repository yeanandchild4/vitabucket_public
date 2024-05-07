package com.vitabucket.web.svc;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vitabucket.web.dao.Admin_memberDAO;
import com.vitabucket.web.dto.UserVO;

@Service
public class Admin_memberSVC {
	@Autowired
	private Admin_memberDAO dao;

	//목록
	public List<UserVO> memberList() {
		return dao.memberList();
	}
	//검색
	public List<UserVO> search(HashMap<String,String> map){
		return dao.search(map);
	}
	
	//회원정보 상세
	public UserVO memb_detail(int unum) {
		return dao.memb_detail(unum);
	}
	
	//회원정보삭제
	public boolean mem_del(int unum) {
		return dao.mem_del(unum)>0;
	}	
	
	//회원 객체
	public UserVO member() {
		return dao.member();
	}
}
