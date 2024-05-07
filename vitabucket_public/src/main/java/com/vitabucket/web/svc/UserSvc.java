package com.vitabucket.web.svc;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;

import com.vitabucket.web.dto.PrincipalDetails;
import com.vitabucket.web.dto.SignupDTO;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.mapper.UserMapper;

@Service
public class UserSvc implements UserDetailsService{

	@Autowired
	private UserMapper dao;

	
	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {
		
		UserVO vo  = dao.getUserbyID(user_id);
		if(vo == null) throw new UsernameNotFoundException("no");
		
		return new PrincipalDetails(vo);
	}
	
	
	
	public boolean emailChecking(String user_email) {
		
		if(dao.emailcheck(user_email)>0) return true;
		else return false;
	}	
	
	
	public boolean idChecking(String user_id) {
		
		if(dao.idckeck(user_id)>0) return true;
		else return false;
	}	
	
	
	//이름,이메일로 user 찾기
	public UserVO getid(UserVO vo) {
		
		return dao.idfind(vo);
	}
	
	public String findId(String user_id) {
		
		int length=user_id.length();
		
		StringBuilder sb = new StringBuilder(user_id);
		for(int i=4;i<length;i++) {
			sb.setCharAt(i, '*');
		};
		user_id=sb.toString();		
		return user_id;
	}
	
	public UserVO getpwd(UserVO vo) {
		return dao.pwdfind(vo);
	}
	
}
