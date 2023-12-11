package com.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.MailService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MailController {
	
	private final MailService mailService;
	
	@GetMapping("mail")
	public String MailPage() {
		return "/mail";
	}
	
	@ResponseBody
	@PostMapping("/mail")
	public String MailSend(String mail) {
		
		int number = mailService.sendMail(mail);
		
		String num = "" + number;
		
		return num;
	}
	
}
