package com.kiri.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kiri.auth.NaverLogin;
import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.LoginService;
import com.kiri.service.MailService;
import com.kiri.service.SignupService;
import com.kiri.utills.EncryptionUtils;

@RequestMapping("/login")
@Controller
public class LoginController {
	@Autowired
	private EncryptionUtils ecp;
	@Autowired
	private LoginService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private MailService mailService;
	@Autowired
	private SignupService signupService;
	
	//네이버
    @Autowired
    private NaverLogin naverlogin;
    private String apiResult = null;
	
	@RequestMapping(value = "/toLogin")
	public String toLogin(Model model, HttpSession session)throws Exception {
		String naverUrl = naverlogin.getAuthorizationUrl(session);
	    model.addAttribute("naverUrl",naverUrl);
		return "/member/login";
	}

	@ResponseBody
	@RequestMapping(value = "/general") 	
	public String general(String user_email, String user_pw, String loginType) throws Exception { // 일반로그인 feat.조용진
		String Encryption_pw = ecp.getSHA512(user_pw); 
		Login_TypeDTO type = service.loginType(user_email);
		
		if(type == null) { //미가입
			return "nonmem";
			
		}else if(type.getType().equals("general")) { //일반 로그인
			MemberDTO dto = service.login(user_email, Encryption_pw);
			if(dto != null) { // 널이 아니라면 조회 성공
				dto.setUser_pw(null);
				session.setAttribute("loginType", type.getType());
				session.setAttribute("loginSession", dto);
				service.loginLogSuccess(user_email);
				return "general";
				
			}else { // null 로그인 실패 
				service.loginLogFailed(user_email);
				return "loginFail";
			}
			
		}else if(type.getType().equals("admin")) { //관리자 가입된 아이디
			return "admin";
			
		}else { // 맴버는 조회 되었는데 타입에 오류 발생 
			return "error";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId") 	
	public String findId(String user_name, String user_phone) throws Exception { // 아이디 찾기 feat.조용진
		String result = service.findId(user_name, user_phone);
		
		if(result != "nonmem") {
			return result;
			
		}else {
			return "nonmem";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/findPw") 	
	public String findPw(String user_name, String user_email) throws Exception { // 비밀번호 찾기 feat.조용진
		boolean is_result = service.findPw(user_name, user_email);
		
		if(is_result) {
			return "exist";
			
		}else {
			return "empty";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/emailAuthFindPw") 
	public String emailAuthFindPw(String user_name, String user_email) throws Exception { // 비밀번호 찾기 feat.조용진
		return mailService.findPw(user_email);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/tempPw") 
	public boolean tempPw(String user_email) throws Exception { // 비밀번호 수정 feat.조용진
		String pw = mailService.updatePw(user_email);
	    String ecpPw = ecp.getSHA512(pw);
	    service.updatePw(user_email, ecpPw);
		
		return true;
	}
	
	@RequestMapping(value = "/toLogout")//logout페이지 요청 feat.조용진
	public String logout() {
		session.removeAttribute("loginSession");
		session.removeAttribute("loginType");
		return "redirect:/";
	}
	
	 // 네이버 로그인 성공시 callback호출
    @RequestMapping(value="naverCallback", method= {RequestMethod.GET,RequestMethod.POST})
    public String callBack(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws Exception{
        OAuth2AccessToken oauthToken;
        oauthToken = naverlogin.getAccessToken(session, code, state);
        apiResult = naverlogin.getUserProfile(oauthToken);
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject)obj;
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
        
        String naverId = (String) response_obj.get("id");
        String naverName = (String) response_obj.get("name");
        String naverEmail = (String) response_obj.get("email");
        String naverProfileImg = (String) response_obj.get("profile_image");
        
        MemberDTO naver = new MemberDTO();
        naver.setUser_email(naverEmail); //아이디
        naver.setUser_name(naverName); //이름
        String ecpNaverId = ecp.getSHA512(naverId);
        
        naver.setUser_pw(ecpNaverId);
        naver.setUser_image(naverProfileImg); //프로필사진
        //네이버 고유id번호
        boolean is_singup = signupService.emailCheck(naverEmail); //가입이 되어있으면 false 반환
        
        if(!is_singup) { //false 조회 된 것 true 조회 안된 것
        	 Login_TypeDTO type = service.loginType(naverEmail);
        	 
        	 if(type.getType().equals("naver")||type.getunique_id().equals(ecpNaverId)) {
        		 MemberDTO dto = service.socialLogin(naverEmail);
        		 session.setAttribute("loginType", type.getType());
        		 session.setAttribute("loginSession", dto);
        		 return "redirect:/";
        		 
        	 }else if(type.getType().equals("general")||type.getunique_id().equals("general")) { //일반 회원 가입되어 있을 시 네이버로 연동 할지 선택하는 페이지로
        		 return "";
        	 }
        			 
        }else {// 가입 안되어있으면 회원가입으로 보내기
        	 session.setAttribute("naverUser", naver);
             return "redirect:/login/socialSignup";
        }
        return "redirect:/toError"; // 위에 조건에서 return 안될 시 에러페이지로
    }   
	
	// 회원가입 창으로 이동
	@RequestMapping("socialSignup")
	public String socialSignup(Model model, HttpSession session) throws Exception {
		if(session.getAttribute("naverUser") != null) {
			 MemberDTO naverUser = (MemberDTO)session.getAttribute("naverUser");
		     model.addAttribute("socialUser", naverUser);
		     model.addAttribute("type", "naver");
		     session.removeAttribute("naverUser");
	   
		}else if(session.getAttribute("kakaoUser") != null){
			 MemberDTO kakaoUser = (MemberDTO)session.getAttribute("kakaoUser");
		     model.addAttribute("socialUser", kakaoUser);
		     model.addAttribute("type", "kakao");
		     session.removeAttribute("kakaoUser");
		}
		return "/member/socialSignup";
	}
	
	
	
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
	
	
}
