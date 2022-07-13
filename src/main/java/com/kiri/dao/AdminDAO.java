package com.kiri.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kiri.dto.MemberDTO;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSession session;

	public List<MemberDTO> selectAllMember(int start, int end) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("adminMapper.selectAllMember", map);
	}

	public HashMap<String, Object> getPageNavi(int curPage) throws Exception {
		int totalCnt = session.selectOne("adminMapper.getPageNavi"); // 전체 게시글의 개수
		int recordCntPerPage = 15; // 한 페이지에 몇개의 데이터(게시글)을 띄워줄지
		int naviCntPerPage = 3; // 네비바에 몇개 단위로 페이징을 구성할지
		int pageTotalCnt = 0; // 총 몇 페이지가 나올지

		if (totalCnt % recordCntPerPage > 0) { // 나머지가 생김
			pageTotalCnt = totalCnt / recordCntPerPage + 1;
		} else {
			pageTotalCnt = totalCnt / recordCntPerPage;
		}

		if (curPage < 1) {// 현재 페이지가 0이거나 혹은 음수일때
			curPage = 1; // 무조건 첫페이지로 맞춰주기
		} else if (curPage > pageTotalCnt) { // 현재 페이지가 총 페이지 수보다 크다면
			curPage = pageTotalCnt; // 무조건 마지막 페이지로 맞춰주기
		}

		int startNavi = ((curPage - 1) / naviCntPerPage) * naviCntPerPage + 1;
		int endNavi = startNavi + naviCntPerPage - 1;

		// 만약에 endNavi가 전체 페이지를 넘어갈 수 없음
		if (pageTotalCnt < endNavi) { // endNavi가 전체 페이지수보다 크다면
			endNavi = pageTotalCnt;
		}

		System.out.println("현재 페이지 : " + curPage);
		System.out.println("startNavi : " + startNavi);
		System.out.println("endNavi : " + endNavi);

		// <> 모양을 넣어줄지 여부에 대한 검사
		boolean needPrev = true; // startNavi가 1일때 needPrev가 false
		boolean needNext = true; // endNavi가 마지막 페이지(전체 페이지)와 같을때 needNext가 false

		if (startNavi == 1) {
			needPrev = false;
		}
		if (endNavi == pageTotalCnt) {
			needNext = false;
		}

		System.out.println("needPrev 필요? " + needPrev);
		System.out.println("needNext 필요? " + needNext);

		// map -> key, value
		// 제네릭 <키에 대한 자료형, 값에 대한 자료형>
		HashMap<String, Object> map = new HashMap<>();
		map.put("startNavi", startNavi);
		map.put("endNavi", endNavi);
		map.put("needPrev", needPrev);
		map.put("needNext", needNext);

		return map;
	}
}
