package com.kiri.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Board_FileDTO;

@Repository
public class Board_FileDAO {
	
	@Autowired
	private SqlSession session;
	
	// 파일 db 넣기
	public void uploadFile(Board_FileDTO dto) throws Exception{
		session.insert("fileMapper.insert", dto);
	}
	
	// 파일 삭제
	public void delete(String saveName) throws Exception{
		session.delete("fileMapper.delete", saveName);
	}
	
	// 모든 saveName 가져오기
	public List<String> selectSaveName() throws Exception{
		return session.selectList("fileMapper.selectSaveName");
	}
	
	// 게시글에 있는 파일 이름 가져오기
	public List<String> selectFile(int seq_board) throws Exception{
		return session.selectList("fileMapper.selectFile", seq_board);
	}
}
