package com.kiri.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kiri.dto.Group_ChatDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.service.Group_ChatService;

@RequestMapping("/group")
@Controller
public class GroupController {
	@Autowired
	private HttpSession session;
	@Autowired
	private Group_ChatService service;
	
	@RequestMapping(value = "/toChat") // 채팅 페이지 요청
	public String chat(String nickname, Tbl_GroupDTO tgdto, Group_ChatDTO gcdto, Model model) throws Exception{
		nickname = "abc초콜릿";
		int seq_group = 1;
		System.out.println("nickname : " + nickname);
		// HttpSession에 nickname을 등록해둘 것.
		session.setAttribute("nickname", nickname);
		List<Group_ChatDTO> gclist = service.selectList(seq_group);
		model.addAttribute("gclist", gclist);
		List<Tbl_GroupDTO> tglist = service.selectGroup(seq_group);
		model.addAttribute("tglist", tglist);
		List<String> nickList = service.selectNick(seq_group);
		List<String> profileList = new ArrayList<>();
		
		for(String user_nickname : nickList){
			profileList.add(service.getProfile(user_nickname));
		}
		
		model.addAttribute("nickList", nickList);
		model.addAttribute("profileList", profileList);
		
		return "group/chatting";
	}
	
	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "redirect:/toError";
	}
	
}