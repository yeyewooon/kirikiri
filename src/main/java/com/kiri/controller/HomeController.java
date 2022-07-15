package com.kiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

<<<<<<< HEAD
@Controller
public class HomeController {
	@RequestMapping(value = "/")
	public String home() {	
=======

@Controller
public class HomeController {
	
	@RequestMapping(value = "/")
	public String home() {
>>>>>>> d2d3ce3d4ac4293c568f478788b1c1cc5fe7de25
		return "home";
	}
	
	@RequestMapping(value = "/main")
	public String main() {
		return "mainPage";
	}
	
	
}
