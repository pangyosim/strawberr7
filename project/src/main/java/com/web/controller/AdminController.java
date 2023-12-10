package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.web.service.AdminService;
import com.web.vo.MemberVO;

@RestController
public class AdminController {

	private static final String role = "ADMIN";
	
	@Autowired
	private AdminService adminService;
	
	
	//멤버 리스트 
	@GetMapping("admin/memberInfo")
	public List<MemberVO> getMemberInfo() {
		System.out.println("GET 멤버 리스트 ");
		List<MemberVO> list = adminService.getMemberList();
		return list;			
	}
	
		
		
		
		
		
		
		
		
}
