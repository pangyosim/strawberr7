package com.web.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.service.GroupService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;

@SessionAttributes("member")
@Controller
public class GroupController {
	
	@Autowired
	private GroupService groupService;
	
	@GetMapping("groupJoinForm")
	public String groupJoinView() {
		return "/createparty/groupJoinForm";
	}
	//=======================================================================
	//파티만들기폼
	@GetMapping("groupInsert")
	public String groupInsert() {
		return "/createparty/groupInsert";
	}
	//파티만들기 등록
	@PostMapping("groupOk")
	public String groupInsertpost(GroupVO groupVo) {
		groupService.groupInsert(groupVo);
	
//		String vv;
//		vv=groupVo.getPartydate();
//		System.out.println(vv);
		return "/main/index";
	}
	//=======================================================================
	//파티리스트
	//mygrouplist
	@GetMapping("mygrouplist")
	public String myGrouplist(Model model) {
		List<GroupVO> groupList = groupService.getGroupList();
		model.addAttribute("groupList",groupList);
		return "/createparty/mygrouplist";
	}
	//=======================================================================
	//파티폼 수정하기
	
	@GetMapping("groupModify")
	public String groupModifys() {
		return "/createparty/groupModify";
	}
	@PostMapping("groupUpdate")
	public String groupUpdate(GroupVO groupVo,MemberVO memberVo) {
		groupService.groupUpdate(groupVo);
		return "forward:index";
	}
	//=======================================================================
	//마이페이지내정보보기
	@GetMapping("getmypage")
	public String getmypage(Model model,
							@ModelAttribute("member") MemberVO memberVo) {
		List<GroupVO> groupList = groupService.getGroupList();
		model.addAttribute("groupList",groupList);
		
		
		return "/createparty/getmypage";
	}
	//=======================================================================
}
