package com.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.service.PayService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PayVO;

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
	
	@PostMapping(value="payresult", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String,Object> gethook(@RequestBody Map<String,Object> param, int seq) {
//		System.out.println(param.get("imp_uid"));
//		System.out.println(param.get("merchant_uid"));
//		System.out.println(param.get("status"));
		PayVO pv = new PayVO();
		pv.setImp_uid((String)param.get("imp_uid"));
		pv.setMerchant_uid((String)param.get("merchant_uid"));
		pv.setResult((String) param.get("status"));
		System.out.println((String)param.get("seq"));
		//ps.insertPayList(pv);
		return param;
	}
	
	
	
}
