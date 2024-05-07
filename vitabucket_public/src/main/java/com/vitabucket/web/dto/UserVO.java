package com.vitabucket.web.dto;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Component
@RequiredArgsConstructor
public class UserVO{

	private int unum;
	private String name;
	private String user_id;
	private String user_pwd;
	private String user_email;
	private String user_address;
	private java.sql.Date user_birth;
	private boolean withdraw;
	private String user_phone;
	private String user_authority;
	
	private String provider;
	private String provider_id;
	
	
}
