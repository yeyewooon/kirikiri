package com.kiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	@RequestMapping(value = "/")
	public String home() {
		
		return "mainPage";
	}
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
	@RequestMapping(value = "/toAdmin")
	public String toAdmin() {
		return "admin/adminMain";
	}
}
