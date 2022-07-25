package com.kiri.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kiri.service.LikeService;

@RequestMapping("/like")
@Controller
public class LikeController {
	@Autowired
	private LikeService service;
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/boardLike")
	@ResponseBody
	public int likeUp(int seq_board, String user_email) throws Exception{
		// 중복 방지
		int likeCheck = service.likeCheck(seq_board, user_email);
		if(likeCheck == 0) {
			// 좋아요 처음 누름
			service.likeUp(seq_board, user_email); // like 테이블 삽입
			service.updateLike(seq_board); // board 테이블 hit+1
		}else if(likeCheck == 1) {
			service.likeDown(seq_board, user_email);
			service.updateLikeCancel(seq_board); // board 테이블 hit-1
		}
		return likeCheck;
	}
}
