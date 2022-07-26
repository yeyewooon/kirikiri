package com.kiri.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.kiri.dto.AdminMainDTO;
import com.kiri.dto.BlackListDTO;
import com.kiri.dto.Login_LogDTO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Group_BoardDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.ReportDTO;
import com.kiri.dto.SiteDTO;
import com.kiri.service.AdminService;

@RequestMapping("/admin")
@Controller
public class AdminController {
	@Autowired
	private HttpSession session;
	@Autowired
	private AdminService service;

	@RequestMapping(value = "/toMember")
	public String toMember(int curPage, Model model) throws Exception{
		List<ReportDTO> reportList = service.selectReport();
		model.addAttribute("reportList", reportList);

		List<MemberDTO> list = service.selectAllMember(curPage*10-9, curPage*10);
		model.addAttribute("list", list);

		HashMap<String, Object> map = service.getPageNavi(curPage);
		model.addAttribute("naviMap", map);

		int totalCnt = service.selectMemCnt();
		model.addAttribute("memCnt", totalCnt);

		return "admin/adminMember";

	}

	@RequestMapping(value="/toReport") //신고하기->블랙리스트테이블로 등록
	@ResponseBody
	public String toReport(@RequestParam(value="seqArray[]") List<Integer> seqArray) throws Exception{
		ReportDTO rdto = new ReportDTO();
		BlackListDTO bdto = new BlackListDTO();
		if(seqArray.size()==0) {
			return "fail";
		}else {
			for(int seq_report : seqArray) {
	            rdto = service.selectReportBySeq(seq_report);
	            bdto = new BlackListDTO(0, rdto.getUser_email(), null, rdto.getReport_reason());
	            service.insertBl(bdto);
	            service.deleteReport(seq_report);
	            service.updateBl(rdto.getUser_email());
	        }
			return "success";
		}
	}

	@RequestMapping(value="/toReportDelete") //신고 삭제-> 블랙리스트등록XX
	@ResponseBody
	public String toReportDelete(@RequestParam(value="seqArray[]") List<Integer> seqArray) throws Exception{
		if(seqArray.size()==0) {
			return "fail";
		}else {
			for(int seq_report : seqArray) {
	            service.deleteReport(seq_report);
	        }
			return "success";
		}
	}

	@RequestMapping(value="/toSearch")
	@ResponseBody
	public void toSearch(Model model, HttpServletResponse response, @RequestParam Map<String, Object> searchMap) throws Exception{
		List<String> searchList = new ArrayList<>();
		for ( String key : searchMap.keySet() ) {
			searchList.add(String.valueOf(searchMap.get(key)));
		}

		List<MemberDTO> slist = service.searchMember(searchList.get(0), searchList.get(1));

		String json = new Gson().toJson(slist);
		response.setCharacterEncoding("utf-8");
		response.getWriter().write(json);
	}

	@RequestMapping(value="/toDetailMem")
	public String toDetailMem(String user_email, Model model) throws Exception{
		MemberDTO memList = service.selectDetailMem(user_email);
		model.addAttribute("memList", memList);
		return "admin/memberDetail";
	}

	@RequestMapping(value="/toUpdateMem", method=RequestMethod.POST)
	public void toUpdateMem(HttpServletResponse response, @RequestParam("user_email") String user_email, @RequestParam("user_blacklist") String user_blacklist) throws Exception{
		service.updateMem(user_email, user_blacklist);
		response.getWriter().write("success");
	}

	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}

	@RequestMapping(value = "/toBoard") // 게시물 관리
	public String toBoard(int curPage, Model model) throws Exception{
		System.out.println("curPage : "+curPage);
		System.out.println("게시물 관리 페이지");

		// board curPage로 자라서 list 가져오기
		List<BoardDTO> list = service.selectBoard(curPage*10-9, curPage*10);
		model.addAttribute("list",list);

		// board 총 count 가져오기
		int boardCnt = service.selectBoardCount();

		// group_board 총 count 가져오기
		int group_boardCnt = service.selectGroupBoardCount();

		int totalCnt = boardCnt + group_boardCnt;
		System.out.println(totalCnt);
		model.addAttribute("totalCnt",totalCnt);

		// 페이지 네이션
		HashMap<String, Object> map = service.getBoardPageNavi(curPage);
		model.addAttribute("naviMap", map);
		return "admin/adminBoard";
	}

	@RequestMapping(value = "/generalBoard") // 일반 게시판 조회
	@ResponseBody
	public List<BoardDTO> genalBoard(int curPage) throws Exception {
		System.out.println("일반 게시판 도착");
		List<BoardDTO> selectAllBoard = service.selectAllBoard();
		return selectAllBoard;
	}

	@RequestMapping(value = "/meetingBoard") // 모임 게시판 조회
	@ResponseBody
	public List<Group_BoardDTO> meetingBoard(int curPage) throws Exception {
		List<Group_BoardDTO> selectGroupBoardList = service.selectAllGroupBoard();
		return selectGroupBoardList;
	}

	@RequestMapping(value = "/normalSearch") // 일반 게시판 검색
	@ResponseBody
	public List<BoardDTO> generalSearch(String category, String keyword) throws Exception {
		System.out.println("일반 게시판 검색 : "+category +" : "+ keyword);
		List<BoardDTO> boardlist = service.generalSearchList(category, keyword);
		return boardlist;
	}

	@RequestMapping(value = "/meetingSearch") // 모임 게시판 검색
	@ResponseBody
	public List<Group_BoardDTO> meetingSearch(String category, String keyword) throws Exception {
		System.out.println(category + " : "+ keyword);
		if(category.equals("board_title")) {
			category = "title";
		}else if(category.equals("board_content")) {
			category = "content";
		}

		List<Group_BoardDTO> meetinglist = service.meetingSearchList(category, keyword);
		return meetinglist;
	}

	@RequestMapping(value="/boardDelete") // 일반 게시판 삭제
	@ResponseBody
	public String boardDelete(int seq_board) throws Exception{
		service.boardDelete(seq_board);
		return "success";
	}

	@RequestMapping(value="/groupBoardDelete") // 모임 게시판 삭제
	@ResponseBody
	public String groupBoardDelete(int seq_group_board) throws Exception{
		service.groupBoardDelete(seq_group_board);
		return "success";
	}




	// 김영완 07_22
	@RequestMapping(value = "/toAdmin")
	public String toAdminMain(Model model) throws Exception {
		// 카카오맵
		List<AdminMainDTO> locationList = service.selectAllGroupLocation();
		ObjectMapper mapper = new ObjectMapper();
		String jsonLocationList = mapper.writeValueAsString(locationList);

		List<AdminMainDTO> cntGroupCalList = service.cntGroupCalendar(); // 그룹 수
		int cntGroupMember = service.cntGroupMember(); // 멤버 수
		int cntGroupCnt = service.cntGroupCnt(); // 모임 수
		// int cntBoard = service.cntBoard(); // 게시글 수(자유게시판)
		//int cntGroupBoard = service.cntGroupBoard(); // 게시글 수(모임게시판)
		int cntGroupCal = service.cntGroupCal(); // 일정수
		List<SiteDTO> cntPreLocationList = service.cntPreLocation(); // 선호지역 수
		List<Login_LogDTO> cntLoginLogList = service.cntLoginLog(); // 로그인 로그 수

		model.addAttribute("jsonLocationList",jsonLocationList);
		model.addAttribute("cntGroupCalList",cntGroupCalList);
		model.addAttribute("cntGroupMember",cntGroupMember);
		model.addAttribute("cntGroupCnt",cntGroupCnt);
		model.addAttribute("cntGroupCal",cntGroupCal);
		model.addAttribute("cntPreLocationList",cntPreLocationList);
		model.addAttribute("cntLoginLogList",cntLoginLogList);
		return "/admin/adminMain";
	}
}
