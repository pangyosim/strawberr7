package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.web.service.PartyService;
import com.web.vo.GroupVO;


@Controller
public class HomeController {

	@Autowired
	private PartyService pysc;

	
	@GetMapping("/")
	public String main(GroupVO vo, Model model) {
		model.addAttribute("party", pysc.selectPeoplecnt(vo));

		return "/main/index";
	}

	 
}
