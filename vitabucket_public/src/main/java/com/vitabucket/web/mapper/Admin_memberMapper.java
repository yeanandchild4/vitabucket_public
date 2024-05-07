package com.vitabucket.web.mapper;

import java.util.*;

import org.apache.ibatis.annotations.*;
import com.vitabucket.web.dto.*;



@Mapper
public interface Admin_memberMapper {
	
	//회원 목록
	@Select("SELECT * FROM vita_customer WHERE user_authority='ROLE_USER' ORDER BY provider DESC")
	public List<UserVO> memberList();	

	//회원검색
	public List<UserVO> mSearch(HashMap<String,String> map);
	
	//회원정보 상세
	@Select("SELECT * FROM vita_customer WHERE unum=#{unum}")
	public UserVO memb_detail(int unum);
	
	//회원정보삭제
	@Delete("DELETE FROM vita_customer WHERE unum = #{unum}")
	public int mem_del(int unum);
	
	//회원 객체
	@Select("SELECT * FROM vita_customer WHERE user_authority='ROLE_USER'")
	public UserVO member();	
	
}
