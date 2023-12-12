package com.web.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.service.PartyService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;


@Controller
public class HomeController {

	@Autowired
	private PartyService pysc;

	
	@GetMapping("/")
	public String main(Model model) {
		model.addAttribute("party", pysc.selectPeoplecnt());
		return "/main/index";
	}

	 
}
