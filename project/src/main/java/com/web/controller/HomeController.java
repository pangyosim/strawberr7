package com.web.controller;


import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.service.PartyService;
import com.web.service.TopService;


@Controller
public class HomeController {

	@Autowired
	private PartyService pysc;
	@Autowired
	private TopService ts;

	
	@GetMapping("/")
	public String main(Model model) {
		model.addAttribute("party", pysc.selectPeoplecnt());
		try {
			model.addAttribute("netflix_list", ts.getTopDatas());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "/main/index";
	}

	 
}
