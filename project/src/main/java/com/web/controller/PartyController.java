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
import com.web.service.MemberService;
import com.web.service.PartyService;
import com.web.session.MemberSession;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

@SessionAttributes("member")
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
// 	public String result(PartyMember partyMember, String email) {
// 		partyService.groupjoin(partyMember);
// 		ms.updateRole(email);
// 		return "redirect:/";
	}
//  ==================================================================

//  =================================================================

=======
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
			System.out.println(selectPartylist.getUserid());
			MemberVO mv = ms.selectMember(selectPartylist.getUserid());
			model.addAttribute("selectPartylist", selectPartylist);
			model.addAttribute("mv", mv);
			System.out.println(mv);
			model.addAttribute("seq", vo.getSeq());
			return "/createparty/PartyList";
	}

	@GetMapping("Partyselect")
	public String watchaPartyselect() {
		return "/createparty/Partyselect";
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
		System.out.println(groupVO);
		int zu = partyService.partyUpdate(groupVO);
		System.out.println(zu);
		return "redirect:partyUpdateForm";
	}

}
