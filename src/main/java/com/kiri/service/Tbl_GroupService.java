package com.kiri.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kiri.dao.Tbl_GroupDAO;
import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.dto.WishListDTO;

@Service
public class Tbl_GroupService {

	@Autowired
	private Tbl_GroupDAO tbl_group_dao;

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

}
