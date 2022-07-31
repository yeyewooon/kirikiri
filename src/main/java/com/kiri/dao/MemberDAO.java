package com.kiri.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.MemberDTO;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession session;
	
	// member select
	public MemberDTO selectMember(String user_email) throws Exception{ 
		return session.selectOne("myPageMapper.selectMember",user_email);
	}
	
	// 사진 수정
	public void modifyProfilePic(Map<String,String> map) {
		session.update("myPageMapper.modifyProfilePic",map);
	}
	
	// 개인정보 수정
	public void profileModify(MemberDTO dto) {
		session.update("myPageMapper.profileModify",dto);
	}
	
	// 닉네임 중복확인
	public int nicknameCheck(String user_nickname)throws Exception{
		return session.selectOne("myPageMapper.nicknameCheck",user_nickname);
	}
	
	// phone 중복확인
	public int phoneCheck(String user_phone)throws Exception{
		return session.selectOne("myPageMapper.phoneCheck",user_phone);
	}
	
	// pw 중복확인
   public int pwCheck(String user_pw, String user_email)throws Exception{
      Map<String, String> map = new HashMap<String, String>();
      map.put("user_pw",user_pw);
      map.put("user_email", user_email);
      return session.selectOne("myPageMapper.pwCheck",map);
   }
	
	// 회원탈퇴
	public void profileDelete(Map<String,String> memberdto) throws Exception{
		session.delete("myPageMapper.profileDelete",memberdto);
	}
}
