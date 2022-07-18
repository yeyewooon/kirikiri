package com.kiri.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.AdminDAO;
import com.kiri.dto.BlackListDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.ReportDTO;

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
}
