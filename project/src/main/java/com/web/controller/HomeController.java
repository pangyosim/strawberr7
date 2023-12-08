package com.web.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.service.PartyService;


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
