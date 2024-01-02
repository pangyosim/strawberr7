package com.web.controller;


import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.service.GroupService;
import com.web.service.PartyService;
import com.web.service.TopService;
import com.web.vo.GroupVO;


@Controller
public class HomeController {

	@Autowired
	private PartyService pysc;
	@Autowired
	private TopService ts;
	@Autowired
	private GroupService groupService;
	
	@GetMapping("/")
	public String main(Model model) {
		model.addAttribute("party", pysc.selectPeoplecnt());
		try {
			model.addAttribute("netflix_list", ts.getTopDatas());
			model.addAttribute("whacha_list", ts.getTopWhacha());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//홈검색리스트
		List<GroupVO> groupList = groupService.getGroupList();
		model.addAttribute("groupList",groupList);
		
		return "/main/index";
	}
	
	
	 
}
