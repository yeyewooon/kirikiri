package com.kiri.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.service.Tbl_GroupService;

@RequestMapping("/group")
@Controller
public class GroupController {
	@Autowired
	private HttpSession session;
	
	@Autowired
	private Tbl_GroupService service;
	
	// 모임 생성페이지로 이동
	@RequestMapping(value="/toCreateGroup")
	public String toMakeGroup() {
		return "/group/createGroup";
	}
	
	// 그룹 만들기
	@RequestMapping(value="/createGroup")
	public String makeGroup(Tbl_GroupDTO tbl_group_dto, MultipartFile groupFile, HttpSession session) throws Exception{
		Group_MemberDTO group_member_dto = new Group_MemberDTO();
		
		// 임시 아이디, 닉네임 session에서 뽑아올 값
		String user_email = "zx8634";
		String user_nickname = "꼬끼리끼리";
		// setter 설정
		tbl_group_dto.setUser_email(user_email);
		
		// 출력만 
		System.out.println("그룹 만들기 컨트롤러");
		System.out.println(tbl_group_dto.toString());
		System.out.println("groupFile : " + groupFile);
		
		// 사진을 넣었다면 실행
		if(!groupFile.isEmpty()) {
			// 그룹 프로필 사진 저장(group_profile)
			String realPath = session.getServletContext().getRealPath("group_profile");
			System.out.println("realPath : " + realPath);
			String sys_name = service.uploadProfile(groupFile, realPath);
			String ori_name = groupFile.getOriginalFilename();
			// sys_name setter 설정
			tbl_group_dto.setSys_name(sys_name);
			// ori_name setter 설정
			tbl_group_dto.setOri_name(ori_name);
		}
		
		//그룹 생성(tbl_group)
		service.createGroup(tbl_group_dto);
		
		// setter 주입 session에서 뽑아 올 값
		group_member_dto.setUser_email(user_email);
		group_member_dto.setUser_nickname(user_nickname);
		
		// group_member로 삽입시 호스트로 설정
		service.insertGroupHost(group_member_dto);
		
		return "";
	}
	
	@RequestMapping(value ="/buttonPage")
	public String buttonPage() throws Exception{
		return "buttonPage";
	}
	
	// 수정페이지로 이동
	@RequestMapping(value ="/toMoifyGroup")
	public String toMoifyGroup(int seq_group, Model model) throws Exception{
		System.out.println("groupDetail 잘들어옴");
		System.out.println(seq_group);
		
		// tbl_group의 데이터 가져오기
		Tbl_GroupDTO tbl_group_dto = service.selectGroupDetail(seq_group);
		System.out.println(tbl_group_dto.toString());
		model.addAttribute("tbl_group_dto", tbl_group_dto);
		return "/group/modifyGroup";
	}
	
	// 수정페이지 
	@RequestMapping(value ="/moifyGroup")
	public String moifyGroup(Tbl_GroupDTO tbl_group_dto,MultipartFile groupFile,HttpSession session) throws Exception{
		System.out.println("moifyGroup 잘들어옴");
		System.out.println(tbl_group_dto.toString());
		int seq_group = tbl_group_dto.getSeq_group();
		System.out.println(seq_group);
		System.out.println("groupFile" + groupFile);
			
		 // 사진을 넣었다면 실행
		if (!groupFile.isEmpty()) {
			System.out.println("hello!!");
			// 그룹 프로필 사진 저장(group_profile)
			String realPath = session.getServletContext().getRealPath("group_profile");
			System.out.println(realPath);
			String sys_name = service.uploadProfile(groupFile, realPath);
			String ori_name = groupFile.getOriginalFilename();
			// sys_name setter 설정
			tbl_group_dto.setSys_name(sys_name);
			// ori_name setter 설정
			tbl_group_dto.setOri_name(ori_name);
		}
		
		// 수정
		service.modifyGroup(tbl_group_dto);
		
		return "/group/toMoifyGroup?seq_group="+seq_group;
	}
	
	
}