package com.kiri.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.LikeDAO;

@Service
public class LikeService {
	@Autowired
	LikeDAO likeDAO;
	
	// board 테이블 좋아요 개수 +1
	public void updateLike(int seq_board) throws Exception{
		likeDAO.updateLike(seq_board);
	}
	
	// board 테이블 좋아요 개수 -1
	public void updateLikeCancel(int seq_board) throws Exception{
		likeDAO.updateLikeCancel(seq_board);
	}
	
	// 좋아요
	public void likeUp(int seq_board, String user_email) throws Exception{
		likeDAO.likeUp(seq_board, user_email);
	}
	
	// 좋아요 해제
	public void likeDown(int seq_board, String user_email) throws Exception{
		likeDAO.likeDown(seq_board, user_email);
	}
	
	// 중복 체크
	public int likeCheck(int seq_board, String user_email) throws Exception{
		return likeDAO.likeCheck(seq_board, user_email);
	}
}
