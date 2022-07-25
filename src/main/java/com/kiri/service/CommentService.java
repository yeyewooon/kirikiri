package com.kiri.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.Board_CommentDAO;
import com.kiri.dto.Board_CommentDTO;

@Service
public class CommentService {
	@Autowired
	private Board_CommentDAO commentDAO;
	
	// 댓글 등록
	public int write(Board_CommentDTO dto) throws Exception{
		return commentDAO.write(dto);
	}
	
	// 댓글 조회
	public List<Board_CommentDTO> selectAll(int seq_board) throws Exception{
		return commentDAO.selectAll(seq_board);
	}
	
	// 댓글 수정
	public int modify(Board_CommentDTO dto) throws Exception{
		return commentDAO.modify(dto);
	}
	
	// 댓글 삭제
	public int delete(int seq_comment) throws Exception{
		return commentDAO.delete(seq_comment);
	}
	
	// 댓글 개수 - 안쓰긴한듯 commentservice에서는~
	public int commentCnt(int seq_board) throws Exception{
		return commentDAO.commentCnt(seq_board);
	}
}
