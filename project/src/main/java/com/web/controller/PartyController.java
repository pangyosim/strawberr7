package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.management.relation.Role;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
			httpSession.getAttribute("member.Role");
			return "/main/index";
		}
		return "/createparty/groupJoinForm";
	}

	// 이미지클릭시 해당파티 리스트로 이동
	@GetMapping("youtubePartyList")
	public String youtubeParty(GroupVO groupVO, Model model) {
		model.addAttribute("groupVO", partyService.selectPeoplecnt(groupVO));
		return "/createparty/youtubePartyList";
	}

	@GetMapping("youtubePartyselect")
	public String youtubePartyselect() {
		return "/youtubePartyselect";
	}

//	==================================================================
	@GetMapping("/watchaPartyList")
	public String watchaPartyList(Model model, GroupVO groupVO, HttpSession httpSession) {
		httpSession.getAttribute("member");
		String userid = "";
		List<GroupVO> selectPartylist = partyService.selectPeoplecntList(userid);
		List<GroupVO> send_list = new ArrayList<>();
		System.out.println("selectPartylist : "+selectPartylist);
		for (GroupVO vo : selectPartylist) {
			if (vo.getPeoplecnt() < 4) {
				send_list.add(vo);
			}
		}
		model.addAttribute("selectPartylist", send_list);
		model.addAttribute("selectPartylist", selectPartylist);
		return "/createparty/watchaPartyList";
	}

	@GetMapping("watchaPartyselect")
	public String watchaPartyselect() {
		return "/createparty/watchaPartyselect";
	}

}
