package com.kiri.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.BoardDTO;
import com.kiri.vo.Criteria;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSession session;

	// 일반게시판 조회
	public List<BoardDTO> selectBoardList(String user_email) throws Exception{
		return session.selectList("myPageMapper.selectBoardList",user_email);
	}	
	// 전체 게시글 curPage로 자르기 
	public List<BoardDTO> selectBoard(String user_email, int start, int end ) throws Exception{
		Map<String, Object> map = new HashMap<>();
		map.put("user_email", user_email);
		map.put("start", start);
		map.put("end", end);
		System.out.println(map);
		return session.selectList("myPageMapper.selectBoard", map);
	}
	
	// 일반게시판 리스트 조회
	public List<Map<String,Object>> selectTotalBoardList(String user_email) throws Exception{
		return session.selectList("myPageMapper.selectTotalBoardList",user_email);
	}
	
	// ajax로 일반게시판 조회
	public List<BoardDTO> genalBoard(String user_email) throws Exception{
		return session.selectList("myPageMapper.selectBoardList",user_email);
	}
	
	// 일반게시판 총 갯수
	public int selectBoardCount(String user_email) throws Exception{
		return session.selectOne("myPageMapper.selectBoardCount",user_email);
	}	
	
	// 일반게시판 삭제
	public int boardDelete(int seq_board) throws Exception{
		return session.delete("myPageMapper.boardDelete",seq_board);
	}
	
	// 일판게시판 검색으로 조회
	public List<BoardDTO> genalSearchList(String category, String keyword,String user_email) throws Exception{
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("keyword", keyword);
		map.put("user_email", user_email);
		
		return session.selectList("myPageMapper.genalSearchList",map);
	}
	
	public List<BoardDTO> selectAllBoard(String user_email) {
		return session.selectList("myPageMapper.selectAllBoard",user_email);
	}
	
	public HashMap<String, Object> getPageNavi(String user_email,int curPage) {
		int totalCnt = session.selectOne("myPageMapper.getPageNavi",user_email); // 전체 게시글의 개수
		int recordCntPerPage = 10; // 한 페이지에 몇개의 데이터(게시글)을 띄워줄지
		int naviCntPerPage = 3; // 네비바에 몇개 단위로 페이징을 구성할지
		int pageTotalCnt = 0; // 총 몇 페이지가 나올지

		if (totalCnt % recordCntPerPage > 0) { // 나머지가 생김
			pageTotalCnt = totalCnt / recordCntPerPage + 1;
		} else {
			pageTotalCnt = totalCnt / recordCntPerPage;
		}

		if (curPage < 1) {// 현재 페이지가 0이거나 혹은 음수일때
			curPage = 1; // 무조건 첫페이지로 맞춰주기
		} else if (curPage > pageTotalCnt) { // 현재 페이지가 총 페이지 수보다 크다면
			curPage = pageTotalCnt; // 무조건 마지막 페이지로 맞춰주기
		}

		int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage - 1;

		// 만약에 endNavi가 전체 페이지를 넘어갈 수 없음
		if (pageTotalCnt < endNavi) { // endNavi가 전체 페이지수보다 크다면
			endNavi = pageTotalCnt;
		}

		// <> 모양을 넣어줄지 여부에 대한 검사
		boolean needPrev = true; // startNavi가 1일때 needPrev가 false
		boolean needNext = true; // endNavi가 마지막 페이지(전체 페이지)와 같을때 needNext가 false

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCnt) {
			needNext = false;
		}

		// map -> key, value
		// 제네릭 <키에 대한 자료형, 값에 대한 자료형>
		HashMap<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);

		return map;
	}
	
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
//	public List<BoardDTO> selectAll() throws Exception{ 
//		return session.selectList("boardMapper.selectAll");
//	}
	
	// 카테고리별 조회
//	public List<BoardDTO> selectCategory(String category) throws Exception{ 
//		return session.selectList("boardMapper.selectCategory", category);
//	}
	
	// 하나의 게시글 조회
	public BoardDTO selectOne(int seq_board) throws Exception{ 
		return session.selectOne("boardMapper.selectOne", seq_board);
	}
	
	// 좋아요 개수 카운팅
	public int selectLike(int seq_board) throws Exception{
		return session.selectOne("boardMapper.selectLike", seq_board);
	}
	
	// 조회수 + 1
	public void updateView_count(int seq_board) throws Exception{
		session.update("boardMapper.viewCntUp", seq_board);
	}
	
	// 게시글 수정
	public int modify(BoardDTO dto) throws Exception{
		return session.update("boardMapper.modify", dto);
	}
	
	// 게시글 삭제 요청
	public int delete(int seq_board) throws Exception{
		return session.delete("boardMapper.delete", seq_board);
	}
	
	// 게시글 검색
//	public List<BoardDTO> search(String category, String keyword, String option) throws Exception{
//		Map<String, String> map = new HashMap<>();
//		map.put("category", category);
//		map.put("keyword", keyword);
//		map.put("option", option);
//		
//		return session.selectList("boardMapper.search", map);
//	}
	

	// 게시판 목록(페이징 적용)
	public List<BoardDTO> getListPaging(Criteria cri) throws Exception{
		return session.selectList("boardMapper.getListPaging", cri);
	}
	
	// 전체 게시글 개수
	public int getTotal(Criteria cri) throws Exception{
		return session.selectOne("boardMapper.getTotal", cri);
	}
}
