package com.web.controller;


import java.util.List;

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
		return "redirect:/";
	}
	
	// main 파티 리스트
	@GetMapping("/PartyList")
	public String PartyList(Model model, HttpSession session, int seq) {
			GroupVO selectParty = partyService.selectPeoplecntList(seq);
			MemberVO mv = ms.selectMember(selectParty.getPartykingid());
			model.addAttribute("selectParty", selectParty);
			model.addAttribute("seq", seq);
			model.addAttribute("mv", mv);
			if( session.getAttribute(LOGIN) != null) {
				MemberVO login_member = (MemberVO) session.getAttribute(LOGIN);
				model.addAttribute("loginuser", login_member.getEmail());
				PayVO pv = new PayVO();
				pv.setSeq(seq);
				pv.setUserid(login_member.getEmail());
				List<PayVO> get_pv_list = payService.getuserpaidparty(pv);
				for(PayVO get_pv : get_pv_list) {
					if(seq==get_pv.getSeq()) {
						model.addAttribute("pc", selectParty.getUserid());
						model.addAttribute("pw", selectParty.getUserpw());
					}
				}
			}
			return "/createparty/PartyList";
	}

	@GetMapping("Partyselect")
	public String Partyselect() {
		return "/createparty/Partyselect";
	}

//	--------------------------------------------------------
	// 파티 수정
	@GetMapping("/partyUpdateForm")
	public String partyinfo(Model model, @ModelAttribute("member") MemberVO memberVO, GroupVO vo) {
		if (memberVO.getRole().equals("PARTYKING")) {
			model.addAttribute("party", partyService.selectPeoplecntList(vo.getSeq()));
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

	@PostMapping("Update")
	public String partyUpdate(GroupVO groupVO, Model model) {
		GroupVO selectParty = partyService.selectPeoplecntList(groupVO.getSeq());
		groupVO.setPartydate(selectParty.getPartydate());
		int zu = partyService.partyUpdate(groupVO);
		return "redirect:getmypage";
	}
	
}
