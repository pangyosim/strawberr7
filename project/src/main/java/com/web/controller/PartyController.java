package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PartyController {
	
	@GetMapping("partydetail")
	public String getPartyDetail() {
		return "/partypage/partydetail";
	}
}
