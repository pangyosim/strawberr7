package com.web.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@PostMapping(value="paywork", produces="application/json; charset=utf-8")
	@ResponseBody
	public Map<String,Object> gethook(@RequestBody Map<String,Object> param,
									  @RequestParam int seq,
									  @RequestParam String userid,
									  @RequestParam int price) {
		PayVO pv = new PayVO();
		pv.setImp_uid((String)param.get("imp_uid"));
		pv.setMerchant_uid((String)param.get("merchant_uid"));
		pv.setResult((String) param.get("status"));
		pv.setSeq(seq);
		pv.setPrice(price);
		pv.setUserid(userid);
		ps.insertPayList(pv);
		GroupVO gv = ps.doPartyList(seq);
		ps.updatepartyinfo(gv);
		
		return param;
	}
	
}
