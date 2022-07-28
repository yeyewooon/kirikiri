package com.kiri.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Group_BoardDTO;
import com.kiri.utills.Criteria;

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
	
	/*======모임 게시판========================================================================*/
	
	// 게시판 목록(페이징 적용)
	public List<Group_BoardDTO> getListPaging(Criteria cri) throws Exception{
		return session.selectList("groupBoardMapper.getListPaging", cri);
	}
	
	// 전체 게시글 개수
	public int getTotal(Criteria cri) throws Exception{
		return session.selectOne("groupBoardMapper.getTotal", cri);
	}
	
	// 게시글 저장
	public void write(Group_BoardDTO dto) throws Exception{
		session.insert("groupBoardMapper.write", dto);
	}
	
	// 새로운 게시글 시퀀스 번호 생성
	public int selectSeq() throws Exception{ 
		return session.selectOne("groupBoardMapper.selectSeq");
	}
		
	// 하나의 게시글 조회
	public Group_BoardDTO selectOne(int seq_group_board) throws Exception{ 
		return session.selectOne("groupBoardMapper.selectOne", seq_group_board);
	}
	
	// 좋아요 개수 카운팅
	public int selectLike(int seq_group_board) throws Exception{
		return session.selectOne("groupBoardMapper.selectLike", seq_group_board);
	}
		
	// 조회수 + 1
	public void updateView_count(int seq_group_board) throws Exception{
		session.update("groupBoardMapper.viewCntUp", seq_group_board);
	}
	
	// 게시글 수정
	public int modify(Group_BoardDTO dto) throws Exception{
		return session.update("groupBoardMapper.modify", dto);
	}
	
	// 게시글 삭제 요청
	public int delete(int seq_group_board) throws Exception{
		return session.delete("groupBoardMapper.delete", seq_group_board);
	}

}
