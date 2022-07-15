package com.kiri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiri.service.SignupService;

@RequestMapping("/signup")
@Controller
public class SignupContoller {
	@Autowired
	private SignupService service;
	
	@RequestMapping(value = "/toSignup") //회원가입으로
	public String toSignup() {
		return "/member/signup";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailCheck") //이메일 중복체크
	public String emailCheck(String user_email) throws Exception {
		System.out.println("유저 이메일 : "+user_email);
		
		boolean is_result = service.emailCheck(user_email);
		if(is_result) {
			return "possibility";
		}else {
			return "impossibility";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/nicknameCheck") //이메일 중복체크
	public String nicknameCheck(String user_nickname) throws Exception {
		System.out.println("유저 닉네임 : " + user_nickname);
		
		boolean is_result = service.nicknameCheck(user_nickname);
		if(is_result) {
			return "possibility";
		}else {
			return "impossibility";
		}
		
	}
	
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
}
