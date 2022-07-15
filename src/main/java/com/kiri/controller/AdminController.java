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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kiri.dto.BlackListDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.ReportDTO;
import com.kiri.dto.SearchMemDTO;
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
	
	@RequestMapping(value = "/toError")
	public String toError() {
		return "error";
	}
}
