package com.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.service.MemberService;
import com.web.service.PartyService;
import com.web.session.MemberSession;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;


@Controller
public class PartyController implements MemberSession {
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private MemberService ms;

	@GetMapping("partydetail")
	public String getPartyDetail() {
		return "/partypage/partydetail";
	}

	@PostMapping("groupJoinResult")
	public String result(PartyMember partyMember, String email) {
		partyService.groupjoin(partyMember);
		ms.updateRole(email);
		return "redirect:/";
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
	

//	// 이미지클릭시 해당파티 리스트로 이동
//	@GetMapping("/youtubePartyList")
//	public String youtubeParty(Model model, GroupVO vo, HttpSession session) {
//			GroupVO selectPartylist = partyService.selectPeoplecntList(vo.getSeq());
//			model.addAttribute("selectPartylist", selectPartylist);
//			model.addAttribute("seq", vo.getSeq());
//			return "/createparty/youtubePartyList";
//	}
//
//	@GetMapping("youtubePartyselect")
//	public String youtubePartyselect() {
//		return "/createparty/youtubePartyselect";
//	}
//	
//	
//	==================================================================
	
	//와챠

	@GetMapping("/PartyList")
	public String watchaPartyList(Model model, GroupVO vo, HttpSession session) {
			GroupVO selectPartylist = partyService.selectPeoplecntList(vo.getSeq());
			MemberVO mv = ms.selectMember(selectPartylist.getUserid());
			model.addAttribute("selectPartylist", selectPartylist);
			model.addAttribute("mv", mv);
			model.addAttribute("seq", vo.getSeq());
			return "/createparty/PartyList";
	}

	@GetMapping("Partyselect")
	public String watchaPartyselect() {
		return "/createparty/Partyselect";
	}
	
	
	
//	--------------------------------------------------------
    
	@GetMapping("createparty")
	public String getpartyform(String email, HttpSession session) {
		MemberVO mv = ms.selectMember(email);
		if(mv.getRole().equals("PARTYKING")) {
			return "/createparty/groupInsert";
		}
		session.setAttribute("email", email);
		return "/createparty/groupJoinForm";
	}


}
