package com.kiri.dao;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_ChatDTO;
import com.kiri.dto.Group_MemberDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.Tbl_GroupDTO;

@Repository
public class Group_ChatDAO {
	@Autowired
	private SqlSession session;
	
	public void insert(Group_ChatDTO dto) throws Exception{
		session.insert("chatMapper.insert", dto);
	}
	
	public List<Group_ChatDTO> selectChat(int seq_group) throws Exception{
		return session.selectList("chatMapper.selectChat", seq_group);
	}
	
	public List<Tbl_GroupDTO> selectGroup(int seq_group) throws Exception{
		return session.selectList("chatMapper.selectGroup", seq_group);
	}
	
	public List<Group_MemberDTO> selectNick(int seq_group) throws Exception{
		return session.selectList("chatMapper.selectNick", seq_group);
	}
	
	public MemberDTO getProfileImg(String user_nickname) throws Exception{ 
		MemberDTO dto = session.selectOne("chatMapper.getProfileImg", user_nickname);
		return dto;
	}
	
	
}
