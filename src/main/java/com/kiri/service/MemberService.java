package com.kiri.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	// member ���̺� ���� ��������
	public MemberDTO selectMember(String user_email) throws Exception {
		return memberdao.selectMember(user_email);
	}
	
	// ������ ���� ����
	public void modifyProfilePic(MemberDTO dto) {
		memberdao.modifyProfilePic(dto);
	}

	// �������� ����
	public void profileModify(MemberDTO dto){
		memberdao.profileModify(dto);
	}
	
	// �г��� �ߺ�Ȯ��
	public int nicknameCheck(String user_nickname) throws Exception{
		return memberdao.nicknameCheck(user_nickname);
	}
	
	// phone 중복확인
	public int phoneCheck(String user_phone) throws Exception{
		return memberdao.nicknameCheck(user_phone);
	}
	
	// ȸ�� Ż��
	public void profileDelete(Map<String,String> memberdto) throws Exception{
		memberdao.profileDelete(memberdto);
	}

	/* hobby */

	// list�� hobby ���̺� ���� ��������
	public List<HobbyDTO> selectHobbyList(String user_email) throws Exception {
		return hobbydao.selectHobbyList(user_email);
	}

	// hobby ���̺� ���� �ֱ�
	public void insertHobby(String user_email, String[] checkBoxArr) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		map.put("user_email", user_email);
		for (String hobbyMap : checkBoxArr) {
			map.put("hobby", hobbyMap);
			hobbydao.insertHobby(map);
		}
	}

	// hobby ���̺� ���� ����
	public void deleteHobby(String user_email) throws Exception {
		hobbydao.deleteHobby(user_email);
	}

	/* site */

	// site ���̺� ���� ��������
	public List<SiteDTO> selectSiteList(String user_email) throws Exception {
		return sitedao.selectSiteList(user_email);
	}
	
	// site ���̺� ���� �ֱ�
	public void insertSite(String user_email, String[] checkBoxArr) throws Exception {

		Map<String, String> map = new HashMap<String, String>();

		map.put("user_email", user_email);
		for (String siteMap : checkBoxArr) {
			map.put("area", siteMap);
			sitedao.insertSite(map);
		}
	}
	
	// site ���̺� ���� ����
		public void deleteSite(String user_email) throws Exception {
			sitedao.deleteSite(user_email);
		}

	/* ���Ե� ���� */

	// ���Ե� ���� ��������
	public List<Map<String, Object>> selectGroupList(String user_email) throws Exception {
		return tbl_groupdao.selectGroupList(user_email);
	}

	/* �Խ��� �� */

	// ���� �� ���ӱ� ���� ��������
	public List<Group_BoardDTO> selectGroupBoardList(String user_email) throws Exception {
		return group_boarddao.selectGroupBoardList(user_email);
	}

	// ���� �� �Ϲݱ� ���� ��������
	public List<BoardDTO> selectBoardList(String user_email) throws Exception {
		return boarddao.selectBoardList(user_email);
	}
	
	// �˻����� �Ϲݱ� ���� ��������
	public List<BoardDTO> genalSearchList(String category, String keyword, String user_email) throws Exception{
		return boarddao.genalSearchList(category,keyword,user_email);
	}

	// �Ϲ� �Խ��� ���� �̾ƿ���
	public int selectBoardCount(String user_email) throws Exception {
		return boarddao.selectBoardCount(user_email);
	}
	// �Ϲ� �Խñ� ����
	public int boardDelete(int seq_board) throws Exception{
		 return boarddao.boardDelete(seq_board);
	}
	
	// �˻����� ���ӱ� ���� ��������
	public List<Group_BoardDTO> mettingSearchList(String category, String keyword, String user_email) throws Exception{
		return group_boarddao.mettingSearchList(category,keyword,user_email);
	} 

	// ���� �Խ��� ���� �̾ƿ���
	public int selectGroupBoardCount(String user_email) throws Exception {
		return group_boarddao.selectGroupBoardCount(user_email);
	}
	// ���� �Խñ� ����
	public int groupBoardDelete(int seq_board) throws Exception{
		 return group_boarddao.groupBoardDelete(seq_board);
	}
	
	
	/* ��� ���� */

	// wishList ���� ��������
	public List<Map<String, Object>> selectWishList(String user_email) throws Exception {
		return wishlistdao.selectWishList(user_email);
	}

	// wishList ����
	public int wishDelete(int seq_group) throws Exception {
		return wishlistdao.wishDelete(seq_group);
	}
}
