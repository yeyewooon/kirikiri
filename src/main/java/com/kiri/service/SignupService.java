package com.kiri.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.kiri.dao.SignupDAO;

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
