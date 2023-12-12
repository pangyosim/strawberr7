package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.service.GroupService;
import com.web.service.MemberService;
import com.web.service.PartyService;
import com.web.service.PayService;
import com.web.session.MemberSession;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;
import com.web.vo.PayVO;


@Controller
public class PartyController implements MemberSession {
	@Autowired
	private PartyService partyService;
	
	@Autowired
	private GroupService groupService;
	
	@Autowired
	private PayService payService;
	
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
	public String watchaPartyList(Model model, GroupVO vo, HttpSession session,PayVO payVO) {
			int count=0;
			GroupVO selectPartylist = partyService.selectPeoplecntList(vo.getSeq());
			count = payService.selectPeoplecnt(payVO.getSeq());
			MemberVO mv = ms.selectMember(selectPartylist.getUserid());
			model.addAttribute("selectPartylist", selectPartylist);
			model.addAttribute("mv", mv);
			model.addAttribute("seq", vo.getSeq());
			model.addAttribute("PeopleList",count);
			System.out.println(count);
//			while(selectPeoplecnt){
//				
//			}
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
