package com.kiri.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kiri.dto.BoardDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.AdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private HttpSession session;
	@Autowired
	private AdminService service;
	
	@RequestMapping(value = "/toMember")
	public String toMember(int curPage, Model model) throws Exception{
		List<MemberDTO> list = service.selectAllMember(curPage*15-14, curPage*15);
		model.addAttribute("list", list);
		System.out.println(curPage);
		
		HashMap<String, Object> map = service.getPageNavi(curPage);
		model.addAttribute("naviMap", map);
		
		return "admin/adminMember";
    
	}
	
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
}
