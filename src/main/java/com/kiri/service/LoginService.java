package com.kiri.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.LoginDAO;
import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO dao;
	
	
	public MemberDTO login(String id, String pw) throws Exception{  //로그인 feat.조용진
		Map<String, String> map = new HashMap<>();
		map.put("user_email", id);
		map.put("user_pw", pw);
		return dao.login(map);
	}
	
	public Login_TypeDTO loginType(String user_email) throws Exception{  //로그인 타입 feat.조용진
		return dao.loginType(user_email);
	}
	
	public void loginLogSuccess(String user_email) throws Exception{ // 로그인 성공로그  feat.조용진
		dao.loginLogSuccess(user_email); 
	}
	
	public void loginLogFailed(String user_email) throws Exception{ // 로그인 실패로그  feat.조용진
		dao.loginLogFailed(user_email);
	}
}	
