package com.web.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.service.PartyService;
import com.web.vo.PartyMember;

@Controller
public class PartyController {
	@Autowired
	private PartyService partyService;
	
	@GetMapping("partydetail")
	public String getPartyDetail() {
		return "/partypage/partydetail";
	}

	@PostMapping("groupJoinForm")
	public void groupJoinForm() {
	}
	
	@PostMapping("groupJoinResult")
	public String result(PartyMember partyMember) {
		int zu = partyService.groupjoin(partyMember);
		if(zu ==1) {
			return "/partypage/partydetail";
		}
		return "/groupJoinForm";
	}

	
	
}
