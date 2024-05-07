package com.vitabucket.web.oauth;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import com.nimbusds.oauth2.sdk.Response;
import com.vitabucket.web.dto.PrincipalDetails;
import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.mapper.UserMapper;
import com.vitabucket.web.svc.AuthSvc;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PrincipalOauth2UserService extends DefaultOAuth2UserService{
	
	private final UserMapper dao;
	@Autowired
	private AuthSvc svc;
	private final BCryptPasswordEncoder enc;
	@Override
	public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		   OAuth2User oAuth2User = super.loadUser(userRequest);
		   log.info("getAttributes : {}", oAuth2User.getAttributes());
		   
		   OAuth2UserInfo oAuth2UserInfo = null;
		   
		  
		   String provider = userRequest.getClientRegistration().getRegistrationId();
		   
		     if(provider.equals("google")) {
		            log.info("구글 로그인 요청");
		            oAuth2UserInfo = new GoogleUserInfo(oAuth2User.getAttributes());
		     } else if(provider.equals("kakao")) {
		            log.info("카카오 로그인 요청");
		            oAuth2UserInfo = new KakaoUserInfo(oAuth2User.getAttributes());
		     } else if(provider.equals("naver")) {
		            log.info("네이버 로그인 요청");
		            oAuth2UserInfo = new NaverUserInfo((Map<String, Object>)oAuth2User.getAttributes().get("response"));
		     } 
		   String providerId = oAuth2UserInfo.getProviderId();
		   String email = oAuth2UserInfo.getEmail();
	       String loginId = provider + "_" + providerId;
	       String name = oAuth2UserInfo.getName();
		   
		   UserVO u=dao.getUser(email);
		   
		   UserVO user;
		   
		   
		   if(u==null) {  
			   user = new UserVO();
			   user.setUser_id(loginId);
			   user.setName(name);
			   user.setUser_id(name);
			   user.setUser_email(email);
			   user.setProvider(provider);
			   user.setProvider_id(providerId);
			   user.setUser_authority("ROLE_USER");
			   svc.snsSignup(user);
		   } else {
			   user=u;
		   }
		return new PrincipalDetails(user, oAuth2User.getAttributes());
	}
	
	
	

}
