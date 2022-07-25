package com.kiri.webChat;

import javax.servlet.http.HttpSession;
import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

import com.kiri.dto.MemberDTO;

public class WSConfig extends Configurator{
	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		// ServerEndPointConfig : 서버의 endpoint에 전달하고 싶은 데이터가 있다면 이 객체를 활용하여 값을 담아 줄 수 있음
		// httpsession안에 있는 값을 꺼내기 위해 httpsession 먼저 꺼내기.
		HttpSession session = (HttpSession)request.getHttpSession();
		// nickname이라는 key값으로 사용자으 ㅣ닉네임을 셋팅해줌.
		sec.getUserProperties().put("user_nickname", ((MemberDTO) session.getAttribute("loginSession")).getUser_nickname());

		super.modifyHandshake(sec, request, response);
	}
}
