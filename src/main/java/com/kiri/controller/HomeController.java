package com.kiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


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
<<<<<<< HEAD
>>>>>>> d2d3ce3d4ac4293c568f478788b1c1cc5fe7de25
		return "home";
	}
	
	@RequestMapping(value = "/main")
	public String main() {
=======

>>>>>>> 811b2f1e80664298b397fe202e26bc7034218d16
		return "mainPage";
	}

	
<<<<<<< HEAD
	
=======

>>>>>>> 811b2f1e80664298b397fe202e26bc7034218d16
}
