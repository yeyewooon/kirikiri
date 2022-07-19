package com.kiri.dao;

import java.util.Map;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAO {

	@Autowired
	private BasicDataSource bds;
	@Autowired
	private SqlSession session;
	// 쪽지 삭제하기
	public void deleteMessage(Map<String, Object> param) throws Exception{
		session.delete("messageMapper.deleteMessage", param);
	}
}
