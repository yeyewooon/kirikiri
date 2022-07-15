package com.kiri.dao;

import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_ApplyDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.dto.WishListDTO;

@Repository
public class Tbl_GroupDAO {

	@Autowired
	private BasicDataSource bds;
	
	@Autowired
	private SqlSession session;
	
	// 그룹 생성
	public void createGroup(Tbl_GroupDTO dto) throws Exception{
		int rs = session.insert("tblGroupMapper.createGroup", dto);
		if(rs > 0) System.out.println("tbl_group 생성 성공");
		else System.out.println("tbl_group 생성 실패");
	}

	// 모임 시퀀스 번호 출력
//	public int selectSeq_Group_Seq() throws Exception{
//		int rs = session.selectOne("tblGroupMapper.selectSeqGroup");
//		return rs;
//	}

	// 그룹 생성시 group_member에 호스트로 insert
	public void insertGroupHost(Group_MemberDTO group_member_dto) throws Exception{
		int rs = session.insert("tblGroupMapper.insertGroupHost", group_member_dto);
		if(rs > 0) System.out.println("group_member 삽입 완료");
		else System.out.println("group_member 삽입 실패");
	}
	
	// 그룹 디테일 조회
	public Tbl_GroupDTO selectGroupDetail(int seq_group) throws Exception {
		Tbl_GroupDTO tbl_group_dto = session.selectOne("tblGroupMapper.selectGroupDetail", seq_group);
		return tbl_group_dto;
	}

	// 그룹 수정
	public void modifyGroup(Tbl_GroupDTO tbl_group_dto) throws Exception{
		int rs = session.update("tblGroupMapper.updateGroup", tbl_group_dto);
		if(rs > 0) System.out.println("group 수정 완료");
		else System.out.println("group 수정 실패");
	}

	// 해당 그룹 맴버 조회
	public List<Group_MemberDTO> selectGroupMember(int seq_group) throws Exception{
		return session.selectList("tblGroupMapper.selectGroupMember", seq_group);
	}

	// 해당 그룹 맴버 탈퇴
	public int quitGroupMember(Group_MemberDTO group_member_dto) throws Exception{
		return session.delete("tblGroupMapper.quitGroupMember", group_member_dto);
	}
	
	// 그룹 가입 신청 맴버 조회
	public List<Group_ApplyDTO> selectApplyList(int seq_group) throws Exception{
		return session.selectList("tblGroupMapper.selectApplyList", seq_group);
	}

	// 그룹 가입 신청
	public int applyGroupMember(Group_ApplyDTO group_apply_dto) throws Exception{
		return session.insert("tblGroupMapper.applyGroupMember", group_apply_dto);	
	}

	// 해당 그룹 찜 추가
	public int insertWishList(WishListDTO wish_list_dto) throws Exception{
		return session.insert("tblGroupMapper.insertWishList",wish_list_dto);
		
	}

	// 해당 그룹 찜 명단
	public List<WishListDTO> selectWishList(int seq_group) throws Exception{
		return session.selectList("tblGroupMapper.selectWishList", seq_group);
	}

	// 해당 그룹 찜 삭제
	public int deletetWishList(WishListDTO wish_list_dto) throws Exception{
		return session.delete("tblGroupMapper.deletetWishList", wish_list_dto);
	}
	
	
	
	
	
}
