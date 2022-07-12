package com.kiri.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_ChatDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;

@Repository
public class Group_ChatDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(Group_ChatDTO dto) throws Exception{
		session.insert("chatMapper.insert", dto);
	}
	
	public List<Group_ChatDTO> selectList(int seq_group) throws Exception{
		return session.selectList("chatMapper.selectList", seq_group);
	}
	
	public List<Tbl_GroupDTO> selectGroup(int seq_group) throws Exception{
		return session.selectList("chatMapper.selectGroup", seq_group);
	}
	
	public List<String> selectNick(int seq_group) throws Exception{
		return session.selectList("chatMapper.selectNick", seq_group);
	}
	
	public String getProfile(String user_nickname) throws Exception{
		return session.selectOne("chatMappper.getProfile", user_nickname);
	}
}
