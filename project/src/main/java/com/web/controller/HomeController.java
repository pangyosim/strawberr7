package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	@GetMapping("main")
	public String main() {
		return "/main/main";
	}
	
	@GetMapping("login")
	public String getlogin() {
		return "/login/login";
	}
}
