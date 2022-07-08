package com.kiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@RequestMapping(value = "/")
	public String home() {
		
		return "mainPage";
	}
	
}
