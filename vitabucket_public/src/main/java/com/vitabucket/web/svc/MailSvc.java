package com.vitabucket.web.svc;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.vitabucket.web.dto.UserVO;
import com.vitabucket.web.mapper.UserMapper;

import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class MailSvc {

	   @Autowired
	   private JavaMailSender sender;
	   @Autowired
	   private HttpSession session;
	   @Autowired
	   private ServletContext cvx;
	   @Autowired
	   private UserMapper dao;
		@Autowired
		private BCryptPasswordEncoder enc;
	   
	   //비밀번호 찾기 메일
	   public boolean sendUserPwd(UserVO vo)
	   {
		      MimeMessage mimeMessage = sender.createMimeMessage();

		      try {
		         InternetAddress[] addressTo = new InternetAddress[1];
		         addressTo[0] = new InternetAddress(vo.getUser_email());

		         mimeMessage.setRecipients(Message.RecipientType.TO, addressTo);

		         mimeMessage.setSubject("[VitaBucket] 임시비밀번호 안내드립니다.");
		         
		         String newPwd=rePwd();
		         String encPwd=enc.encode(newPwd);
		         int result=dao.editPwd(encPwd, vo.getUser_id());
		         mimeMessage.setContent(contents(newPwd), "text/html;charset=utf-8");

		         
		         sender.send(mimeMessage);
		         return true;
		      } catch (MessagingException e) {
		         log.error("에러={}", e);
		      }

		      return false;
	   }
	
	   

	   private String rePwd() {
		   
		   Random rd = new Random();
		   String str = "";
		   int upper = 0, lower = 0, num = 0;

		   for(int i=0;i<8;i++) {
		       double tmp = Math.random();
		       
		       if(tmp<0.1) {
		           str += (char)(rd.nextInt(10)+48); 
		           num++;
		       } else if(tmp<0.3) {
		           str += (char)(rd.nextInt(26)+97); 
		           lower++;
		       } else if(tmp>=0.3) {
		           str += (char)(rd.nextInt(26)+65); 
		           upper++;
		       }
		   
		   }
		   return str;
	   
	   }
   
	   private String contents(String newPwd) {
		   String msg="";
		   msg+="<h3>임시 비밀번호 안내드립니다.</h3>";
		   msg+="<div><strong>"+newPwd+"</strong></div>";
		   msg+="로그인 후 비밀번호를 변경해주세요";
		   return msg;
	   }
	   
	   private String createRandomStr()
	   {
		  
	      UUID randomUUID = UUID.randomUUID();
	      return randomUUID.toString().replaceAll("-", "");
	   }
	   
}
