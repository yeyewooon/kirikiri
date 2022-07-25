package com.kiri.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

@Component
public class MailService {
	@Autowired
	private JavaMailSenderImpl mailSender;
	private int authNum; 
	
	public void makeRandomNumber() {
		Random ranNum = new Random();
		int checkNum = ranNum.nextInt(888888) + 111111;
		authNum = checkNum;
	}
	
	public String makeRandomPw() {
		    int numStat = 48; 
		    int StrAnd = 122; 
		    int targetStringLength = 8;
		    Random random = new Random();
		    String pw = random.ints(numStat, StrAnd + 1)
	                   .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
	                   .limit(targetStringLength)
	                   .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
	                   .toString();
		    return pw;
	}
	
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "eamilsender0222@gmail.com";  
		String toMail = email;
		String title = "끼리끼리 회원 가입 인증 이메일 입니다."; 
		String content = 
				"끼리끼리 홈페이지를 방문해주셔서 감사합니다." + 	 
                "<br><br>" + 
			    "인증 번호는 " + authNum + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNum);
	}
	
	public String findPw(String email) {
		makeRandomNumber();
		String setFrom = "eamilsender0222@gmail.com";  
		String toMail = email;
		String title = "끼리끼리 비밀번호 찾기 인증 이메일 입니다."; 
		String content = 
				"끼리끼리 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
			    "비밀번호 찾기 인증 번호는 " + authNum + "입니다." + 
			    "<br>" + 
			    "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		mailSend(setFrom, toMail, title, content);
		return Integer.toString(authNum);
	}
	
	public String updatePw(String email) {
		String pw = makeRandomPw();
		String setFrom = "eamilsender0222@gmail.com";  
		String toMail = email;
		String title = "끼리끼리 임시 비밀번호 입니다."; 
		String content = 
				"끼리끼리 홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
			    "임시 비밀번호는 " + pw + "입니다." + 
			    "<br>" + 
			    "해당 비밀번호를 통하여 로그인을 해주세요. 이후 회원 수정에서 비밀번호를 수정해주세요.";
		mailSend(setFrom, toMail, title, content);
		return pw;
	}
	
	//이메일 전송 메소드
	public void mailSend(String setFrom, String toMail, String title, String content) { 
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(message,true,"utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content,true);
			mailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}
