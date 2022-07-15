package com.kiri.dao;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;

@Repository
public class LoginDAO {
	@Autowired
	private SqlSession session;
	
	public MemberDTO login(Map<String, String> map) throws Exception{ // 로그인 
		return session.selectOne("loginMapper.login", map);
	}
	
	public Login_TypeDTO loginType(String user_email) throws Exception{ // 로그인 타입확인
		return session.selectOne("loginMapper.loginType",user_email);
	}
	
	public void loginLogSuccess(String user_email) throws Exception{ // 로그인 성공로그
		session.insert("loginMapper.loginLogSuccess",user_email);
	}
	
	public void loginLogFailed(String user_email) throws Exception{ // 로그인 실패로그
		session.insert("loginMapper.loginLogFailed",user_email);
	}
	
	
}
