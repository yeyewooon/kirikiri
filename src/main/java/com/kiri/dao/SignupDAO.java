package com.kiri.dao;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;

@Repository
public class SignupDAO {
	@Autowired
	private SqlSession session;
	
	public int emailCheck(String user_email) throws Exception{ //이메일중복
		return session.selectOne("singupMapper.emailCheck",user_email);
	}

	public int nicknameCheck(String user_nickname) throws Exception{ //닉네임중복
		return session.selectOne("singupMapper.nicknameCheck",user_nickname);
	}
	
	
	
}
