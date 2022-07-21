package com.kiri.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kiri.dto.Board_CommentDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.CommentService;

@RequestMapping("/comment")
@Controller
public class CommentController {
	@Autowired
	private CommentService service;
	@Autowired
	private HttpSession session;
	
	// 댓글 등록
	@RequestMapping(value = "/write")
	@ResponseBody
	public String write(Board_CommentDTO dto) throws Exception{
		
//		String user_email = ((MemberDTO)session.getAttribute("loginSession")).getUser_email();
//		String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
//		dto.setUser_email(user_email);
//		dto.setUser_nickname(user_nickname);
		dto.setUser_email("abc123");
		dto.setUser_nickname("테스트맨1");
		service.write(dto);
		
		List<Board_CommentDTO> list = service.selectAll(dto.getSeq_board());
		return "success";
	}
	
	// 댓글 목록
	@RequestMapping(value = "/commentList")
	@ResponseBody
	public List<Board_CommentDTO> commentList(Integer seq_board) throws Exception{
		System.out.println("seq_board : " + seq_board);
		
		List<Board_CommentDTO> list = service.selectAll(seq_board);
		return list;
	}
}
