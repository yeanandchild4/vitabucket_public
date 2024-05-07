package com.vitabucket.web.svc;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vitabucket.web.dto.SignupDTO;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.mapper.UserMapper;

@Service
public class AuthSvc {
	
	@Autowired
	private UserMapper dao;
	@Autowired
	private BCryptPasswordEncoder enc;
	
    @Transactional
	public boolean signup(SignupDTO signupDto) {
		String encPassword = enc.encode(signupDto.getUser_pwd());
		signupDto.setUser_pwd(encPassword);
		setAddr(signupDto);
		setDate(signupDto);
		
		int row=dao.signup(signupDto);
		int result=0;
		if(row>0) {
			result=dao.insertAddr(signupDto);
		}
		return result>0 ? true:false;
	}
	
	public boolean snsSignup(UserVO vo) {
		String encPassword = enc.encode(vo.getUser_email());
		
		vo.setUser_pwd(encPassword);
		return dao.SNSsignup(vo)>0 ? true:false;
	}
    
	public SignupDTO setDate(SignupDTO dto) {
		
		String date=dto.getYear()+"-"+dto.getMonth()+"-"+dto.getDay();	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			java.util.Date udate = sdf.parse(date);

			Date hiredate = Date.valueOf(sdf.format(udate));

			dto.setBirthday(hiredate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public SignupDTO setAddr(SignupDTO dto) {
		
		String whole_addr=dto.getAddr()+" "+dto.getAddr_detail()+" "+dto.getAddr_reference()+" ("+dto.getAddr_zipcode()+")";
		dto.setWhole_addr(whole_addr);
		
		return dto;
	}
	

}
