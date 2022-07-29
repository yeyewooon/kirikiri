package com.kiri.utills;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kiri.dto.MemberDTO;

public class Interceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		MemberDTO dto = (MemberDTO)request.getSession().getAttribute("loginSession");
		String type = (String)request.getSession().getAttribute("loginType");
		if(dto == null) {
			return true;
			
		}else {
			response.sendRedirect("/");
			return false;
		}
		
		
	}
}
