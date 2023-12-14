package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.service.PartyService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

@SessionAttributes("member")
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
		MemberVO memebvo = (MemberVO) httpSession.getAttribute("member");
		System.out.println(memebvo.toString());
		partyService.updatePartyKing(memebvo.getId());
		System.out.println(memebvo.getId());
//			memebvo.getRole()=="PARTYKING";
		if (zu != 0) {
			return "/createparty/groupRegistrationForm";
		}
		return "/createparty/groupJoinForm";
	}
//  ==================================================================

//  =================================================================

	// 이미지클릭시 해당파티 리스트로 이동
	@GetMapping("/youtubePartyList")
	public String youtubeParty(Model model, GroupVO vo) {
		System.out.println(vo.getSeq());
		GroupVO selectPartylist = partyService.selectPeoplecntList(vo.getSeq());
		model.addAttribute("selectPartylist", selectPartylist);
		return "/createparty/youtubePartyList";
	}

	// 리스트 전체
	@GetMapping("youtubePartyselect")
	public String youtubePartyselect() {
		return "/createparty/youtubePartyselect";
	}

//	==================================================================
	// 와챠
	// 하나씩
	@GetMapping("/watchaPartyList")
	public String watchaPartyList(Model model, GroupVO vo) {
		System.out.println(vo.getSeq());
		GroupVO selectPartylist = partyService.selectPeoplecntList(vo.getSeq());
		System.out.println("selectPartylist : " + selectPartylist);
		model.addAttribute("selectPartylist", selectPartylist);
		return "/createparty/watchaPartyList";
	}

	@GetMapping("watchaPartyselect")
	public String watchaPartyselect() {
		return "/createparty/watchaPartyselect";
	}

//	--------------------------------------------------------
	// 파티 수정
	@GetMapping("partyUpdateForm")
	public String partyinfo(Model model, @ModelAttribute("member") MemberVO memberVO) {
		if (memberVO.getRole().equals("PARTYKING")) {
//    		 List<GroupVO> list = new ArrayList<>();
//    		 list=partyService.es(memberVO.getId());
			System.out.println(memberVO.getId());
			model.addAttribute("partylist", partyService.es(memberVO.getId()));
//    		 System.out.println(partyService.es(memberVO.getId()));
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

	// 유저가 만든 파티 업데이트
	@PostMapping("Update")
	public String partyUpdate(GroupVO groupVO) {
		System.out.println(groupVO);
		int zu = partyService.partyUpdate(groupVO);
		System.out.println(zu);
		return "redirect:partyUpdateForm";
	}
	
}
