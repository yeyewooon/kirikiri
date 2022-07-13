package com.kiri.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kiri.dto.Group_CalendarDTO;
import com.kiri.service.GroupCalendarService;

@RequestMapping("/cal")
@Controller
public class GroupCalendar {
	@Autowired
	private HttpSession session;

	@Autowired
	private GroupCalendarService service;

	// 캘린더 페이지로 이동
	@RequestMapping(value = "/toGroupCalendar")
	public String toGroupCalendar(int seq_group, Model model) {
		System.out.println("잘나옴요" + seq_group);
		model.addAttribute("seq_group", seq_group);
		return "/group/groupCalendar";
	}

	// 일정 추가
	@ResponseBody
	@RequestMapping(value = "/calInsert")
	public String calInfo(Group_CalendarDTO dto) throws Exception {
		System.out.println("calInsert 들어옴");
		System.out.println(dto.getStart());

		System.out.println(dto.toString());
		service.insert(dto);
		return "redirect:/calMain";
	}

	// 일정 전체 데이터 조회 -> json으로 보내줘야한다
	@ResponseBody
	@RequestMapping(value = "/calList", produces = "application/json; charset=UTF-8")
	public String calList(Model model, int seq_group) throws Exception {
		System.out.println("여기로 들어온듯");
		System.out.println(seq_group);
		List<Group_CalendarDTO> list = service.select(seq_group);

		// 00:00:00 삭제 후 다시 setter에 셋팅
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStart(list.get(i).getStart().substring(0, 10));
		}

		// list를 json으로 변경
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonList = objectMapper.writeValueAsString(list);
		model.addAttribute("list", list);
		return jsonList;

	}

	// 일정 상세페이지
	@ResponseBody
	@RequestMapping(value = "/calDetail", produces = "application/json; charset=UTF-8")
	public List<Group_CalendarDTO> calDetail(@RequestParam("seq_group_cal") int seq_group_cal) throws Exception {

		System.out.println("일정 상세 페이지" + seq_group_cal);
		List<Group_CalendarDTO> list = service.selectDetail(seq_group_cal);

		// 00:00:00 삭제 후 다시 setter에 셋팅
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStart(list.get(i).getStart().substring(0, 10));
		}

		return list;
	}

	// 일정 삭제페이지
	@ResponseBody
	@RequestMapping(value = "/calDelete")
	public String calDelete(int seq_group_cal) throws Exception {
		System.out.println("삭제 페이지 입니다");
		System.out.println(seq_group_cal);
		int rs = service.calDelete(seq_group_cal);
		if (rs > 0) {
			System.out.println("일정 삭제 완료");
			return "success";
		} else {
			System.out.println("일정 삭제 실패");
			return "fail";
		}
	}

	// 일정 수정 calModify
	@ResponseBody
	@RequestMapping(value = "/calModify")
	public String calModify(Group_CalendarDTO dto) throws Exception {
		int rs = service.calModify(dto);
		if (rs > 0) {
			System.out.println("업데이트 성공");
			return "success";
		} else {
			System.out.println("업데이트 실패");
			return "fail";
		}
	}

	@ExceptionHandler // 에러 처리
	public String toError(Exception e) {
		e.printStackTrace();
		return "error";
	}

}
