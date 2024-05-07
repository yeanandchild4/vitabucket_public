package com.vitabucket.web.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfiguration;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.vitabucket.web.oauth.PrincipalOauth2UserService;
import com.vitabucket.web.svc.AuthSvc;
import com.vitabucket.web.svc.UserSvc;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class VitaConfig {
	@Autowired
	private DataSource dataSource;
	
	@Autowired
	private final PrincipalOauth2UserService po;

	@Bean
	public static BCryptPasswordEncoder passwordEncoder() {
		BCryptPasswordEncoder enc = new BCryptPasswordEncoder();

		return enc;
	}

	@Bean
	WebSecurityCustomizer webSecurityCustomizer() {
		return (webSecurity) -> webSecurity.ignoring().requestMatchers("/resources/**", "/ignore2");
	}

	@Bean
	SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		
		http.headers().frameOptions().sameOrigin();
		http.authorizeHttpRequests(authz -> authz
				.requestMatchers("/", "/vitabucket", "/member/signup", "/vitabucket/main", "/vitabucket/denied",
						"/logout", "/product/**").permitAll()
				.requestMatchers("/vitabucket/main").hasAnyRole("USER", "ADMIN")
				.requestMatchers("/vitabucket/admin","/vitabucket/admin/**").hasAnyRole("ADMIN")
				.requestMatchers("/mypage/**").hasAnyRole("USER", "ADMIN")	
				.requestMatchers("/cart/**").hasAnyRole("USER", "ADMIN")
				.anyRequest().permitAll())
				.csrf(csrfConf -> csrfConf.disable())
				.formLogin(loginConf -> loginConf.loginPage("/member/login")
						.loginProcessingUrl("/doLogin")
						.failureUrl("/member/login?error=T")
						.defaultSuccessUrl("/vitabucket/main", true)
						.usernameParameter("user_id")
						.passwordParameter("user_pwd")
						.permitAll())
				.logout(logoutConf -> logoutConf.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
						.logoutSuccessUrl("/vitabucket/main")
						.invalidateHttpSession(true)
						.deleteCookies("JSESSIONID")
						.permitAll())
				.exceptionHandling(exConf -> exConf.accessDeniedPage("/vitabucket/denied"))
				.oauth2Login(t -> t.loginPage("/member/login")
			    		  .defaultSuccessUrl("/vitabucket/main",true)
			    		  .failureUrl("/login?error=T")
			    		  .userInfoEndpoint(r->r.userService(po)));
		
		return http.build();
	}
}