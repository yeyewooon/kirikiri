package com.kiri.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.LoginDAO;
import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;

@Service
public class LoginService {
	@Autowired
	private LoginDAO dao;
	
	
	public MemberDTO login(String id, String pw) throws Exception{
		return dao.login(id, pw);
	}
	
	public Login_TypeDTO loginType(String user_email) throws Exception{
		return dao.loginType(user_email);
	}
	
}	
