package com.kiri.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.BoardDTO;
import com.kiri.dto.Group_BoardDTO;

@Repository
public class Group_BoardDAO {

	@Autowired
	private SqlSession session;

	// 모임게시판 리스트 조회
	public List<Group_BoardDTO> selectGroupBoardList(String user_email) throws Exception {
		return session.selectList("myPageMapper.selectGroupBoardList", user_email);
	}

	// 모임게시판 총 갯수
	public int selectGroupBoardCount(String user_email) throws Exception {
		return session.selectOne("myPageMapper.selectGroupBoardCount", user_email);
	}
	
	// 모임게시판 삭제
		public int groupBoardDelete(int seq_board) throws Exception{
			return session.delete("myPageMapper.groupBoardDelete",seq_board);
		}
	
	// 일반게시판 검색으로 조회
		public List<Group_BoardDTO> mettingSearchList(String category, String keyword, String user_email) throws Exception{
			System.out.println(category);
			Map<String, String> map = new HashMap<String, String>();
			map.put("category", category);
			map.put("keyword", keyword);
			map.put("user_email",user_email);
			
			return session.selectList("myPageMapper.mettingSearchList",map);
		}
}
