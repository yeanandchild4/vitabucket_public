package com.vitabucket.web.dao;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.mapper.Admin_memberMapper;

@Repository
public class Admin_memberDAO {
	@Autowired
	Admin_memberMapper mapper;
	
	//목록
	public List<UserVO> memberList(){
		return mapper.memberList();
	}
	
	//검색
	public List<UserVO> search(HashMap<String,String> map){
		return mapper.mSearch(map);
	}
	
	//회원정보 상세
	public UserVO memb_detail(int unum) {
		return mapper.memb_detail(unum);
	}
	
	//회원정보삭제
	public int mem_del(int unum) {
		return mapper.mem_del(unum);
	}	
	
	//회원객체
	public UserVO member(){
		return mapper.member();
	}
	

}

