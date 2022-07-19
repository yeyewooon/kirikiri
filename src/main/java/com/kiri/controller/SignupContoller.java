package com.kiri.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kiri.dto.MemberDTO;
import com.kiri.service.MailService;
import com.kiri.service.SignupService;
import com.kiri.utills.EncryptionUtils;

@RequestMapping("/signup")
@Controller
public class SignupContoller {
	@Autowired
	private EncryptionUtils ecp;
	@Autowired
	private SignupService service;
	@Autowired
	private MailService mailService;
	
	
	@RequestMapping(value = "/toSignupAgree") //약관동의로
	public String toSignupAgree() {
		return "/user/agree";
	}
	
	
	@RequestMapping(value = "/toSignup") //회원가입으로
	public String toSignup() {
		return "/member/signup";
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailCheck") //이메일 중복체크 feat.조용진
	public String emailCheck(String user_email) throws Exception {
		
		boolean is_result = service.emailCheck(user_email);
		if(is_result) {
			return "possibility";
		}else {
			return "impossibility";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/nicknameCheck") //닉네임 중복체크 feat.조용진
	public String nicknameCheck(String user_nickname) throws Exception {
		
		boolean is_result = service.nicknameCheck(user_nickname);
		if(is_result) {
			return "possibility";
		}else {
			return "impossibility";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/phoneCheck") //전화번호 중복체크 feat.조용진
	public String phoneCheck(String user_phone) throws Exception {
		
		boolean is_result = service.phoneCheck(user_phone);
		if(is_result) {
			return "possibility";
		}else {
			return "impossibility";
		}
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("/emailAuth")
	public String emailAuth(String user_email) throws Exception {//인증요청 feat.조용진
		return mailService.joinEmail(user_email);
	}
	
	@RequestMapping("/signup")
	public String signup(MemberDTO dto, MultipartFile file, HttpSession session,
		@RequestParam("hobby") List<String> hobby , @RequestParam("area") List<String> area) throws Exception { //회원가입 feat.조용진
		
		String realPath = session.getServletContext().getRealPath("profile");
		String user_image = service.uploadProfile(file, realPath);
		
		if(dto.getUser_intro().equals("")) {
			dto.setUser_intro("상태 메세지 없음");
		}
		String Encryption_pw = ecp.getSHA512(dto.getUser_pw());
		dto.setUser_pw(Encryption_pw);
		dto.setUser_image(user_image);
		dto.setUser_blacklist("N");
		dto.setUser_delete("N");
		
		service.signup(dto);
		service.insertHobby(dto.getUser_email(), hobby);
		service.insertArea(dto.getUser_email(), area);
		service.generalLoginType(dto.getUser_email());
		
		return "redirect:/mem/welcome";
	}
	
	// 회원가입 창으로 이동
		@RequestMapping("socialSignup")
		public void socialSignup(Model model, HttpSession session) {
		    /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		    //String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		    // https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
		    // redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		    //log.info("네이버: " + naverAuthUrl);
		    // 네이버
		    //model.addAttribute("url", naverAuthUrl);
		}
	
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
}
