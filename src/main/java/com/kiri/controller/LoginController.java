package com.kiri.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
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
		System.out.println("rkskek");
		System.out.println("session : " + session);
		String naverUrl = naverlogin.getAuthorizationUrl(session);
		System.out.println(naverUrl);
	    model.addAttribute("naverUrl",naverUrl);
		return "/member/login";
	}

	@ResponseBody
	@RequestMapping(value = "/general") 	
	public String general(String user_email, String user_pw) throws Exception { // 일반로그인 feat.조용진
		String Encryption_pw = ecp.getSHA512(user_pw); 
		MemberDTO dto = service.login(user_email, Encryption_pw);
		
		if(dto != null) { // 널이 아니라면 조회 성공
			dto.setUser_pw(null);
			Login_TypeDTO type = service.loginType(user_email);
			
			if(type.getType().equals("general")) { //일반 로그인
				session.setAttribute("loginSession", dto);
				service.loginLogSuccess(user_email);
				
				return "general";
				
			}else if(type.getType().equals("kakao")) { //카카오로 가입된 아이디
				return "kakao";
				
			}else { // 맴버는 조회 되었는데 타입에 오류 발생 
				return "error";
			}
			
		}else { // null 로그인 실패 
			service.loginLogFailed(user_email);
			return "loginFail";
		}
	}
	

	@ResponseBody
	@RequestMapping(value = "/naver") 	
	public String naver(String user_name, String user_phone) throws Exception { // 네이버 아이디로 feat.조용진
		System.out.println("user_name : " + user_name );
		System.out.println("user_phone : " + user_phone );
		
		String result = service.findId(user_name, user_phone);
		if(result != "nonmem") {
			return result;
		}else {
			return "nonmem";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/google") 	
	public String google(String user_name, String user_phone) throws Exception { // 구글 아이디로 feat.조용진
		System.out.println("user_name : " + user_name );
		System.out.println("user_phone : " + user_phone );
		
		String result = service.findId(user_name, user_phone);
		if(result != "nonmem") {
			return result;
		}else {
			return "nonmem";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId") 	
	public String findId(String user_name, String user_phone) throws Exception { // 아이디 찾기 feat.조용진
		System.out.println("user_name : " + user_name );
		System.out.println("user_phone : " + user_phone );
		
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
		System.out.println("user_name : " + user_name);
		System.out.println("user_email : " + user_email);
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
		System.out.println("메일요청");
		return mailService.findPw(user_email);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/tempPw") 
	public boolean tempPw(String user_email) throws Exception { // 비밀번호 수정 feat.조용진
		System.out.println("메일요청");
		String pw = mailService.updatePw(user_email);
	    String ecpPw = ecp.getSHA512(pw);
	    service.updatePw(user_email, ecpPw);
		
		return true;
	}
	
	@RequestMapping(value = "/toLogout")//logout페이지 요청 feat.조용진
	public String logout() {
		session.removeAttribute("loginSession");
		return "redirect:/";
	}
	
	 // 네이버 로그인 성공시 callback호출
    @RequestMapping(value="/logincallback", method= {RequestMethod.GET,RequestMethod.POST})
    public String callBack(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, HttpServletRequest request) throws Exception{
        OAuth2AccessToken oauthToken;
        oauthToken = naverlogin.getAccessToken(session, code, state);
        apiResult = naverlogin.getUserProfile(oauthToken);
        
        /**
         * apiResult json 구조 {"resultcode":"00", "message":"success",
         * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
         **/
        
        JSONParser parser = new JSONParser();
        Object obj = parser.parse(apiResult);
        JSONObject jsonObj = (JSONObject)obj;
        
        //3.데이터 파싱
        // Top레벨 단계 _response 파싱
        JSONObject response_obj = (JSONObject)jsonObj.get("response");

        // 네이버에서 주는 고유 ID
        String naverId = (String) response_obj.get("id");
        // 네이버에서 설정된 사용자 이름
        String naverNickname = (String) response_obj.get("nickname");
        // 네이버에서 설정된 이메일
        String naverEmail = (String) response_obj.get("email");
        
        MemberDTO member = new MemberDTO();
        member.setUser_email(naverEmail); //아이디
        member.setUser_name(naverNickname); //닉네임
        String ecpNaverId = ecp.getSHA512(naverId);
        //네이버 고유id번호
        
        boolean is_singup = signupService.emailCheck(naverEmail); //가입이 되어있으면 false 반환
        
        //네이버로 연동된 회원정보 찾기 =>[가입된 이메일] 또는 [네이버 고유번호id]를 조회하여 비교
        if(!is_singup) {
        	 Login_TypeDTO type = service.loginType(naverEmail);
        	 
        	 if(type.getType().equals("naver")||type.getSocial_id().equals(ecpNaverId)) {
        		 MemberDTO dto = service.socialLogin(naverEmail);
        		 dto.setUser_pw(null);
        		 session.setAttribute("loginSession", dto);
        		 return "/";
        	 }
        			 
        }else {
        	
        }
        
        
        
    
        //1.쌩판 홈페이지에 연동된 정보가 없는경우=>등록된 네이버 이메일x,네이버고유번호idx , 회원 가입절차 시작
        if (naverIdChk == null) {
                session.setAttribute("user", member);
                return "member/customRegister";
        //2.가입된 이메일은 있으나 네이버와의 연동이 안된경우        
        }else if(naverIdChk.getNaverLogin() == null && naverIdChk.getUseremail() !=null) {
                //2-1 가입된 계정에 네이버 연동 진행
                service.updateN(member);
                //2-2 연동 끝났으면 자동 로그인
                //네이버 고유id번호를 가진 계정의 id값을 추출하여 자동로그인 설정
                String id=service.naverChk(member).getUserid();
                UserDetails navervo = (UserDetails)cusd.loadUserByUsername(id);
                System.out.println(id);
                Authentication authentication = new UsernamePasswordAuthenticationToken(navervo, navervo.getPassword(),
                        navervo.getAuthorities());
                SecurityContext securityContext = SecurityContextHolder.getContext();
                securityContext.setAuthentication(authentication);
                session = request.getSession(true);
                session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
                return "redirect:/board/list";

        //3.둘다 아니라면 네이버로 가입 된 상태임. 네이버 로그인시 바로 로그인됨
        }else {
                //가입된 상태에서 네이버아이디=웹사이트아이디 인지, 혹은 다른아이디인지(네이버 고유번호로 id찾음)
                //시큐리티의 파라미터로 id값을 결정해서 로그인처리를 한다.
                String id=service.naverChk(member).getUserid()==null?newId:service.naverChk(member).getUserid();
                UserDetails navervo = (UserDetails)cusd.loadUserByUsername(id);
                System.out.println(newId);
                Authentication authentication = new UsernamePasswordAuthenticationToken(navervo, navervo.getPassword(),
                        navervo.getAuthorities());
                SecurityContext securityContext = SecurityContextHolder.getContext();
                securityContext.setAuthentication(authentication);
                session = request.getSession(true);
                session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);
                return "redirect:/board/list";
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
	
	// 로그인 창으로 이동
	@GetMapping("/customLogin")
	public void login(String error, String logout, Model model, HttpSession session) {
	    
	}
	
	@ExceptionHandler
	public String toError(Exception e) {
		System.out.println("예외 발생");
		e.printStackTrace();
		return "redirect:/toError";
	}
	
	
}
