package com.kiri.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.TableJoinDTO;

@Repository
public class Tbl_GroupDAO {
	@Autowired
	private SqlSession session;

	// 모임 가입신청 목록 불러오기
	public List<MemberDTO> selectApply(int seq_group) throws Exception {
		return session.selectList("tblGroupMapper.selectApply", seq_group);
	}
	// 모임 인원수 불러오기
	public int applyCount(int seq_group) throws Exception{
		return session.selectOne("tblGroupMapper.applyCount", seq_group);
	}
	
	// 가입한 모임의 멤버수 가져오기
	public int groupCount(int seq_group) throws Exception{
		return session.selectOne("tblGroupMapper.groupCount", seq_group);
	}

	// 모임 가입신청 목록 불러오기2
	public List<Group_ApplyDTO> selectApplyByEmail(Map<String, Object> param) throws Exception {
		return session.selectList("tblGroupMapper.selectApplyByEmail", param);
	}

	// 모임 가입 승인하기
	public void completeApply(Group_MemberDTO Group_MemberDTO) throws Exception {
		session.insert("tblGroupMapper.completeApply", Group_MemberDTO);
	}

	// 모임 가입 거절하기
	public void denyApply(Map<String, Object> param) throws Exception {
		session.delete("tblGroupMapper.denyApply", param);
	}

	// 해당 그룹 맴버 조회
	public List<MemberDTO> selectGroupMember(int seq_group) {
		return session.selectList("tblGroupMapper.selectGroupMember", seq_group);
	}
	
	// 모임장 위임
	public int groupAccess(Group_MemberDTO Group_MemberDTO) throws Exception{
		return session.update("tblGroupMapper.groupAccess", Group_MemberDTO);
	}
	
	// 그룹 멤버 강퇴
	public void groupMemberDelete(Map<String, Object> param) throws Exception {
		session.delete("tblGroupMapper.groupMemberDelete", param);
	}
	
	// 모임 해산하기
	public int groupDelete(int seq_group) throws Exception {
		return session.delete("tblGroupMapper.groupDelete", seq_group);
	}
}
