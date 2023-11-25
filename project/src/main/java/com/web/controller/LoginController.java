package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	
	@GetMapping("login")
	public String login() {
		System.out.println("client get request : ");
		System.out.println("commit Test");
		return "login/login";
	}

}
