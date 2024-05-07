package com.vitabucket.web.dto;

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
public class PrincipalDetails implements UserDetails, OAuth2User{
	
	private UserVO user;
	private Map<String, Object> attributes;
		
	@Override
	public Map<String, Object> getAttributes() {

		return attributes;
	}

	@Override
	public String getName() {
		// TODO Auto-generated method stub
		return user.getName();
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> collect = new ArrayList<GrantedAuthority>();
		
		collect.add(new GrantedAuthority() {
			
			@Override
			public String getAuthority() {
				return user.getUser_authority();
			}
		});
		
		return collect;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return user.getUser_pwd();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return user.getName();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

	public PrincipalDetails(UserVO user) {
		super();
		this.user = user;
	}

	public PrincipalDetails(UserVO user, Map<String, Object> attributes) {
		super();
		this.user = user;
		this.attributes = attributes;
	}

	
}
