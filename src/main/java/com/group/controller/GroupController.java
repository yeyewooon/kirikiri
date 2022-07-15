package com.group.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/group")
@Controller
public class GroupController {

	// 멤버관리 이동
	@RequestMapping(value = "/toGroupMember")
	public String groupMember() {
		return "group/groupMember";
	}
	// 모임가입 이동
	@RequestMapping(value = "/toGroupApply")
	public String groupApply() {
		return "group/groupApply";
	}
	// 모임해산 이동
	@RequestMapping(value = "/toGroupDelete")
	public String groupDelete() {
		return "group/groupDelete";
	}
}
