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
import com.kiri.auth.KakaoLogin;
import com.kiri.auth.NaverLogin;
import com.kiri.dto.Login_TypeDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.LoginService;
import com.kiri.service.SignupService;
import com.kiri.utills.EncryptionUtils;

@RequestMapping("/auth")
@Controller
public class AuthController {
	@Autowired
	private EncryptionUtils ecp;
	@Autowired
	private LoginService service;
	@Autowired
	private HttpSession session;
	@Autowired
	private SignupService signupService;
	
	//네이버
    @Autowired
    private NaverLogin naverLogin;
    //카카오
    @Autowired
    private KakaoLogin kakaoLogin;
    private String apiResult = null;
    
    // 네이버 로그인 성공시 callback호출
    @RequestMapping(value="naverCallback", method= {RequestMethod.GET,RequestMethod.POST}) //네이버 feat.조용진
    public String naverCallback(Model model, @RequestParam String code, @RequestParam String state, HttpServletRequest request) throws Exception{
        OAuth2AccessToken oauthToken;
        oauthToken = naverLogin.getAccessToken(session, code, state);
        apiResult = naverLogin.getUserProfile(oauthToken);
        JSONParser parser = new JSONParser();
        JSONObject jsonObj = (JSONObject)parser.parse(apiResult);
        JSONObject response_obj = (JSONObject)jsonObj.get("response");
        
        String naverId = (String) response_obj.get("id");
        String naverName = (String) response_obj.get("name");
        String naverEmail = (String) response_obj.get("email");
//        String naverProfileImg = (String) response_obj.get("profile_image");
        
        MemberDTO naver = new MemberDTO();
        naver.setUser_email(naverEmail); //아이디
        naver.setUser_name(naverName); //이름
        String ecpNaverId = ecp.getSHA512(naverId);
        
        naver.setUser_pw(ecpNaverId);
//        naver.setUser_image(naverProfileImg); //프로필사진
        //네이버 고유id번호
        boolean is_singup = signupService.emailCheck(naverEmail); //가입이 되어있으면 false 반환
        
        if(!is_singup) { //false 조회 된 것 true 조회 안된 것
        	 Login_TypeDTO type = service.loginType(naverEmail);
        	 
        	 if(type.getType().equals("naver") && type.getUnique_id().equals(ecpNaverId)) {
        		 MemberDTO dto = service.socialLogin(naverEmail);
        		 if("N".equals(dto.getUser_blacklist()) && "N".equals(dto.getUser_delete())){
        			 service.loginLogSuccess(dto.getUser_email());
        			 session.setAttribute("loginType", type.getType());
        			 session.setAttribute("loginSession", dto);
        			 return "redirect:/";
        		 
        	 	}else if(!"N".equals(dto.getUser_blacklist())) {
	       			Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "네이버", "블랙리스트");
	       		 	session.setAttribute("connection", connection);
	       		 	return "redirect:/auth/toConnetion";
	       		 	
	       		}else if(!"N".equals(dto.getUser_delete())) {
	       			Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "네이버", "탈퇴");
	       		 	session.setAttribute("connection", connection);
	       		 	return "redirect:/auth/toConnetion";
	       		}
        		 
        		 //일반 회원 가입 네이버로 연동 할지 선택 
        	 }else if(type.getType().equals("general") && !type.getUnique_id().equals(ecpNaverId)) {
        		 MemberDTO dto = service.socialLogin(naverEmail);
        		 signupService.updateLoginType(dto.getUser_email(), null, ecpNaverId);// 수정중
        		 Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "일반", "네이버");
        		 session.setAttribute("connection", connection);
        		 
        		 return "redirect:/auth/toConnetion";
        		 
        		//일반 회원 가입, 네이버로 연동 하려다가 취소했을 때
        	 }else if(type.getType().equals("general") && type.getUnique_id().equals(ecpNaverId)) {
        		 MemberDTO dto = service.socialLogin(naverEmail);
        		 Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "일반", "네이버");
        		 session.setAttribute("connection", connection);
        		 
        		 return "redirect:/auth/toConnetion";
        		 
        	 }else if(type.getType().equals("kakao")){
        		 MemberDTO dto = service.socialLogin(naverEmail);
        		 Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "카카오", "네이버");
	       		 session.setAttribute("connection", connection);
	       		 
	       		 return "redirect:/auth/toConnetion";
        	 }
        			 
        }else {// 가입 안되어있으면 회원가입으로 보내기
        	 session.setAttribute("naverUser", naver);
             return "redirect:/auth/socialSignup";
        }
        return "redirect:/toError"; // 위에 조건에서 return 안될 시 에러페이지로
    }   
	
    @RequestMapping(value = "/kakaoCallback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callbackKakao(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws Exception {
		OAuth2AccessToken oauthToken;
		oauthToken = kakaoLogin.getAccessToken(session, code, state);	
		String accessToken = oauthToken.getAccessToken();
		apiResult = kakaoLogin.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject)parser.parse(apiResult);
		JSONObject responseObj = (JSONObject) jsonObj.get("kakao_account");	
		JSONObject profile = (JSONObject) responseObj.get("profile");
		
		MemberDTO kakao = new MemberDTO();
		String kakaoEmail = (String) responseObj.get("email");
		
		
		String kakaoName = (String) profile.get("nickname");
		kakao.setUser_email(kakaoEmail);
		kakao.setUser_name(kakaoName);
		kakao.setUser_pw("kakao");
		session.setAttribute("accessToken", accessToken);
		
		if("".equals(kakaoEmail) || null == kakaoEmail ) {
			session.setAttribute("kakaoUser", kakao);
			return "redirect:/auth/socialSignup";
		}
		
		boolean is_singup = signupService.emailCheck(kakaoEmail);
		
		
		if(!is_singup) { //false 조회 된 것 true 조회 안된 것
			
			Login_TypeDTO type = service.loginType(kakaoEmail);
       	 
	       	if(type.getType().equals("kakao") && type.getUnique_id().equals("kakao")) {
	       		MemberDTO dto = service.socialLogin(kakaoEmail);
	       		if("N".equals(dto.getUser_blacklist()) && "N".equals(dto.getUser_delete())){
	       			service.loginLogSuccess(dto.getUser_email());
	       			session.setAttribute("loginType", type.getType());
		       		session.setAttribute("loginSession", dto);
		       		
		       		return "redirect:/";
		       		
	       		}else if(!"N".equals(dto.getUser_blacklist())) {
	       			Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "카카오", "블랙리스트");
	       		 	session.setAttribute("connection", connection);
	       		 	return "redirect:/auth/toConnetion";
	       		 	
	       		}else if(!"N".equals(dto.getUser_delete())) {
	       			Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "카카오", "탈퇴");
	       		 	session.setAttribute("connection", connection);
	       		 	return "redirect:/auth/toConnetion";
	       			
	       		}
	       		 
	       		 //일반 회원 가입 카카오로 연동 할지 선택 
	       	}else if(type.getType().equals("general") && !type.getUnique_id().equals("kakao")) {
	       		 MemberDTO dto = service.socialLogin(kakaoEmail);
	       		 signupService.updateLoginType(dto.getUser_email(), null, "kakao");
	       		 Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "일반", "카카오");
	       		 session.setAttribute("connection", connection);
	       		 
	       		 return "redirect:/auth/toConnetion";
	       		 
	       		//일반 회원 가입, 네이버로 연동 하려다가 취소했을 때
	       	}else if(type.getType().equals("general") && type.getUnique_id().equals("kakao")) {
	       		 MemberDTO dto = service.socialLogin(kakaoEmail);
	       		 Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "일반", "카카오");
	       		 session.setAttribute("connection", connection);
	       		 
	       		 return "redirect:/auth/toConnetion";
	       		 
	       	}else if(type.getType().equals("naver")){
		       	 MemberDTO dto = service.socialLogin(kakaoEmail);
		       	 Map<String,Object> connection =signupService.connection(dto.getUser_name(), dto.getUser_email(), type.getSignup_date(), "네이버", "카카오");
	       		 session.setAttribute("connection", connection);
	       		 
	       		 return "redirect:/auth/toConnetion";
	       	}
	       			 
			}else {// 가입 안되어있으면 회원가입으로 보내기
	       	 session.setAttribute("kakaoUser", kakao);
	            return "redirect:/auth/socialSignup";
			}
		return "redirect:/toError"; // 위에 조건에서 return 안될 시 에러페이지로

	}
    
    @RequestMapping(value = "/toConnetion")  // 연동페이지로 feat.조용진
	public String toConnetion(Model model)throws Exception {
	    model.addAttribute("connection", session.getAttribute("connection"));
	    session.removeAttribute("connection");
	    
		return "/member/userConnection";
	}
    
    @ResponseBody
    @RequestMapping(value = "/connetion")  // 연동 feat.조용진
    public String connetion(String user_email, String type)throws Exception {
    	if(type.equals("네이버"))type = "naver";
    	else if(type.equals("카카오")) type = "kakao";
    	
    	if(type.equals("naver") || type.equals("kakao")) {
    		signupService.updateLoginType(user_email, type , null);
    		service.loginLogSuccess(user_email);
        	service.updatePw(user_email, "social");
        	session.setAttribute("loginSession", service.socialLogin(user_email));
        	session.setAttribute("loginType", type);
        	return "completion";
    	}
    	return "error";
    }
	
	@RequestMapping("socialSignup") // 소셜 회원가입 창으로 이동 feat.조용진
	public String socialSignup(Model model) throws Exception {
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
	
	@RequestMapping("kakao") // 카카오 이메일동의 다시하기  feat.조용진
	public String kakao(Model model) throws Exception {
		String accessToken = (String)session.getAttribute("accessToken");
		kakaoLogin.kakaoLogout(accessToken, "https://kapi.kakao.com/v1/user/unlink");
		session.invalidate();
		return "redirect:/login/toLogin";
	}
	
	 @ExceptionHandler
		public String toError(Exception e) {
			System.out.println("예외 발생");
			e.printStackTrace();
			return "redirect:/toError";
	 }
	 
}
