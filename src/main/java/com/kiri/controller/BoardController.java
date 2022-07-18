package com.kiri.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kiri.dto.BoardDTO;
import com.kiri.service.BoardService;

@RequestMapping("/board")
@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private HttpSession session;
	
	/* 자유 게시판 */
	@RequestMapping(value = "/toBoard") // board 페이지 요청
	public String toBoard(Model model) throws Exception {
		List<BoardDTO> list = service.selectAll();
		model.addAttribute("list", list);
		return "board/board";
	}
	
	@RequestMapping(value = "/toWrite") // write 페이지 요청
	public String toWrite() {
		return "board/write";
	}
	
	@RequestMapping(value = "/write") // 게시글 작성 요청
	public String write(BoardDTO dto, @RequestParam(value="imgs[]", required=false) String[] imgs) throws Exception{		
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
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value = "/toDetailView") // 게시글 상세페이지 요청
	public String toDetailView(int seq_board, Model model) throws Exception{
		Map<String, Object> map = service.getDetail(seq_board);
		model.addAttribute("detail", map);
		return "board/detailView";
	}
	
	@RequestMapping(value = "/toModify") // 수정 페이지 요청
	public String toModify(int seq_board, Model model) throws Exception{
		Map<String, Object> map = service.getDetail(seq_board);
		model.addAttribute("modMap", map);
		return "board/modify";
	}
	
	@RequestMapping(value = "/modify") // 게시글 수정 요청
	public String modify(BoardDTO dto, @RequestParam(value="imgs[]", required=false) String[] imgs) throws Exception {
		String path = session.getServletContext().getRealPath("boardFile");
		
//		List<Map<String, String>> files = (List)session.getAttribute("files");
//		System.out.println(files);
//		int result = service.modify(dto, path, files);
//		if(result > 0) {
//			session.removeAttribute("files");
//		}
		
		List<String> fileList = new ArrayList<>();
		if(imgs != null) {
			for(String image : imgs) {
				fileList.add(image);
			}
		}
		//service.modify(dto, path, fileList);
		
		return "redirect:/board/toDetailView?seq_board="+dto.getSeq_board();
	}
	
	@RequestMapping(value = "/delete") // 게시글 삭제 요청
	public String delete(int seq_board) throws Exception{
		service.delete(seq_board);
		return "redirect:/board/toBoard";
	}
	
}

