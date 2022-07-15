package com.kiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/board")
@Controller
public class BoardController {
	@RequestMapping(value = "/")
	public String home() {
		return "mainPage";
	}
	
}

