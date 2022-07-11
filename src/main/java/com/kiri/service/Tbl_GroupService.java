package com.kiri.service;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kiri.dao.Tbl_GroupDAO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;

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
}
