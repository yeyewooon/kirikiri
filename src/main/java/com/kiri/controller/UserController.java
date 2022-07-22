package com.kiri.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kiri.dto.MessageDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.service.MessageService;
import com.kiri.service.UserService;

@RequestMapping("/user")
@Controller
public class UserController {

	@Autowired
	private HttpSession session;

	@Autowired
	private UserService user_service;

	@Autowired
	private MessageService message_service;

	// 모든 그룹 리스트 보여주기
	@RequestMapping(value = "/toViewAllGroupList")
	public String toUserViewList(Model model) throws Exception {
		System.out.println("toUserViewList잘들어옴");
		List<Tbl_GroupDTO> selectAllList = user_service.selectAllGroup();
		model.addAttribute("selectAllList", selectAllList);
		return "/user/viewAllGroupList";
	}

	// 카테고리별 지역별 그룹 리스트 보여주기
	@RequestMapping(value = "/toUserSelectedGroupList")
	public String userViewList(Tbl_GroupDTO tbl_group_dto, Model model) throws Exception {
		System.out.println(tbl_group_dto);
		List<Tbl_GroupDTO> groupList = user_service.groupList(tbl_group_dto);
		System.out.println(groupList.toString());
		System.out.println("잘들어옴");
		model.addAttribute("groupList", groupList);
		return "/user/userSelectedGroupList";
	}
	
	   // 쪽지 보내기
	   @ResponseBody
	   @RequestMapping(value = "/insertMessage")
	   public String sendMessage(MessageDTO MessageDTO) throws Exception {
	      String rs = message_service.sendMessage(MessageDTO);
	      return rs;
	   }

	   // 내가 받은 쪽지 보기
	   @RequestMapping(value = "/receiveMsg")
	   @ResponseBody
	   public List<MessageDTO> selectReMessage(MessageDTO MessageDTO, Model model) throws Exception {
	      List<MessageDTO> rmsgList = message_service.selectReMessage(MessageDTO.getUser_receive());
	      return rmsgList;
	   }

	   // 내가 보낸 쪽지 보기
	   @RequestMapping(value = "/sendMsg")
	   @ResponseBody
	   public List<MessageDTO> selectSendMessage(MessageDTO MessageDTO, Model model) throws Exception {
	      System.out.println("아이디 : " + MessageDTO.toString());
	      List<MessageDTO> smsgList = message_service.selectSendMessage(MessageDTO.getUser_send());

	      return smsgList;

	   }

	   // 쪽지 삭제
	   @RequestMapping(value = "/deleteMsg")
	   @ResponseBody
	   public String deleteMessage(@RequestBody Map<String, Object> param) throws Exception {
	      List<String> message = new ObjectMapper().readValue(param.get("message").toString(), List.class);
	      message_service.deleteMessage(message);
	      return "";
	   }
	
}