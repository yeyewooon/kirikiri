package com.kiri.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kiri.dao.SignupDAO;
import com.kiri.dto.MemberDTO;

@Service
public class SignupService {
	@Autowired
	private SignupDAO dao;
	
	public boolean emailCheck(String user_email) throws Exception{ //이메일체크
		int result = dao.emailCheck(user_email);
		if(result > 0) {
			return false;
		}else {
			return true;
		}
	}
	
	public boolean nicknameCheck(String user_nickname) throws Exception{ //이메일체크
		int result = dao.nicknameCheck(user_nickname);
		if(result > 0) {
			return false;
		}else {
			return true;
		}
	}
	
}
