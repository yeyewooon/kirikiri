package com.kiri.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.GroupCalendarDAO;
import com.kiri.dto.Group_CalendarDTO;

@Service
public class GroupCalendarService {

	@Autowired
	private GroupCalendarDAO dao;
	
	// 일정 추가 
	public void insert(Group_CalendarDTO dto) {
		dao.insert(dto);
	}
	
	// 모든 일정 조회
	public List<Group_CalendarDTO> select(int seq_group) throws Exception{
		List<Group_CalendarDTO> list = dao.select(seq_group);
		return list;
	}
	
	// 일정 상세  
	public List<Group_CalendarDTO> selectDetail(int seq_group_cal) throws Exception {
		List<Group_CalendarDTO> list = dao.selectDetail(seq_group_cal);
		return list;
	}

	// 일정 삭제
	public int calDelete(int seq_group_cal) {
		return dao.calDelete(seq_group_cal);
		
	}

	// 일정 수정 
	public int calModify(Group_CalendarDTO dto) {
		return dao.calModify(dto);
	}
	
}
