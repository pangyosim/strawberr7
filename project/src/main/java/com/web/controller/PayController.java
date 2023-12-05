package com.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.service.PayService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;

@Controller
public class PayController {
	
	@Autowired
	private PayService ps;
	
	@GetMapping("/payinfo")
	public String payinfo(Model model, int seq, int session) {
		MemberVO mv = ps.doMemberList(session);
		GroupVO vo = ps.doPartyList(seq);
		model.addAttribute("vo",vo);
		model.addAttribute("mv", mv);
		return "/pay/payinfo";
	}
	
	
	
	
	
}
