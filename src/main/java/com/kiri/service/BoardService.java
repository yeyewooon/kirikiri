package com.kiri.service;

import java.io.File;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kiri.dao.BoardDAO;
import com.kiri.dao.Board_CommentDAO;
import com.kiri.dao.Board_FileDAO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Board_FileDTO;

@Service
public class BoardService {
	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private Board_FileDAO fileDAO;
	@Autowired
	private Board_CommentDAO commentDAO;
	
	// 게시글 전체 조회
	public List<BoardDTO> selectAll() throws Exception{
		return boardDAO.selectAll();
	}
	
	// 게시글 상세 조회
	public Map<String, Object> getDetail(int seq_board) throws Exception{
		// 다른 타입의 데이터를 반환하기 위해 map을 이용
		Map<String, Object> map = new HashMap<>();
		boardDAO.updateView_count(seq_board); // 조회수 + 1
		map.put("boardDTO", boardDAO.selectOne(seq_board)); // 게시글 데이터 가져오기
		map.put("commentList", commentDAO.selectAll(seq_board)); // 댓글 데이터 가져오기
		return map;
	}
	
	// 게시글 작성
	public void insert(BoardDTO dto, List<String> fileList) throws Exception{
		int seq_board = boardDAO.selectSeq();
		dto.setSeq_board(seq_board);
		
		boardDAO.write(dto);
		// file db에 저장
		for(String file : fileList) {
			if(!file.isEmpty()) {
				fileDAO.uploadFile(new Board_FileDTO(0, seq_board, file));
			}
		}
	}
	
	// summernote 이미지 업로드
	public JsonObject uploadSummernoteImg(MultipartFile file, String realPath) {
		JsonObject jsonObject = new JsonObject();
		// 서버 root 에 boardFile 폴더 없으면 폴더 먼저 생성
		File realPathFile = new File(realPath);
		if(!realPathFile.exists()) realPathFile.mkdir();
		
		String ori_name = file.getOriginalFilename();
		String saveName = UUID.randomUUID() + "_" + ori_name;
		File targetFile = new File(realPath + File.separator + saveName);
		
		try {
			System.out.println("이미지 저장 성공");
			InputStream fileStream = file.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("url", "/boardFile/" + saveName);
			jsonObject.addProperty("responseCode", "success");
			//jsonObject.addProperty("saveName", saveName);
		}catch(Exception e) {
			System.out.println("이미지 저장 실패");
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	// 게시글 수정
	public void modify(BoardDTO dto, List<String> fileList) throws Exception{
		int seq_board = dto.getSeq_board();
		boardDAO.modify(dto);
		
		for(String file : fileList) {
			if(!file.isEmpty()) {
				fileDAO.uploadFile(new Board_FileDTO(0, seq_board, file));
			}
		}
	}
	
	// 첨부 파일 삭제
	public void delFile(String path, String src) throws Exception {
		if(src.length() != 0) {
			File file = new File(path + File.separator + src);
			if(file.exists()) {
				file.delete();
				fileDAO.delete(src);
			}
		}
	}
	
	// 게시글 삭제
	public void delete(int seq_board) throws Exception{
		boardDAO.delete(seq_board);
	}
	
}
