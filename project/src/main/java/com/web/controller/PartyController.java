package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.management.relation.Role;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.service.PartyService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

import oracle.jdbc.proxy.annotation.Post;

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
	public String result(PartyMember partyMember, HttpSession httpSession) {
		int zu = partyService.groupjoin(partyMember);

		if (zu == 1) {
			return "/main/index";
		}
		return "/createparty/groupJoinForm";
	}

//  ==================================================================
	@GetMapping("groupJoinForm")
	public String groupJoinView() {
		return "/createparty/groupJoinForm";
	}

	// 동의폼
	@GetMapping("groupRegistrationForm")
	public String groupRegistrationView() {
		return "/createparty/groupRegistrationForm";
	}

	// 파티만들기폼
	@GetMapping("groupInsert")
	public String groupInsert() {
		return "/createparty/groupInsert";
	}

	// 파티만들기 등록
	@PostMapping("groupOk")
	public String groupInsertpost(GroupVO groupVo) {
		partyService.groupInsert(groupVo);
		return "/main/index";
	}
//  =================================================================
	

	// 이미지클릭시 해당파티 리스트로 이동
	@GetMapping("/youtubePartyList")
	public String youtubeParty(Model model,GroupVO vo) {
		System.out.println(vo.getSeq());
		GroupVO selectPartylist = partyService.selectPeoplecntList(vo.getSeq());
		model.addAttribute("selectPartylist", selectPartylist);
		return "/createparty/youtubePartyList";
	}

	@GetMapping("youtubePartyselect")
	public String youtubePartyselect() {
		return "/createparty/youtubePartyselect";
	}
	
	
//	==================================================================
	//와챠

	@GetMapping("/watchaPartyList")
	public String watchaPartyList(Model model,GroupVO vo) {
		System.out.println(vo.getSeq());
		GroupVO selectPartylist = partyService.selectPeoplecntList(vo.getSeq());
		System.out.println("selectPartylist : "+selectPartylist);
		model.addAttribute("selectPartylist", selectPartylist);
		return "/createparty/watchaPartyList";
	}

	@GetMapping("watchaPartyselect")
	public String watchaPartyselect() {
		return "/createparty/watchaPartyselect";
	}
	
//	--------------------------------------------------------
        


}
