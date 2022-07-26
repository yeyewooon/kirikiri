package com.kiri.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.service.BoardService;
import com.kiri.utills.Criteria;
import com.kiri.utills.PageMakerDTO;

@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private HttpSession session;
	
	/* 자유 게시판 */
	@RequestMapping(value = "/toBoard") // board 페이지 요청
	public String toBoard(Model model, Criteria cri) throws Exception {
		
		model.addAttribute("list", service.getListPaging(cri));
		int total = service.getTotal(cri);
		PageMakerDTO pageMake = new PageMakerDTO(cri, total);
		model.addAttribute("pageMaker", pageMake);
		
//		Cookie[] cookies = request.getCookies();
//		boolean cookieFlag = false;
//		for(Cookie cookie : cookies) {
//			if(cookie.getName().equals("visit_cookie") == false) { // 쿠키가 존재하지 않으면
//				cookieFlag = cookieFlag;
//			}else { // 쿠키가 존재하면
//				cookieFlag = !cookieFlag;
//			}
//		}
//		System.out.println("cookie 존재여부 : " + cookieFlag);
//		
//		if(cookieFlag == false) { // 쿠키가 존재하지 않으면
//			// 쿠키 생성
//			Cookie newCookie = new Cookie("visit_cookie", null);
//			newCookie.setComment("게시글조회 확인");
//			newCookie.setMaxAge(3 * 60);
//			newCookie.setPath("/");
//			response.addCookie(newCookie);
//		}
		
		return "board/board";
	}
	
//	@RequestMapping(value = "/sort")  // 카테고리별 게시글
//	@ResponseBody
//	public List<BoardDTO> sortByCategory(String category) throws Exception {
//		System.out.println("카테고리 : " + category);
//		List<BoardDTO> list = service.selectCategory(category);
//		return list;
//	}
	
	@RequestMapping(value = "/toWrite") // write 페이지 요청
	public String toWrite() {
		return "board/write";
	}
	
	@RequestMapping(value = "/write") // 게시글 작성 요청
	public String write(BoardDTO dto, @RequestParam(value="imgs[]", required=false) String[] imgs) throws Exception{		
		String user_email = ((MemberDTO)session.getAttribute("loginSession")).getUser_email();
		String user_nickname = ((MemberDTO)session.getAttribute("loginSession")).getUser_nickname();
		dto.setUser_email(user_email);
		dto.setUser_nickname(user_nickname);
		
		List<String> fileList = new ArrayList<>();
		if(imgs != null) {
			for(String image : imgs) {
				fileList.add(image);
			}
		}
		service.insert(dto, fileList);
		
		return "redirect:/board/toBoard";
	}
	
	@RequestMapping(value = "/summernoteImg", produces = "application/json") // summernote 이미지 업로드
	@ResponseBody
	public String uploadSummernoteImg(@RequestParam("file") MultipartFile file) throws Exception{
		String realPath = session.getServletContext().getRealPath("boardFile");
//		System.out.println("realPath : " + realPath);
		JsonObject jsonObject = service.uploadSummernoteImg(file, realPath);
		
		String result = jsonObject.toString();
		return result;
	}
	
	@RequestMapping(value = "/toDetailView") // 게시글 상세페이지 요청
	public String toDetailView(int seq_board, HttpServletRequest request
			 , HttpServletResponse response,  Model model, Criteria cri) throws Exception{
		String user_email = ((MemberDTO)session.getAttribute("loginSession")).getUser_email();
		// 조회수
		Cookie oldCookie = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}
		
		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + seq_board + "]")) {
				service.viewCntUp(seq_board);
				oldCookie.setValue(oldCookie.getValue() + "_[" + seq_board + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(oldCookie);
			}
		}else {
			service.viewCntUp(seq_board);
			Cookie newCookie = new Cookie("postView","[" + seq_board + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(newCookie);
		}
		
		
//		System.out.println("cookie : " + cookie.toString());
//		if(!(cookie.contains(String.valueOf(seq_board)))) {
//			cookie += seq_board + "/";
//			service.viewCntUp(seq_board);
//		}else {
//			Cookie newCookie = new Cookie("visit_cookie", cookie); 
//			newCookie.setPath("/");
//			response.addCookie(newCookie);
//		}
		
		// 게시글 정보 얻기
		Map<String, Object> map = service.getDetail(seq_board);
		model.addAttribute("detail", map);
		// 좋아요 여부, 개수
		model.addAttribute("like", service.like(seq_board, user_email));
		// criteria 인스턴스 전달
		model.addAttribute("cri", cri);
		
		return "board/detailView";
	}
	
	
	@RequestMapping(value = "/toModify") // 수정 페이지 요청
	public String toModify(int seq_board, Model model, Criteria cri) throws Exception{
		Map<String, Object> map = service.getDetail(seq_board);
		model.addAttribute("modMap", map);
		model.addAttribute("cri", cri);
		return "board/modify";
	}
	
	@RequestMapping(value = "/modify") // 게시글 수정 요청
	public String modify(BoardDTO dto, @RequestParam(value="imgs[]", required=false) String[] imgs) throws Exception {
		String path = session.getServletContext().getRealPath("boardFile");
				
		List<String> fileList = new ArrayList<>();
		if(imgs != null) {
			for(String image : imgs) {
				fileList.add(image);
			}
		}
		service.modify(dto, fileList);
		
		return "redirect:/board/toDetailView?seq_board="+dto.getSeq_board();
	}
	
	@RequestMapping(value = "/delImg") // 이미지 삭제 요청
	@ResponseBody
	public String delImg(String src) throws Exception {
		String path = session.getServletContext().getRealPath("boardFile");
		System.out.println("src : " + src);
		service.delFile(path, src);
		return "success";
	}
	
	@RequestMapping(value = "/delete") // 게시글 삭제 요청
	public String delete(int seq_board) throws Exception{
		service.delete(seq_board);
		return "redirect:/board/toBoard";
	}
	
//	@RequestMapping(value = "/search") // 게시글 검색
//	@ResponseBody
//	public List<BoardDTO> search(String category, String keyword, String option) throws Exception{
//		System.out.println("category : " + category + ", keyword : " + keyword + ", option : " + option);
//		List<BoardDTO> list = service.search(category, keyword, option);
//		return list;
//	}
	
	@RequestMapping(value = "/")
	public String home() {
		return "mainPage";
	}
}

