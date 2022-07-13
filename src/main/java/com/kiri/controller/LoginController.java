package com.kiri.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.LoginService;
import com.kiri.utills.EncryptionUtils;

@RequestMapping("/login")
@Controller
public class LoginController {
	@Autowired
	private EncryptionUtils ecp;
	@Autowired
	private LoginService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping(value = "/toLogin")
	public String toLogin() {
		return "/member/login";
	}
	


	@ResponseBody
	@RequestMapping(value = "/general") 	
	public String general(String user_id, String user_pw) throws Exception { // 일반로그인
		String Encryption_pw = ecp.getSHA512(user_pw); 
		MemberDTO dto = service.login(user_id, Encryption_pw);
		
		if(dto != null) { // 널이 아니라면 조회 성공
			dto.setUser_pw(null);
			Login_TypeDTO type = service.loginType(user_id);
			
			if(type.getType().equals("general")) { //일반 로그인
				session.setAttribute("loginSession", dto);
				return "general";
				
			}else if(type.getType().equals("kakao")) { //카카오로 가입된 아이디
				return "kakao";
				
			}else { // 맴버는 조회 되었는데 타입에 오류 발생 
				return "error";
			}
			
		}else { // null 로그인 실패 
			return "loginFail";
		}
	}
	
	
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
	
	
}
