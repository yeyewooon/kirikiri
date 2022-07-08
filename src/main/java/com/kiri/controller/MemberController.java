package com.kiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mem")
@Controller
public class MemberController {
	@RequestMapping(value = "/welcome")
	public String welcome() {
		
		return "member/welcome";
	}
	
}