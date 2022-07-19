package com.kiri.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;


import com.kiri.dao.Tbl_GroupDAO;
import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.SiteDTO;
import com.kiri.dto.TableJoinDTO;



import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.dto.WishListDTO;

@Service
public class Tbl_GroupService {

   @Autowired
   private Tbl_GroupDAO tbl_group_dao;
   
    // 모임 가입신청 목록 불러오기
      public Map<String, Object> selectApply(int seq_group) throws Exception {
         Map<String, Object> map = new HashMap<>();
         // 가입신청 멤버 정보 가져오기
         map.put("MemberDTO", tbl_group_dao.selectApply(seq_group));
         return map;
      }
      
      // 모임 인원제한 수 불러오기
      public int applyCount(int seq_group) throws Exception{
         return tbl_group_dao.applyCount(seq_group);
      }
      
      // 해당 모임에 가입한 인원 불러오기
      public int groupCount(int seq_group) throws Exception{
         return tbl_group_dao.groupCount(seq_group);
      }


      // 모임 가입 승인하기
      @Transactional
      public void completeApply(List<String> userEmails) throws Exception {
         Map<String, Object> param = new HashMap<>();
         param.put("userEmails", userEmails);
         List<Group_ApplyDTO> list = tbl_group_dao.selectApplyByEmail(param);

         for (Group_ApplyDTO dto : list) {
            Group_MemberDTO member = new Group_MemberDTO(0, dto.getUser_email(), dto.getSeq_group(),
                  dto.getUser_nickname(), "일반멤버");
            tbl_group_dao.completeApply(member);
         }

         denyApply(userEmails);
      }

      // 모임 가입 거절하기
      public void denyApply(List<String> userEmails) throws Exception {
         Map<String, Object> param = new HashMap<>();
         param.put("userEmails", userEmails);
         tbl_group_dao.denyApply(param);
      }

      // 해당 그룹 맴버 조회
      public Map<String, Object> selectGroupAccess(int seq_group) throws Exception{
         Map<String, Object> map = new HashMap<>();
         map.put("TableJoinDTO", tbl_group_dao.selectGroupAccess(seq_group));
         return map;
      }
      
      // 그룹 모임장 위임
      public int groupAccess(Group_MemberDTO Group_MemberDTO) throws Exception{
         return tbl_group_dao.groupAccess(Group_MemberDTO);
      }
      
      // 해당 그룹 멤버 강퇴
      public void groupMemberDelete(List<String> userEmails) throws Exception {
         Map<String, Object> param = new HashMap<>();
         param.put("userEmails", userEmails);
         tbl_group_dao.groupMemberDelete(param);
      }
      
      // 모임 해산하기
      public int groupDelete(int seq_group) throws Exception {
         return tbl_group_dao.groupDelete(seq_group);
      }

      ///////////////////////////////////////////////////////////////////////////////////////
      //여기부터 김영완 (7/15)
      // 그룹 생성
      public void createGroup(Tbl_GroupDTO tbl_group_dto) throws Exception {
         tbl_group_dao.createGroup(tbl_group_dto);
      }

      // 그룹 사진 업로드
      public String uploadProfile(MultipartFile groupFile, String realPath) throws Exception {
         Tbl_GroupDTO tbl_group_dto = new Tbl_GroupDTO();
         File realPathFile = new File(realPath);
         if (!realPathFile.exists())
            realPathFile.mkdir();
         String sys_name = null;
         if (!groupFile.isEmpty()) {
            String ori_name = groupFile.getOriginalFilename();
            sys_name = UUID.randomUUID() + "_" + ori_name;
            groupFile.transferTo(new File(realPath + File.separator + sys_name));
         }
         return sys_name;
      }

      // 그룹 생성시 group_member에 호스트로 insert
      public void insertGroupHost(Group_MemberDTO group_member_dto) throws Exception {
         tbl_group_dao.insertGroupHost(group_member_dto);
      }

      // 그룹 디테일 조회
      public Tbl_GroupDTO selectGroupDetail(int seq_group) throws Exception {
         return tbl_group_dao.selectGroupDetail(seq_group);
      }
      
      // 그룹 수정
      public void modifyGroup(Tbl_GroupDTO tbl_group_dto) throws Exception {
         tbl_group_dao.modifyGroup(tbl_group_dto);
      }

      // 해당 그룹 맴버 조회
      public List<Group_MemberDTO> selectGroupMember(int seq_group) throws Exception{
         return tbl_group_dao.selectGroupMember(seq_group);
      }

      // 해당 그룹 맴버 탈퇴
      public int  quitGroupMember(Group_MemberDTO group_member_dto) throws Exception{
         return tbl_group_dao.quitGroupMember(group_member_dto);
      }

      // 해당 그룹 가입 신청 명단 
      public List<Group_ApplyDTO> selectApplyList(int seq_group) throws Exception{
         return tbl_group_dao.selectApplyList(seq_group);
         
      }
      
      // 그룹 가입 신청
      public int applyGroupMember(Group_ApplyDTO group_apply_dto) throws Exception{
         return tbl_group_dao.applyGroupMember(group_apply_dto);
         
      }

      // 해당 그룹 찜 추가
      public int insertWishList(WishListDTO wish_list_dto) throws Exception{
         return tbl_group_dao.insertWishList(wish_list_dto);
      }

      // 해당 그룹 찜 명단
      public List<WishListDTO> selectWishList(int seq_group) throws Exception{
         return tbl_group_dao.selectWishList(seq_group);
      }

      // 해당 그룹 찜 삭제
      public int deletetWishList(WishListDTO wish_list_dto) throws Exception{
         return tbl_group_dao.deletetWishList(wish_list_dto);
      }

      // 해당 그룹 맴버 프로필 조회
	public List<MemberDTO> selectMemberProfile(String user_email) {
		return tbl_group_dao.selectMemberProfile(user_email);
		
	}

	// 해당 그룹 맴버 주소 조회
	public List<SiteDTO> selectMemberSite(String user_email) {
		return tbl_group_dao.selectMemberSite(user_email);
	}


   

}