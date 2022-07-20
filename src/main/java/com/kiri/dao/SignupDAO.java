package com.kiri.dao;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

	public int phoneCheck(String user_phone) throws Exception{ //핸드폰번호중복
		return session.selectOne("singupMapper.phoneCheck",user_phone);
	}
	
	public void signup(MemberDTO dto) throws Exception { // 회원가입
		session.insert("singupMapper.signup", dto);
	}
	
	public void insertHobby(Map<String,String> map) throws Exception { // 회원가입 취미
		session.insert("singupMapper.insertHobby", map);
	}
	
	public void insertArea(Map<String,String> map) throws Exception { // 회원가입 지역
		session.insert("singupMapper.insertArea", map);
	}
	
	public void generalLoginType(Map<String,String> map) throws Exception{ // 로그인타입 지정
		session.selectOne("singupMapper.generalLoginType",map);
	}
}
