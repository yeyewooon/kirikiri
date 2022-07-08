package com.kiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/group")
@Controller
public class GroupController {
	@RequestMapping(value = "/")
	public String home() {
		
		return "mainPage";
	}
	
}