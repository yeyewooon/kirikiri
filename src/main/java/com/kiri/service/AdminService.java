package com.kiri.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.AdminDAO;
import com.kiri.dto.BlackListDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.ReportDTO;
import com.kiri.dto.SearchMemDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO dao;
	
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
	
	public List<MemberDTO> searchMember(String searchType, String searchKeyword) throws Exception{
		return dao.searchMember(searchType, searchKeyword);
	}
	
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception {
		return dao.getPageNavi(curPage);
	}
}
