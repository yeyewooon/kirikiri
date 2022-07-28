package com.kiri.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.AdminDAO;
import com.kiri.dao.Admin_BoardDAO;
import com.kiri.dto.AdminMainDTO;
import com.kiri.dto.BlackListDTO;
import com.kiri.dto.Group_CalendarDTO;
import com.kiri.dto.Login_LogDTO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Group_BoardDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.ReportDTO;
import com.kiri.dto.Tbl_GroupDTO;
import com.kiri.dto.SiteDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO dao;

	@Autowired
	private Admin_BoardDAO boarddao;

	public List<MemberDTO> selectAllMember(int start, int end) throws Exception{
		return dao.selectAllMember(start, end);
	}

	public int selectMemCnt() throws Exception{
		return dao.selectMemCnt();
	}

	public List<ReportDTO> selectReport() throws Exception{
		return dao.selectReport();
	}

	public ReportDTO selectReportBySeq(int seq_report) throws Exception{
		return dao.selectReportBySeq(seq_report);
	}

	public void insertBl(BlackListDTO dto) throws Exception{
		dao.insertBl(dto);
	}

	public void deleteReport(int seq_report) throws Exception{
		dao.deleteReport(seq_report);
	}
	public void updateBl(String user_email) throws Exception{
		dao.updateBl(user_email);
	}

	public List<MemberDTO> searchMember(String searchType, String searchKeyword) throws Exception{
		return dao.searchMember(searchType, searchKeyword);
	}

	public MemberDTO selectDetailMem(String user_email) throws Exception{
		return dao.selectDetailMem(user_email);
	}

	public void updateMem(String user_email, String user_blacklist) {
		dao.updateMem(user_email, user_blacklist);
	}
	
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception {
		return dao.getPageNavi(curPage);
	}
	///////////////////////////////////////////////////////////////////////////////////
	// 형석
	
	// 모임 검색
	public List<Tbl_GroupDTO> searchGroup(String searchType, String searchKeyword) throws Exception{
		return dao.searchGroup(searchType, searchKeyword);
	}
	
	// 모임 전체 조회
	public List<Tbl_GroupDTO> selectAllGroup(int start, int end) throws Exception{
		return dao.selectAllGroup(start, end);
	}
	
	// 모임 삭제
	public int deleteGroup(int seq_group) throws Exception{
		return dao.deleteGroup(seq_group);
	}
	
	// 모임 개수
	public int selectGroupCnt() throws Exception{
		return dao.selectGroupCnt();
	}
	
	// 모임 페이지네이션
	public HashMap<String, Object> getPageNaviGroup(int curPage) throws Exception {
		return dao.getPageNaviGroup(curPage);
	}

	
	// 게시물 관리

	// 전체 게시글 curPage로 자르기
	public List<BoardDTO> selectBoard(int start, int end) throws Exception{
		return boarddao.selectBoard(start, end);
	}

	// 일반게시판 총 갯수
	public int selectBoardCount() throws Exception {
		return boarddao.selectBoardCount();
	}

	// 모임 게시판 총 갯수
	public int selectGroupBoardCount() throws Exception{
		return boarddao.selectGroupBoardCount();
	}

	// 일반 조회
	public List<BoardDTO> selectAllBoard() throws Exception{
		return boarddao.selectAllBoard();
	}

	// 모임게시판 조회
	public List<Group_BoardDTO> selectAllGroupBoard() throws Exception{
		return boarddao.selectAllGroupBoard();
	}

	// 일반게시판 검색으로 조회
	public List<BoardDTO> generalSearchList(String category, String keyword) throws Exception{
		return boarddao.generalSearchList(category, keyword);
	}

	// 모임게시판 검색으로 조회
	public List<Group_BoardDTO> meetingSearchList(String category, String keyword) throws Exception{
		return boarddao.meetingSearchList(category,keyword);
	}

	// 일반게시판 삭제
	public int boardDelete(int seq_board) throws Exception{
		 return boarddao.boardDelete(seq_board);
	}

	// 모임게시판 삭제
	public int groupBoardDelete(int seq_board) throws Exception{
		 return boarddao.groupBoardDelete(seq_board);
	}

	// 페이지네이션
	public HashMap<String, Object> getBoardPageNavi(int curPage) throws Exception {
		return boarddao.getBoardPageNavi(curPage);
	}

	// 김영완 07_22
	// 카카오맵
	public List<AdminMainDTO> selectAllGroupLocation() {
		return dao.selectAllGroupLocation();
	}

	// 캘린더수 (도넛 그래프)
	public List<AdminMainDTO> cntGroupCalendar() {
		return dao.cntGroupCalendar();
	}

	// 멤버 수
	public int cntMember() {
		return dao.cntMember();
	}

	// 모임 수
	public int cntGroupCnt() {
		return dao.cntGroupCnt();
	}

	// 게시글 수(자유게시판)
	public int cntBoard() {
		return dao.cntBoard();
	}

	// 게시글 수(모임게시판)
	public int cntGroupBoard() {
		return dao.cntGroupBoard();
	}

	// 일정수
	public int cntGroupCal() {
		return dao.cntGroupCal();
	}

	// 선호지역 수
	public List<SiteDTO> cntPreLocation() {
		return dao.cntPreLocation();
	}

	// 로그인 로그 수
	public List<Login_LogDTO> cntLoginLog() {
		return dao.cntLoginLog();
	}
}
