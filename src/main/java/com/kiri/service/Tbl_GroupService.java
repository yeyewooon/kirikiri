package com.kiri.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kiri.dao.Tbl_GroupDAO;
import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.TableJoinDTO;

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
			Group_MemberDTO member = new Group_MemberDTO(dto.getUser_email(), dto.getSeq_group(),
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
	public Map<String, Object> selectGroupMember(int seq_group) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("TableJoinDTO", tbl_group_dao.selectGroupMember(seq_group));
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
}
