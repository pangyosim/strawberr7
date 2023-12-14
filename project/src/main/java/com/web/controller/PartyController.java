package com.web.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.service.MemberService;
import com.web.service.PartyService;
import com.web.service.PayService;
import com.web.session.MemberSession;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;
import com.web.vo.PayVO;

@SessionAttributes("member")
@Controller
public class PartyController implements MemberSession {
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private PayService payService;
	
	@Autowired
	private MemberService ms;

	@GetMapping("partydetail")
	public String getPartyDetail() {
		return "/partypage/partydetail";
	}

	@PostMapping("groupJoinResult")
	public String result(PartyMember partyMember, HttpSession httpSession) {
		partyService.groupjoin(partyMember);
		MemberVO memebvo = (MemberVO) httpSession.getAttribute("member");
		partyService.updatePartyKing(memebvo.getEmail());
//			memebvo.getRole()=="PARTYKING";
		return "/createparty/groupJoinForm";
// 	public String result(PartyMember partyMember, String email) {
// 		partyService.groupjoin(partyMember);
// 		ms.updateRole(email);
// 		return "redirect:/";
	}
//  ==================================================================

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
	// main 파티 리스트
	@GetMapping("/PartyList")
	public String PartyList(Model model, GroupVO vo, HttpSession session, PayVO payVO) {
			int count=0;
			GroupVO selectParty = partyService.selectPeoplecntList(vo.getSeq());

			count = payService.selectPeoplecnt(payVO.getSeq());

			MemberVO mv = ms.selectMember(selectParty.getPartykingid());
			model.addAttribute("selectParty", selectParty);
			model.addAttribute("mv", mv);
			model.addAttribute("seq", vo.getSeq());
			model.addAttribute("PeopleList",count);
//			while(selectPeoplecnt){
//				
//			}
			return "/createparty/PartyList";
	}

	@GetMapping("Partyselect")
	public String Partyselect() {
		return "/createparty/Partyselect";
	}

//	--------------------------------------------------------
	// 파티 수정
	@GetMapping("partyUpdateForm")
	public String partyinfo(Model model, @ModelAttribute("member") MemberVO memberVO) {
		if (memberVO.getRole().equals("PARTYKING")) {
			model.addAttribute("partylist", partyService.myparty(memberVO.getEmail()));
			return "/createparty/partyUpdate";
		} else {
			return "redirect:/";
		}
	}

	// 유저가 만든 정보 보기
	@GetMapping("/createparty/partyUpdate")
	public String partyUpdateF() {
		return "/createparty/partyUpdate";
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

	// 유저가 만든 파티 업데이트
	@PostMapping("Update")
	public String partyUpdate(GroupVO groupVO) {
		int zu = partyService.partyUpdate(groupVO);
		return "redirect:partyUpdateForm";
	}

}
