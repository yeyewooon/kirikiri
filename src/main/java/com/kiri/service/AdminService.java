package com.kiri.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.AdminDAO;
import com.kiri.dto.MemberDTO;

@Service
public class AdminService {
	@Autowired
	private AdminDAO dao;
	
	public List<MemberDTO> selectAllMember(int start, int end) throws Exception{
		return dao.selectAllMember(start, end);
	}
	public HashMap<String, Object> getPageNavi(int curPage) throws Exception {
		return dao.getPageNavi(curPage);
	}
}
