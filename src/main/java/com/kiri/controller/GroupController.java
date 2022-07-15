package com.kiri.controller;

import java.util.List;
<<<<<<< HEAD
import java.util.Map;
=======
>>>>>>> 811b2f1e80664298b397fe202e26bc7034218d16

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
<<<<<<< HEAD
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.service.Tbl_GroupService;
=======
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.dto.WishListDTO;
import com.kiri.service.Tbl_GroupService;

>>>>>>> 811b2f1e80664298b397fe202e26bc7034218d16

@RequestMapping("/group")
@Controller
public class GroupController {
	@Autowired
<<<<<<< HEAD
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
=======
	private HttpSession session;
	
	@Autowired
	private Tbl_GroupService tbl_group_service;
	
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
		String user_email = "qwekjsadkw";
		String user_nickname = "내삶의반";
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
			String sys_name = tbl_group_service.uploadProfile(groupFile, realPath);
			String ori_name = groupFile.getOriginalFilename();
			// sys_name setter 설정
			tbl_group_dto.setSys_name(sys_name);
			// ori_name setter 설정
			tbl_group_dto.setOri_name(ori_name);
		}
		
		//그룹 생성(tbl_group)
		tbl_group_service.createGroup(tbl_group_dto);
		
		// setter 주입 session에서 뽑아 올 값
		group_member_dto.setUser_email(user_email);
		group_member_dto.setUser_nickname(user_nickname);
		
		// group_member로 삽입시 호스트로 설정
		tbl_group_service.insertGroupHost(group_member_dto);
		
		return "";
	}
	
	@RequestMapping(value ="/buttonPage")
	public String buttonPage() throws Exception{
		return "buttonPage";
	}
	
	// 수정페이지로 이동
	@RequestMapping(value ="/toModifyGroup")
	public String tomodifyGroup(int seq_group, Model model) throws Exception{
		System.out.println("groupDetail 잘들어옴");
		System.out.println(seq_group);
		
		// tbl_group의 데이터 가져오기
		Tbl_GroupDTO tbl_group_dto = tbl_group_service.selectGroupDetail(seq_group);
		// 수정하는 모임 맴버 가져오기 (맴버수 판단을 위해 사용)
		List<Group_MemberDTO> memberList = tbl_group_service.selectGroupMember(seq_group);
		
		model.addAttribute("tbl_group_dto", tbl_group_dto);
		model.addAttribute("memberList", memberList);
		return "/group/modifyGroup";
	}
	
	// 수정페이지 
	@RequestMapping(value ="/modifyGroup")
	public String modifyGroup(Tbl_GroupDTO tbl_group_dto,MultipartFile groupFile,HttpSession session) throws Exception{
		System.out.println("modifyGroup 잘들어옴");
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
			String sys_name = tbl_group_service.uploadProfile(groupFile, realPath);
			String ori_name = groupFile.getOriginalFilename();
			// sys_name setter 설정
			tbl_group_dto.setSys_name(sys_name);
			// ori_name setter 설정
			tbl_group_dto.setOri_name(ori_name);
		}
		
		// 수정
		tbl_group_service.modifyGroup(tbl_group_dto);
		
		return "redirect:/group/toGroupDetail?seq_group="+seq_group;
	}
	
	// 그룹 상세 페이지
	@RequestMapping(value = "/toGroupDetail")
	public String toGroupDetail(int seq_group, Model model) throws Exception{
		Tbl_GroupDTO tbl_group_dto = new Tbl_GroupDTO();
		Group_MemberDTO group_member_dto = new Group_MemberDTO();
		Group_ApplyDTO group_apply_dto = new Group_ApplyDTO();
		
		tbl_group_dto = tbl_group_service.selectGroupDetail(seq_group); // 그룹 조회 
		List<Group_MemberDTO> memberList = tbl_group_service.selectGroupMember(seq_group); // 해당 그룹 맴버 조회(주최자가 우선적으로 [0]에 담기게 뽑음)
		System.out.println("tbl_group 조회 : " + tbl_group_dto.toString());
		for(Group_MemberDTO dto : memberList) {
			System.out.println(dto.toString());
		}
		
		// 모임 신청 리스트 
		List<Group_ApplyDTO> applyList = tbl_group_service.selectApplyList(seq_group);
		System.out.println(applyList.toString());
		
		// 찜 리스트 
		List<WishListDTO> wishList = tbl_group_service.selectWishList(seq_group);
		System.out.println(wishList.toString());
		
		model.addAttribute("tbl_group_dto", tbl_group_dto); // 해당 그룹 내용 가져오기 
		model.addAttribute("memberList", memberList); // 해당 그룹 맴버 목록 가져오기 
		model.addAttribute("applyList", applyList); // 해당 그룹 신청 목록 가져오기 
		model.addAttribute("wishList", wishList); // 해당 그룹 찜 목록 보여주기
		
		return "/group/groupDetail";
	}
	
	
	// 그룹에서 회원 탈퇴
	@ResponseBody
	@RequestMapping(value="/quitGroupMember")
	public String quitGroupMember(Group_MemberDTO group_member_dto) throws Exception{
		System.out.println(group_member_dto.toString());
		
		int rs = tbl_group_service.quitGroupMember(group_member_dto);
		if(rs > 0) {
			System.out.println("탈퇴성공");
			return "success";
		}
		else {
			System.out.println("탈퇴 실패");
			return "fail";
		}
	}
	
	// 그룹 가입 신청
	@ResponseBody
	@RequestMapping(value="/applyGroupMember")
	public String applyGroupMember(Group_ApplyDTO group_apply_dto) throws Exception{
		// ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname;
		// ((MemberDTO)session.getAttribute("loginSession")).getUser_bd;
		
		group_apply_dto.setUser_nickname("해피해피 합니다"); // 위의 세션에서 nickname 가져와야함 
		// group_apply_dto.setUser_bd(null); // 위의 세션에서 bd 가져와야함
		
		int rs = tbl_group_service.applyGroupMember(group_apply_dto);
		if(rs > 0) {
			System.out.println("가입 신청 성공");
			return "success";
		}else {
			System.out.println("가입 신청 실패");
			return "success";
		}
	}
	
	// 해당 그룹 찜 추가
	@ResponseBody
	@RequestMapping(value="/insertWishList")
	public String insertWishList(WishListDTO wish_list_dto) throws Exception {
		int rs = tbl_group_service.insertWishList(wish_list_dto);
		if(rs > 0) {
			System.out.println("찜 추가 완료");
			return "success";
		}else {
			System.out.println("찜 추가 완료");
			return "fail";
		}
	}
	
	// 해당 그룹 찜 삭제
		@ResponseBody
		@RequestMapping(value="/deletetWishList")
		public String deletetWishList(WishListDTO wish_list_dto) throws Exception {
			int rs = tbl_group_service.deletetWishList(wish_list_dto);
			if(rs > 0) {
				System.out.println("찜 취소 완료");
				return "success";
			}else {
				System.out.println("찜 취소 완료");
				return "fail";
			}
		}
	
	
}
>>>>>>> 811b2f1e80664298b397fe202e26bc7034218d16
