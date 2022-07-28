package com.kiri.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.Board_CommentDAO;
import com.kiri.dao.Group_Board_CommentDAO;
import com.kiri.dto.Board_CommentDTO;
import com.kiri.dto.Group_Board_CommentDTO;

@Service
public class CommentService {
	@Autowired
	private Board_CommentDAO commentDAO;
	@Autowired
	private Group_Board_CommentDAO groupCommentDAO;
	
	/* 자유게시판 */
	// 댓글 조회
	public List<Board_CommentDTO> selectAll(int seq_board) throws Exception{
		return commentDAO.selectAll(seq_board);
	}
	
	// 댓글 등록
	public int write(Board_CommentDTO dto) throws Exception{
		return commentDAO.write(dto);
	}
	
	// 댓글 수정
	public int modify(Board_CommentDTO dto) throws Exception{
		return commentDAO.modify(dto);
	}
	
	// 댓글 삭제
	public int delete(int seq_comment) throws Exception{
		return commentDAO.delete(seq_comment);
	}
	
	// 댓글 개수 - 안쓰긴한듯 commentservice에서는~ boardService에서 사용
//	public int commentCnt(int seq_board) throws Exception{
//		return commentDAO.commentCnt(seq_board);
//	}
	
	/*======모임========================================================================*/
	
	/* 모임 게시판 */
	// 댓글 조회
	public List<Group_Board_CommentDTO> groupSelectAll(int seq_group_board) throws Exception{
		return groupCommentDAO.selectAll(seq_group_board);
	}
	
	// 댓글 등록
	public int groupWrite(Group_Board_CommentDTO dto) throws Exception{
		return groupCommentDAO.write(dto);
	}
	
	// 댓글 수정
	public int groupModify(Group_Board_CommentDTO dto) throws Exception{
		return groupCommentDAO.modify(dto);
	}
	
	// 댓글 삭제
	public int groupDelete(int seq_group_comment) throws Exception{
		return groupCommentDAO.delete(seq_group_comment);
	}
	
	// 댓글 개수 - 안쓰긴한듯 commentservice에서는~ boardService에서 사용
//	public int groupCommentCnt(int seq_group_board) throws Exception{
//		return groupCommentDAO.commentCnt(seq_group_board);
//	}
}
