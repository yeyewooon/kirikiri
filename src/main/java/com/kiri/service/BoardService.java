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
	
	//private Map<String, String> files = new HashMap<>();
	
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
//	public int insert(BoardDTO dto, List<Map<String, String>> files) throws Exception{
	public void insert(BoardDTO dto, List<String> fileList) throws Exception{
		int seq_board = boardDAO.selectSeq();
		dto.setSeq_board(seq_board);
		
		boardDAO.write(dto);
		// file db에 저장
//		for(Map<String, String> file : files) {
//			fileDAO.uploadFile(new Board_FileDTO(0, seq_board, file.get("ori_name"), file.get("saveName")));
//		}
		for(String file : fileList) {
			if(!file.isEmpty()) {
				System.out.println(file);
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
	public void modify(BoardDTO dto, String path, List<String> fileList) throws Exception{
		File realPathFile = new File(path);
		if(!realPathFile.exists()) realPathFile.mkdir();
		
		int seq_board = dto.getSeq_board();
		// file db에 저장 / 삭제
		
		// 파일 비교
		List<String> dbFileList = fileDAO.selectFile(seq_board);
		List<String> existFileList = new ArrayList<>();
		// 지금 게시글에 있는 파일이 db에 존재하면 existFile에 넣음
		for(String dbFile : dbFileList) {
			System.out.println("dbFile : " + dbFile);
			for(String file : fileList) {
				System.out.println("현재 있는 file : " + file);
				if(dbFile.equals(file)) {
					existFileList.add(file);
				}
			}
		}
		//System.out.println("!existFile : " + existFileList.toString());
		
		// existFileList에 있는 파일 = db에 있는 파일이니까 db에 저장 x
		// existFileList에 없는 파일 = db에 없으니까 지워줘야함.
		
		
		for(String file : fileList) {
			//fileDAO.uploadFile(new Board_FileDTO(0, seq_board, file));
			
			// 삭제된 파일들 서버 경로에서 삭제
//			File delFile = new File(path + File.separator + file.get("saveName"));
//			if(delFile.exists()) {
//				delFile.delete();
//				fileDAO.delete(file.get("saveName"));
//			}
		}
		

		
		// 수정 게시글 정보 DB에서 수정
		//return boardDAO.modify(dto);
		
	}
	
	// 게시글 삭제
	public void delete(int seq_board) throws Exception{
		boardDAO.delete(seq_board);
	}
	
}
