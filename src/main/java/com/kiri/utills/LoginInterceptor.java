package com.kiri.utills;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kiri.dto.MemberDTO;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		String type = (String)request.getSession().getAttribute("loginType");
		String requestUrl = request.getRequestURL().toString(); 
		MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
		
		if(dto == null ){
			response.sendRedirect("/login/toLogin");
			return false;
	
		}else {
		    if((!"admin".equals(type)|| !type.equals("admin") )&& requestUrl.contains("/admin")){
				  response.sendRedirect("/");
			      return false;
			  
			}
			return true;
		}
		
	}
}
