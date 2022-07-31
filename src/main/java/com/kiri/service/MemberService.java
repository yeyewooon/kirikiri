package com.kiri.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kiri.dao.BoardDAO;
import com.kiri.dao.Group_BoardDAO;
import com.kiri.dao.HobbyDAO;
import com.kiri.dao.MemberDAO;
import com.kiri.dao.SiteDAO;
import com.kiri.dao.Tbl_GroupDAO;
import com.kiri.dao.WishListDAO;
import com.kiri.dto.BoardDTO;
import com.kiri.dto.Group_BoardDTO;
import com.kiri.dto.HobbyDTO;
import com.kiri.dto.MemberDTO;
import com.kiri.dto.SiteDTO;

@Service
public class MemberService {

	@Autowired
	private MemberDAO memberdao;
	@Autowired
	private HobbyDAO hobbydao;
	@Autowired
	private SiteDAO sitedao;
	@Autowired
	private Tbl_GroupDAO tbl_groupdao;
	@Autowired
	private WishListDAO wishlistdao;
	@Autowired
	private BoardDAO boarddao;
	@Autowired
	private Group_BoardDAO group_boarddao;

	/* member */

	// member 조회
	public MemberDTO selectMember(String user_email) throws Exception {
		return memberdao.selectMember(user_email);
	}
	
	// 사진 수정
	public void modifyProfilePic(String user_email,String profile_image) {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_image", profile_image);
		map.put("user_email", user_email);
		
		memberdao.modifyProfilePic(map);
	}
	
	// 프로필 사진 업로드
	public String uploadProfile(MultipartFile file, String realPath) throws Exception{ 
        File realPathFile = new File(realPath);
        if(!realPathFile.exists()) realPathFile.mkdir();
        String sys_name = null;
        if(!file.isEmpty()) {
            String ori_name = file.getOriginalFilename();
            sys_name = UUID.randomUUID() + "" + ori_name;
            file.transferTo(new File(realPath + File.separator + sys_name));
        }
        return sys_name;
    }

	// 개인정보 수정
	public void profileModify(MemberDTO dto){
		
		memberdao.profileModify(dto);
	}
	
	// 닉네임 중복확인
	public int nicknameCheck(String user_nickname) throws Exception{
		return memberdao.nicknameCheck(user_nickname);
	}
	
	// phone 중복확인
	public int phoneCheck(String user_phone) throws Exception{
		return memberdao.nicknameCheck(user_phone);
	}
	
	// pw 중복확인
   public int pwCheck(String user_pw, String user_email) throws Exception{
      return memberdao.pwCheck(user_pw, user_email);
   }
	
	// 회원 탈퇴
	public void profileDelete(Map<String,String> memberdto) throws Exception{
		memberdao.profileDelete(memberdto);
	}

	/* hobby */

	// hobby 조회
	public List<HobbyDTO> selectHobbyList(String user_email) throws Exception {
		return hobbydao.selectHobbyList(user_email);
	}

	// hobby insert
	public void insertHobby(String user_email, String[] checkBoxArr) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		map.put("user_email", user_email);
		for (String hobbyMap : checkBoxArr) {
			map.put("hobby", hobbyMap);
			hobbydao.insertHobby(map);
		}
	}

	// hobby delete
	public void deleteHobby(String user_email) throws Exception {
		hobbydao.deleteHobby(user_email);
	}

	/* site */

	// site 조회
	public List<SiteDTO> selectSiteList(String user_email) throws Exception {
		return sitedao.selectSiteList(user_email);
	}
	
	// site insert
	public void insertSite(String user_email, String[] checkBoxArr) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		map.put("user_email", user_email);
		for (String siteMap : checkBoxArr) {
			map.put("area", siteMap);
			sitedao.insertSite(map);
		}
	}
	
	// site delete
		public void deleteSite(String user_email) throws Exception {
			sitedao.deleteSite(user_email);
		}

	/* 일반 게시판 */

	// 일반게시판 조회
	public List<Map<String, Object>> selectGroupList(String user_email) throws Exception {
		return tbl_groupdao.selectGroupList(user_email);
	}
	
	// 일반게시판 리스트로 조회
	public List<BoardDTO> selectBoardList(String user_email) throws Exception {
		return boarddao.selectBoardList(user_email);
	}
	
	// 전체 게시글 curPage로 자르기 
	public List<BoardDTO> selectBoard(String user_email, int start, int end ) throws Exception{
		return boarddao.selectBoard(user_email, start, end);
	}
	
	// ajax 일반게시판 조회
	public List<BoardDTO> genalBoard(String user_email) throws Exception{
		return boarddao.genalBoard(user_email);
	}	
	
	// 일반게시판 검색으로 조회
	public List<BoardDTO> genalSearchList(String category, String keyword, String user_email) throws Exception{
		return boarddao.genalSearchList(category, keyword,user_email);
	}
	
	// 페이지네이션 Navi
	public HashMap<String, Object> getPageNavi(String user_email, int curPage) throws Exception {
		return boarddao.getPageNavi(user_email,curPage);
	}
	public List<BoardDTO> selectAllBoard(String user_email) throws Exception{
		return boarddao.selectAllBoard(user_email);
	}

	// 일반게시판 총 갯수
	public int selectBoardCount(String user_email) throws Exception {
		return boarddao.selectBoardCount(user_email);
	}
	// 일반게시판 삭제
	public int boardDelete(int seq_board) throws Exception{
		 return boarddao.boardDelete(seq_board);
	}

	/* 모임게시판 */

	// 모임게시판 조회
	public List<Group_BoardDTO> selectGroupBoardList(String user_email) throws Exception {
		return group_boarddao.selectGroupBoardList(user_email);
	}
	
	// ajax 모임게시판 조회
	public List<Group_BoardDTO> selectAllGroupBoard(String user_email,int start, int end) throws Exception{
		return group_boarddao.selectAllGroupBoard(user_email,start, end);
	}
	
	// 모임게시판 검색으로 조회
	public List<Group_BoardDTO> meetingSearchList(String category, String keyword, String user_email) throws Exception{
		return group_boarddao.meetingSearchList(category,keyword,user_email);
	} 

	// 모임게시판 총 갯수
	public int selectGroupBoardCount(String user_email) throws Exception {
		return group_boarddao.selectGroupBoardCount(user_email);
	}
	// 모임게시판 삭제
	public int groupBoardDelete(int seq_board) throws Exception{
		 return group_boarddao.groupBoardDelete(seq_board);
	}
	
	/* wishList */

	// wishList 조회
	public List<Map<String, Object>> selectWishList(String user_email) throws Exception {
		return wishlistdao.selectWishList(user_email);
	}

	// wishList 삭제
	public int wishDelete(int seq_group) throws Exception {
		return wishlistdao.wishDelete(seq_group);
	}
}
