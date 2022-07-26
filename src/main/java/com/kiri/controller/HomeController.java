package com.kiri.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kiri.dto.BestGroupDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.service.HomeService;

@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;

	@Autowired
	private HomeService home_service;

	
	@RequestMapping(value = "/")
	public String main(Model model) throws Exception {
		
		List<Tbl_GroupDTO> selectAllList = home_service.selectAllGroup();
		List<Tbl_GroupDTO> selectNewList = home_service.selectNewGroup();
		List<BestGroupDTO> selectBestList = home_service.selectBestGroup();
		model.addAttribute("selectAllList", selectAllList);
		model.addAttribute("selectNewList", selectNewList);
		model.addAttribute("selectBestList", selectBestList);
		return "mainPage";
	}
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
	
	@RequestMapping(value = "/privacy")
	public String privacy() {
		return "privacy";
	}
	

}
