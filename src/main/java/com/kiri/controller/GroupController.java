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
import com.kiri.dto.Group_MemberDTO;
import com.kiri.service.Tbl_GroupService;

@RequestMapping("/group")
@Controller
public class GroupController {
	@Autowired
	private Tbl_GroupService tbl_group_service;
	@Autowired
	private HttpSession session;

	// 멤버관리 이동
	@RequestMapping(value = "/toGroupMember")
	public String selectGroupMember(int seq_group, Model model) throws Exception {
		// System.out.println("그룹 번호 : " + seq_group);
		Map<String, Object> memList = tbl_group_service.selectGroupMember(seq_group);
		memList.get("TableJoinDTO");
		model.addAttribute("memList", memList);
		// System.out.println(memList);
		return "group/groupMember";
	}

	// 멤버관리에서 모임장 위임
	@RequestMapping(value = "/groupAccess")
	@ResponseBody
	// 로그인세션 받아서 모임장을 일반회원으로 바꾸기 하기 !!
	public String groupAccess(Group_MemberDTO Group_MemberDTO) throws Exception {
		System.out.println("직책 : " + Group_MemberDTO.getAccess());
		System.out.println("이메일 : " + Group_MemberDTO.getUser_email());

		tbl_group_service.groupAccess(Group_MemberDTO);
		return "success";
	}

	// 멤버관리에서 멤버 강퇴
	@RequestMapping(value = "/deleteMember")
	@ResponseBody
	public String groupMemberDelete(@RequestBody Map<String, Object> param) throws Exception {
		List<String> userEmails = new ObjectMapper().readValue(param.get("userEmails").toString(), List.class);
		tbl_group_service.groupMemberDelete(userEmails);
		return String.valueOf(userEmails);
	}

	// 모임가입 이동
	@RequestMapping(value = "/toGroupApply")
	public String groupApply(int seq_group, Model model) throws Exception {
		//System.out.println("그룹번호 : " + seq_group);
		int count = tbl_group_service.applyCount(seq_group);
		int groupCount = tbl_group_service.groupCount(seq_group);
		/*
		 * System.out.println("인원수 : " + count); System.out.println("모임에 가입한 인원 : " +
		 * groupCount);
		 */
		model.addAttribute("count", count);
		model.addAttribute("groupCount", groupCount);
		Map<String, Object> map = tbl_group_service.selectApply(seq_group);

		map.get("MemberDTO");
		model.addAttribute("map", map);
		return "group/groupApply";
	}

	// 그룹 멤버 승인과 동시에 group_apply 테이블에서 삭제하기
	@RequestMapping(value = "/completeApply")
	@ResponseBody
	public String completeApply(@RequestBody Map<String, Object> param, int group_people, int groupCount) throws Exception {
		//System.out.println("그룹에 가입한 인원 : " + groupCount);
		List<String> userEmails = new ObjectMapper().readValue(param.get("userEmails").toString(), List.class);
		if (userEmails.size() + groupCount < group_people) {
			tbl_group_service.completeApply(userEmails);
		} else if (userEmails.size() + groupCount >= group_people) {
			return "error";
		}

		return "success";
	}

	// 그룹 승인 거절하기
	@RequestMapping(value = "/denyApply")
	@ResponseBody
	public String denyApply(@RequestBody Map<String, Object> param) throws Exception {
		List<String> userEmails = new ObjectMapper().readValue(param.get("userEmails").toString(), List.class);
		tbl_group_service.denyApply(userEmails);
		return String.valueOf(userEmails);
	}

	// 모임해산 이동
	@RequestMapping(value = "/toGroupDelete")
	public String toGroupDelete() {
		// System.out.println("그룹 번호 :" + seq_group);
		return "group/groupDelete";
	}

	// 모임해산하기
	@RequestMapping(value = "/groupDelete")
	public String groupDelete(int seq_group) throws Exception {

		System.out.println("그룹번호 : " + seq_group);
		tbl_group_service.groupDelete(seq_group);
		return "redirect:/";
	}

}
