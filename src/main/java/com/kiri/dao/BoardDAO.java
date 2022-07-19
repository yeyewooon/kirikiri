package com.kiri.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession session;

	// 내가 쓴 글 정보 가져오기
	public List<BoardDTO> selectBoardList(String user_email) throws Exception{
		return session.selectList("myPageMapper.selectBoardList",user_email);
	}	
	
	// 전체 게시글 정보 가져오기
	public List<Map<String,Object>> selectTotalBoardList(String user_email) throws Exception{
		return session.selectList("myPageMapper.selectTotalBoardList",user_email);
	}
	
	// 일반 게시판 갯수 뽑아오기
	public int selectBoardCount(String user_email) throws Exception{
		return session.selectOne("myPageMapper.selectBoardCount",user_email);
	}	
	
	// 일반 게시판 삭제
	public int boardDelete(int seq_board) throws Exception{
		return session.delete("myPageMapper.boardDelete",seq_board);
	}
	
	// 검색으로 일반글 정보 가져오기
	public List<BoardDTO> genalSearchList(String category, String keyword,String user_email) throws Exception{
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("user_email", user_email);
		
		System.out.println(map);
		return session.selectList("myPageMapper.genalSearchList",map);
	}
}
