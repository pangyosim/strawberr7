package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

	
	@GetMapping("login")
	public String login() {
		return "/login/loginForm";
	}
	
	@GetMapping("register")
	public String register() {
		return "/login/memberJoinForm";
	}
	
	@PostMapping("memberJoinResult")
	public void memberJoinResult(@RequestParam("loginId") String id, 
			   					   @RequestParam("loginPw") String pw, 
			   					   @RequestParam("loginPwConfirm") String pwC, 
			   					   @RequestParam("name") String name, 
			   					   @RequestParam("birth-year") String year, 
			   					   @RequestParam("birth-month") String month, 
			   					   @RequestParam("birth-day") String day, 
			   					   @RequestParam("address_1") String addr_1, 
			   					   @RequestParam("address_2") String addr_2, 
			   					   @RequestParam("address_3") String addr_3, 
			   					   @RequestParam("address_4") String addr_4, 
			   					   @RequestParam("tel") String tel, 
			   					   @RequestParam("email") String email,
			   					   @RequestParam("domain") String domain
																		) {
		System.out.println(id);
		System.out.println(pw);
		System.out.println(pwC);
		System.out.println(name);
		System.out.println(year);
		System.out.println(month);
		System.out.println(day);
		System.out.println(addr_1);
		System.out.println(addr_2);
		System.out.println(addr_3);
		System.out.println(addr_4);
		System.out.println(tel);
		System.out.println(email);
		System.out.println(domain);
				
	}
	
	
	
}























