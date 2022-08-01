package com.kiri.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.HomeDAO;
import com.kiri.dto.BestGroupDTO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Tbl_GroupDTO;

@Service
public class HomeService {
	@Autowired
	private HomeDAO home_dao;

	// 그룹 전체 조회
	public List<Tbl_GroupDTO> selectAllGroup() throws Exception {
		return home_dao.selectAllGroup();
	}

	// 새로운 전체 조회
	public List<Tbl_GroupDTO> selectNewGroup() throws Exception {
		return home_dao.selectNewGroup();
	}

	// 최고 전체 조회
	public List<BestGroupDTO> selectBestGroup() throws Exception {
		return home_dao.selectBestGroup();
	}

	// Best Board 2
	public List<BoardDTO> getBestBoard() {
		return home_dao.getBestBoard();
	}

	public String getSysname(int seq_board) {
		return home_dao.getSysname(seq_board);
	}
}
