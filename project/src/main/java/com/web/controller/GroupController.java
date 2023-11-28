package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class GroupController {
	
	@GetMapping("groupJoinForm")
	public String groupJoinView() {
		return "/createparty/groupJoinForm";
	}
}
