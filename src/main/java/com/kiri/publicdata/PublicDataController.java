package com.kiri.publicdata;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.dataformat.xml.XmlMapper;






@Controller
@RequestMapping(value = "/public")
public class PublicDataController {
	
	@Autowired
	private PublicDataService pdservice;
	
	@RequestMapping(value = "/publicData")
	public String toJson(Model model) throws Exception{
		String rs = pdservice.getXml();
		// ObjectMapper 클래스를 이용해서 map형식으로 데이터를 변환
		XmlMapper mapper = new XmlMapper();
		Map<String, Object> map = mapper.readValue(rs, Map.class);
		model.addAttribute("data", map);
		System.out.println("=====================================");
		System.out.println(map);
		return "/publicData/cararea";
	}
}
