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
	
	public MemberDTO login(String id, String pw) throws Exception{ // 로그인 
		Map<String, String> map = new HashMap<>();
		map.put("user_email", id);
		map.put("user_pw", pw);
		return session.selectOne("loginMapper.login", map);
	}
	
	public Login_TypeDTO loginType(String user_email) throws Exception{ // 로그인 타입확인
		return session.selectOne("loginMapper.loginType",user_email);
	}
	
	
}
