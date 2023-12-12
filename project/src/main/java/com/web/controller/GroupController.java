package com.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.web.service.GroupService;
import com.web.vo.GroupVO;

@Controller
public class GroupController {
	@Autowired
	private GroupService groupService;
	
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
		groupService.groupInsert(groupVo);
		return "/main/index";
	}

}
