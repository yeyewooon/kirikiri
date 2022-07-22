package com.kiri.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_ChatDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.SiteDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.dto.WishListDTO;
import com.kiri.service.Group_ChatService;
import com.kiri.service.Tbl_GroupService;

@RequestMapping("/group")
@Controller
public class GroupController {
   @Autowired
   private Tbl_GroupService tbl_group_service;

   
   
   // 2022/07/15 김영완
   @Autowired
   private HttpSession session;

   //////////////////////////////////////////////////////////////
   // 김형석
   // 멤버관리 이동(o)
   @RequestMapping(value = "/toGroupMember")
   public String selectGroupAccess(int seq_group, Model model) throws Exception {
       System.out.println("그룹 번호 : " + seq_group);
      Map<String, Object> memList = tbl_group_service.selectGroupAccess(seq_group);
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
		/*
		 * System.out.println("직책 : " + Group_MemberDTO.getAccess());
		 * System.out.println("이메일 : " + Group_MemberDTO.getUser_email());
		 */
	   System.out.println(Group_MemberDTO);
      tbl_group_service.groupAccess(Group_MemberDTO);
    
      
      System.out.println("==================================================");
      String email = ((MemberDTO)session.getAttribute("loginSession")).getUser_email();
      Group_MemberDTO.setUser_email(email);
      Group_MemberDTO.setAccess("주최자");
      System.out.println(Group_MemberDTO);
      //System.out.println("이메일 : " + Group_MemberDTO.getUser_email()); 
      tbl_group_service.groupAccess(Group_MemberDTO);
 
      return "success";
   }

   // 멤버관리에서 멤버 강퇴(o)
   @RequestMapping(value = "/deleteMember")
   @ResponseBody
   public String groupMemberDelete(@RequestBody Map<String, Object> param) throws Exception {
      List<String> userEmails = new ObjectMapper().readValue(param.get("userEmails").toString(), List.class);
      tbl_group_service.groupMemberDelete(userEmails);
      return String.valueOf(userEmails);
   }

   // 모임가입 이동(o)
   @RequestMapping(value = "/toGroupApply")
   public String groupApply(int seq_group, Model model) throws Exception {
      // System.out.println("그룹번호 : " + seq_group);
      int count = tbl_group_service.applyCount(seq_group);
      int groupCount = tbl_group_service.groupCount(seq_group);
      /*
       * System.out.println("인원수 : " + count); 
       * System.out.println("모임에 가입한 인원 : " + groupCount);
       */
      model.addAttribute("count", count);
      model.addAttribute("groupCount", groupCount);
      Map<String, Object> map = tbl_group_service.selectApply(seq_group);

      map.get("MemberDTO");
      model.addAttribute("map", map);
      return "group/groupApply";
   }

   // 그룹 멤버 승인과 동시에 group_apply 테이블에서 삭제하기(o)
   @RequestMapping(value = "/completeApply")
   @ResponseBody
   public String completeApply(@RequestBody Map<String, Object> param, int group_people, int groupCount)
         throws Exception {
      // System.out.println("그룹에 가입한 인원 : " + groupCount);
      List<String> userEmails = new ObjectMapper().readValue(param.get("userEmails").toString(), List.class);
      if (userEmails.size() + groupCount < group_people) {
         tbl_group_service.completeApply(userEmails);
      } else if (userEmails.size() + groupCount >= group_people) {
         return "error";
      }

      return "success";
   }

   // 그룹 승인 거절하기(o)
   @RequestMapping(value = "/denyApply")
   @ResponseBody
   public String denyApply(@RequestBody Map<String, Object> param) throws Exception {
      List<String> userEmails = new ObjectMapper().readValue(param.get("userEmails").toString(), List.class);
      tbl_group_service.denyApply(userEmails);
      return String.valueOf(userEmails);
   }

   // 모임해산 이동(o)
   @RequestMapping(value = "/toGroupDelete")
   public String toGroupDelete() {
      // System.out.println("그룹 번호 :" + seq_group);
      return "group/groupDelete";
   }

   // 모임해산하기(o)
   @RequestMapping(value = "/groupDelete")
   public String groupDelete(int seq_group) throws Exception {

      System.out.println("그룹번호 : " + seq_group);
      tbl_group_service.groupDelete(seq_group);
      return "redirect:/";
   }

   /////////////////////////////////////////////////////////////////////////////////////////
   // 김영완

   // 모임 생성페이지로 이동
   @RequestMapping(value = "/toCreateGroup")
   public String toMakeGroup() {
      return "/group/createGroup";
   }

   // 그룹 만들기
   @RequestMapping(value = "/createGroup")
   public String makeGroup(Tbl_GroupDTO tbl_group_dto, MultipartFile groupFile, HttpSession session) throws Exception {
      Group_MemberDTO group_member_dto = new Group_MemberDTO();

      // 세션 아이디, 닉네임 session에서 뽑아올 값
      String user_email = ((MemberDTO) session.getAttribute("loginSession")).getUser_email();
      String user_nickname = ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname();

      // setter 설정
      tbl_group_dto.setUser_email(user_email);

      // 출력만
      System.out.println("그룹 만들기 컨트롤러");
      System.out.println(tbl_group_dto.toString());
      System.out.println("groupFile : " + groupFile);

      // 사진을 넣었다면 실행
      if (!groupFile.isEmpty()) {
         // 그룹 프로필 사진 저장(group_profile)
         String realPath = session.getServletContext().getRealPath("group_profile");
         String sys_name = tbl_group_service.uploadProfile(groupFile, realPath);
         String ori_name = groupFile.getOriginalFilename();
         // sys_name setter 설정
         tbl_group_dto.setSys_name(sys_name);
         // ori_name setter 설정
         tbl_group_dto.setOri_name(ori_name);
      }

      // 그룹 생성(tbl_group)
      tbl_group_service.createGroup(tbl_group_dto);

      // setter 주입 session에서 뽑아 올 값
      group_member_dto.setUser_email(user_email);
      group_member_dto.setUser_nickname(user_nickname);

      // group_member로 삽입시 호스트로 설정
      tbl_group_service.insertGroupHost(group_member_dto);

      return "";
   }

   @RequestMapping(value = "/buttonPage")
   public String buttonPage() throws Exception {
      return "buttonPage";
   }

   // 수정페이지로 이동
   @RequestMapping(value ="/toModifyGroup")
   public String tomodifyGroup(int seq_group, Model model) throws Exception{
      // tbl_group의 데이터 가져오기
      Tbl_GroupDTO tbl_group_dto = tbl_group_service.selectGroupDetail(seq_group);
      // 수정하는 모임 맴버 가져오기 (맴버수 판단을 위해 사용)
      List<Group_MemberDTO> memberList = tbl_group_service.selectGroupMember(seq_group);

      model.addAttribute("tbl_group_dto", tbl_group_dto);
      model.addAttribute("memberList", memberList);
      return "/group/modifyGroup";
   }

   // 수정페이지
   @RequestMapping(value = "/modifyGroup")
   public String modifyGroup(Tbl_GroupDTO tbl_group_dto, MultipartFile groupFile, HttpSession session)
         throws Exception {
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

      return "redirect:/group/toGroupDetail?seq_group=" + seq_group;
   }

   // 그룹 상세 페이지
   @RequestMapping(value = "/toGroupDetail")
   public String toGroupDetail(int seq_group, Model model) throws Exception {
      Tbl_GroupDTO tbl_group_dto = new Tbl_GroupDTO();
      Group_MemberDTO group_member_dto = new Group_MemberDTO();
      Group_ApplyDTO group_apply_dto = new Group_ApplyDTO();
      // 기본 세션아이디 세션닉네임 설정
      String loginSession_id;
      String loginSession_nickName;
      
      tbl_group_dto = tbl_group_service.selectGroupDetail(seq_group); // 그룹 조회
      List<Group_MemberDTO> memberList = tbl_group_service.selectGroupMember(seq_group); // 해당 그룹 맴버 조회(주최자가 우선적으로 // [0]에 담기게 뽑음)
      
      if(session.getAttribute("loginSession") != null) { // 세션이 null이 아닐때 
         loginSession_id = ((MemberDTO) session.getAttribute("loginSession")).getUser_email(); // 현재 세션 아이디
         loginSession_nickName = ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname(); // 현재 세션 닉네임
      }else { // 세션이 null 일때
         loginSession_id = "youHaveToLogin";
         loginSession_nickName = "youHaveToLogin";
      }
      // 모임 신청 리스트
      List<Group_ApplyDTO> applyList = tbl_group_service.selectApplyList(seq_group);
      // 찜 리스트
      List<WishListDTO> wishList = tbl_group_service.selectWishList(seq_group);
      // TableJoinDTO에서 가져옴 
      Map<String, Object> mapList =  tbl_group_service.selectGroupAccess(seq_group);
      mapList.get("TableJoinDTO");
      
      model.addAttribute("tbl_group_dto", tbl_group_dto); // 해당 그룹 내용 가져오기
      model.addAttribute("memberList", memberList); // 해당 그룹 맴버 목록 가져오기
      model.addAttribute("applyList", applyList); // 해당 그룹 신청 목록 가져오기
      model.addAttribute("wishList", wishList); // 해당 그룹 찜 목록 보여주기
      model.addAttribute("loginSession_id",loginSession_id); // 현재 세션 아이디
      model.addAttribute("loginSession_nickName",loginSession_nickName); // 현재 세션 닉네임
      model.addAttribute("mapList", mapList); // MemberDTO + GroupMember

      return "/group/groupDetail";
   }
   
   // 그룹 페이지에서 맴버 프로필 조회
   @ResponseBody
   @RequestMapping(value="/selectMemberProfile")
   public Map<String, Object> selectMemberProfile(String user_email) throws Exception {
      List<MemberDTO> profileList = tbl_group_service.selectMemberProfile(user_email); // 회원 프로필 가져오기
      List<SiteDTO> siteList = tbl_group_service.selectMemberSite(user_email); // 회원 주소 가져오기 
      System.out.println(profileList.toString());
      System.out.println("절취선-----------------------");
      System.out.println(siteList.toString());
      
      
      Map<String, Object> map = new HashMap<>();
      map.put("profileList", profileList); // 프로필 리스트 
      map.put("siteList", siteList); // 주소 리스트
      return map;
   }
   
   
   

   // 그룹에서 회원 탈퇴
   @ResponseBody
   @RequestMapping(value = "/quitGroupMember")
   public String quitGroupMember(Group_MemberDTO group_member_dto) throws Exception {
      System.out.println(group_member_dto.toString());

      int rs = tbl_group_service.quitGroupMember(group_member_dto);
      if (rs > 0) {
         System.out.println("탈퇴성공");
         return "success";
      } else {
         System.out.println("탈퇴 실패");
         return "fail";
      }
   }

   // 그룹 가입 신청
   @ResponseBody
   @RequestMapping(value = "/applyGroupMember")
   public String applyGroupMember(Group_ApplyDTO group_apply_dto) throws Exception {
      // ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname;
      // ((MemberDTO)session.getAttribute("loginSession")).getUser_bd;

      group_apply_dto.setUser_nickname("해피해피 합니다"); // 위의 세션에서 nickname 가져와야함
      // group_apply_dto.setUser_bd(null); // 위의 세션에서 bd 가져와야함

      int rs = tbl_group_service.applyGroupMember(group_apply_dto);
      if (rs > 0) {
         System.out.println("가입 신청 성공");
         return "success";
      } else {
         System.out.println("가입 신청 실패");
         return "success";
      }
   }

   // 해당 그룹 찜 추가
   @ResponseBody
   @RequestMapping(value = "/insertWishList")
   public String insertWishList(WishListDTO wish_list_dto) throws Exception {
      int rs = tbl_group_service.insertWishList(wish_list_dto);
      if (rs > 0) {
         System.out.println("찜 추가 완료");
         return "success";
      } else {
         System.out.println("찜 추가 완료");
         return "fail";
      }
   }

   // 해당 그룹 찜 삭제
   @ResponseBody
   @RequestMapping(value = "/deletetWishList")
   public String deletetWishList(WishListDTO wish_list_dto) throws Exception {
      int rs = tbl_group_service.deletetWishList(wish_list_dto);
      if (rs > 0) {
         System.out.println("찜 취소 완료");
         return "success";
      } else {
         System.out.println("찜 취소 완료");
         return "fail";
      }
   }

///////////////////////김예원 채팅////////////////////////////////////////////////

   @Autowired
   private Group_ChatService gcService;

	@RequestMapping(value = "/toChat") // 채팅 페이지 요청
	public String chat(Model model, int seq_group) throws Exception {
		//session에서 받아온 닉네임
		// 현재 세션 아이디
		String user_nickname = ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname();
		System.out.println(user_nickname);
		
		model.addAttribute("user_nickname", user_nickname);
		System.out.println(seq_group);
		model.addAttribute("seq_group", seq_group);
		// 채팅 했던 부분 불러오기
		List<Group_ChatDTO> gcList = gcService.selectChat(seq_group);
		model.addAttribute("gcList", gcList);
		// 그룹정보 가져오기(채팅방, 사람 수)
		List<Tbl_GroupDTO> tgList = gcService.selectGroup(seq_group);
		model.addAttribute("tgList", tgList);

      // 닉네임 리스트 가져와서 프로필 사진 member에서 꺼내오기
      List<Group_MemberDTO> nickList = gcService.selectNick(seq_group);
      List<String> profileList = new ArrayList<>();

      for (Group_MemberDTO dto : nickList) {
         user_nickname = dto.getUser_nickname();
         MemberDTO mdto = gcService.getProfileImg(user_nickname);
         profileList.add(mdto.getUser_image());
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