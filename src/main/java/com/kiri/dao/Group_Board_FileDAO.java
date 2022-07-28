package com.kiri.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_Board_FileDTO;

@Repository
public class Group_Board_FileDAO {
	
	@Autowired
	private SqlSession session;
	// 파일 db 넣기
	public void uploadFile(Group_Board_FileDTO dto) throws Exception{
		System.out.println(dto.toString());
		session.insert("fileMapper.insertG", dto);
	}
	
	// 파일 삭제
	public void delete(String saveName) throws Exception{
		session.delete("fileMapper.deleteG", saveName);
	}
}
