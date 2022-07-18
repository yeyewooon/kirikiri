package com.kiri.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession session;
	
	/* 자유 게시판 */
	// 게시글 저장
	public void write(BoardDTO dto) throws Exception{
		session.insert("boardMapper.write", dto);
	}
	
	// 새로운 게시글 시퀀스 번호 생성
	public int selectSeq() throws Exception{ 
		return session.selectOne("boardMapper.selectSeq");
	}
	
	// 모든 게시글 조회
	public List<BoardDTO> selectAll() throws Exception{ 
		return session.selectList("boardMapper.selectAll");
	}
	
	// 하나의 게시글 조회
	public BoardDTO selectOne(int seq_board) throws Exception{ 
		return session.selectOne("boardMapper.selectOne", seq_board);
	}
	
	// 조회수 + 1
	public void updateView_count(int seq_board) throws Exception{
		session.update("boardMapper.viewCntUp", seq_board);
	}
	
	// 게시글 수정
//	public int modify(BoardDTO dto) throws Exception{
//		return session.update("boardMapper.modify", dto);
//	}
	
	// 게시글 삭제 요청
	public int delete(int seq_board) throws Exception{
		return session.delete("boardMapper.delete", seq_board);
	}
}
