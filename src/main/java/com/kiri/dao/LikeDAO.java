package com.kiri.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDAO {
	@Autowired
	private SqlSession session;
	
	// board 테이블 좋아요 개수 +1
	public void updateLike(int seq_board) throws Exception{
		session.update("likeMapper.updateLike", seq_board);
	}
	
	// board 테이블 좋아요 개수 -1
	public void updateLikeCancel(int seq_board) throws Exception{
		session.update("likeMapper.updateLikeCancel", seq_board);
	}
	
	// 좋아요
	public void likeUp(int seq_board, String user_email) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_board", seq_board);
		map.put("user_email", user_email);
		session.insert("likeMapper.likeUp", map);
	}
	
	// 좋아요 해제
	public void likeDown(int seq_board, String user_email) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_board", seq_board);
		map.put("user_email", user_email);
		session.delete("likeMapper.likeDown", map);
	}
	
	// 중복 체크
	public int likeCheck(int seq_board, String user_email) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_board", seq_board);
		map.put("user_email", user_email);
		return session.selectOne("likeMapper.likeCheck", map);
	}
}
