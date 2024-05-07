package com.vitabucket.web.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.vitabucket.web.dto.SignupDTO;
import com.vitabucket.web.dto.UserVO;

@Mapper
public interface UserMapper {
	
	UserVO getUserbyID(String user_id);
	
	UserVO getUser(String user_email);
	
	int signup(SignupDTO signupDto);
	
	int SNSsignup(UserVO vo);
	
	int insertAddr(SignupDTO signupDto);
	
	int idckeck(String user_id);
	
	int emailcheck(String user_email);
	
	UserVO idfind(UserVO vo);
	
	UserVO pwdfind(UserVO vo);
	
	int editPwd(String user_pwd,String user_id);
}
