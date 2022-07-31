package com.kiri.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Group_Board_LikeDAO {
	@Autowired
	private SqlSession session;

	// board 테이블 좋아요 개수 +1
	public void updateLike(int seq_group_board) throws Exception {
		session.update("likeMapper.updateLikeG", seq_group_board);
	}

	// board 테이블 좋아요 개수 -1
	public void updateLikeCancel(int seq_group_board) throws Exception {
		session.update("likeMapper.updateLikeCancelG", seq_group_board);
	}

	// 좋아요
	public void likeUp(int seq_group_board, String user_email) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_group_board", seq_group_board);
		map.put("user_email", user_email);
		session.insert("likeMapper.likeUpG", map);
	}

	// 좋아요 해제
	public void likeDown(int seq_group_board, String user_email) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_group_board", seq_group_board);
		map.put("user_email", user_email);
		session.delete("likeMapper.likeDownG", map);
	}

	// 중복 체크
	public int likeCheck(int seq_group_board, String user_email) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq_group_board", seq_group_board);
		map.put("user_email", user_email);
		return session.selectOne("likeMapper.likeCheckG", map);
	}
}
