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
public class Admin_BoardDAO {
	@Autowired
	private SqlSession session;
	
	// 게시물 관리
	
		// 전체 게시글 curPage로 자르기 
		public List<BoardDTO> selectBoard(int start, int end ) throws Exception{
			Map<String, Object> map = new HashMap<>();
			map.put("start", start);
			map.put("end", end);
			return session.selectList("adminMapper.selectBoard", map);
		}
		
		// 일반게시판 총 갯수
		public int selectBoardCount() throws Exception{
			return session.selectOne("adminMapper.selectBoardCount");
		}
		
		// 일반게시판 총 갯수
		public int selectGroupBoardCount() throws Exception{
			return session.selectOne("adminMapper.selectGroupBoardCount");
		}
		
		// 일반 조회
		public List<BoardDTO> selectAllBoard() throws Exception {
			return session.selectList("adminMapper.selectAllBoard");
		}
		
		// 모임게시판 조회
		public List<Group_BoardDTO> selectAllGroupBoard() throws Exception {
			return session.selectList("adminMapper.selectAllGroupBoard");
		}
		
		// 일판게시판 검색으로 조회
		public List<BoardDTO> generalSearchList(String category, String keyword) throws Exception{
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("category", category);
			map.put("keyword", keyword);
			
			return session.selectList("adminMapper.generalSearchList",map);
		}
		
		// 모임게시판 검색으로 조회
		public List<Group_BoardDTO> meetingSearchList(String category, String keyword) throws Exception{
			Map<String, String> map = new HashMap<String, String>();
			map.put("category", category);
			map.put("keyword", keyword);
			
			return session.selectList("adminMapper.meetingSearchList",map);
		}
		
		// 일반게시판 삭제
		public int boardDelete(int seq_board) throws Exception{
			return session.delete("adminMapper.boardDelete",seq_board);
		}
		
		// 모임게시판 삭제
		public int groupBoardDelete(int seq_board) throws Exception{
			return session.delete("adminMapper.groupBoardDelete",seq_board);
		}
		
		// 페이지네이션
		public HashMap<String, Object> getBoardPageNavi(int curPage) throws Exception {
			int totalCnt = session.selectOne("adminMapper.getBoardPageNavi"); // 전체 게시글의 개수
			int recordCntPerPage = 10; // 한 페이지에 몇개의 데이터(게시글)을 띄워줄지
			//int naviCntPerPage = 5; // 네비바에 몇개 단위로 페이징을 구성할지
			int pageTotalCnt = 0; // 총 몇 페이지가 나올지

			
			System.out.println(totalCnt);
			
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

			//int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
			//int endNavi = startNavi + naviCntPerPage - 1;
			int startNavi = 1;
			int endNavi = (int)(Math.ceil((float)totalCnt/10));

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
		
}
