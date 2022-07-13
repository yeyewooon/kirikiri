package com.kiri.dao;

import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;

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
	public void modifyGroup(Tbl_GroupDTO tbl_group_dto) {
		int rs = session.update("tblGroupMapper.updateGroup", tbl_group_dto);
		if(rs > 0) System.out.println("group 수정 완료");
		else System.out.println("group 수정 실패");
	}
	
	
}
