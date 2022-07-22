package com.kiri.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
	
	public boolean nicknameCheck(String user_nickname) throws Exception{ //닉네임체크
		int result = dao.nicknameCheck(user_nickname);
		if(result > 0) {
			return false;
		}else {
			return true;
		}
	}
	
	public boolean phoneCheck(String user_phone) throws Exception{ //닉네임체크
		int result = dao.phoneCheck(user_phone);
		if(result > 0) {
			return false;
		}else {
			return true;
		}
	}
	
	public String uploadProfile(MultipartFile file, String realPath) throws Exception{ // 프로필사진 업로드
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		String sys_name = null;
		if(!file.isEmpty()) {
			String ori_name = file.getOriginalFilename();
			sys_name = UUID.randomUUID() + "_" + ori_name;
			file.transferTo(new File(realPath + File.separator + sys_name));
		}
		return sys_name;
	}
	
	public void signup(MemberDTO dto) throws Exception{ //회원가입
		dao.signup(dto); 
	}
	
	public void insertHobby(String user_email, List<String> hobby) throws Exception{ //회원가입 취미
		for(String hobbyIndex : hobby) {
			Map<String, String> map = new HashMap<>();
			System.out.println(hobbyIndex);
			map.put("user_email", user_email);
			map.put("hobby", hobbyIndex);
			dao.insertHobby(map); 
		}
	}
	
	public void insertArea(String user_email, List<String> area) throws Exception{ //회원가입 지역
		for(String areaIndex : area) {
			Map<String, String> map = new HashMap<>();
			map.put("user_email", user_email);
			map.put("area", areaIndex);
			dao.insertArea(map); 
			
		}
	}
	
	public void generalLoginType(String user_email,String type, String unique_id) throws Exception{ // 로그인타입 지정
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_email", user_email);
		map.put("type", type);
		map.put("unique_id", unique_id);
		dao.generalLoginType(map);
	}
	
}
