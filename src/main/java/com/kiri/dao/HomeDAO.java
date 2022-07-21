package com.kiri.dao;

import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.BestGroupDTO;
import com.kiri.dto.Tbl_GroupDTO;

@Repository
public class HomeDAO {

	 @Autowired
	   private BasicDataSource bds;

	   @Autowired
	   private SqlSession session;
	   
	   // 전체 그룹 조회
	   public List<Tbl_GroupDTO> selectAllGroup(){
		   return session.selectList("userMapper.selectAllGroup");
	   }
	   
	   // 새로운 그룹 조회
	   public List<Tbl_GroupDTO> selectNewGroup(){
		   return session.selectList("userMapper.selectNewGroup");
	   }
	   
	   // 최고 그룹 조회
	   public List<BestGroupDTO> selectBestGroup(){
		   return session.selectList("userMapper.selectBestGroup");
	   }
}
