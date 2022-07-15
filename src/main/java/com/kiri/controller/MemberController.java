package com.kiri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiri.service.LoginService;

@RequestMapping("/mem")
@Controller
public class MemberController {
	
	
	
	@RequestMapping(value = "/welcome")
	public String welcome() {
		
		return "member/welcome";
	}
	
	
	
}