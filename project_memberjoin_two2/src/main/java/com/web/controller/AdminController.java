package com.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.AdminService;
import com.web.vo.AdminVO;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;
import com.web.vo.PayVO;

import oracle.net.aso.m;

@RestController
public class AdminController {
		
	
	@Autowired
	private AdminService adminService;
	

	
	
	
	//~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

	
	//멤버 리스트 
	@GetMapping("admin/memberInfo")
	public List<MemberVO> getMemberInfo(@RequestParam("page") int page) {
		int pageCount = 5; // 페이지당 출력수		
		int pageStart = (page - 1) * pageCount + 1;
		int pageLast = page * pageCount;
		List<MemberVO> list = adminService.getMemberList(pageStart, pageLast); 
		return list;			
	}
	
	// 멤버 수정
	@PostMapping("adminUpdate")
	public void adminUpdate(@RequestBody MemberVO memberVO) {
		System.out.println(memberVO);
		adminService.memberUpdate(memberVO);
	}
	// 멤버 삭제
	@DeleteMapping("adminDelete")
	public void adminDelete(@RequestBody MemberVO memberVO) {
		adminService.memberDelete(memberVO);
	}
	
	//~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

	
	// 파티 리스트 
	@GetMapping("admin/partyInfo")
	public List<GroupVO> getPartyInfo(@RequestParam("page") int page) {
		int pageCount = 5; // 페이지당 출력수		
		int pageStart = (page - 1) * pageCount + 1;
		int pageLast = page * pageCount;
		List<GroupVO> list = adminService.getPartyList(pageStart, pageLast);
		return list;			
	}	
	// 파티 수정
	@PostMapping("adminPartyUpdate")
	public void adminPartyUpdate(@RequestBody GroupVO groupVO) {
		System.out.println(groupVO);
		adminService.partyUpdate(groupVO);
	}
	// 파티 삭제
	@DeleteMapping("adminPartyDelete")
	public void adminPartyDelete(@RequestBody GroupVO groupVO) {
		System.out.println(groupVO);

		adminService.partyDelete(groupVO);
	}
		
	//~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

		
	// 계좌 리스트 
	@GetMapping("admin/accountInfo")
	public List<PartyMember> getAccountInfo(@RequestParam("page") int page) {
		int pageCount = 5; // 페이지당 출력수		
		int pageStart = (page - 1) * pageCount + 1;
		int pageLast = page * pageCount;
		List<PartyMember> list = adminService.getAccountList(pageStart, pageLast);
		return list;			
	}	
	// 계좌 수정
	@PostMapping("adminAccountUpdate")
	public void adminAccountUpdate(@RequestBody PartyMember accountVO) {
		System.out.println(accountVO);
		adminService.accountUpdate(accountVO);
	}
	// 계좌 삭제
	@DeleteMapping("adminAccountDelete")
	public void adminAccountDelete(@RequestBody PartyMember accountVO) {
		System.out.println(accountVO);
		adminService.accountDelete(accountVO);
	}
		
	//~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

	
	// 결제 리스트 
	@GetMapping("admin/payInfo")
	public List<PayVO> getPayInfo(@RequestParam("page") int page) {
		int pageCount = 5; // 페이지당 출력수		
		int pageStart = (page - 1) * pageCount + 1;
		int pageLast = page * pageCount;
		List<PayVO> list = adminService.getPayList(pageStart, pageLast);
		return list;			
	}	
	// 결제 수정
	@PostMapping("adminPayUpdate")
	public void adminPayUpdate(@RequestBody PayVO payVO) {
		System.out.println(payVO);
		adminService.PayUpdate(payVO);
	}
	// 결제 삭제
	@DeleteMapping("adminPayDelete")
	public void adminPayDelete(@RequestBody PayVO payVO) {
		System.out.println(payVO);
		adminService.PayDelete(payVO);
	}
		
	//~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-

	// 데이터 수
	@GetMapping("admin/tableCount")
	public int getDataCount(@RequestParam("page") int page
			,@RequestParam("table") int table
			) {
		
		AdminVO vo = AdminVO.getInstance();		
		int count = adminService.getCountTable(vo.getTable()[table]); //int count 테이블 데이터 수
		
		
		if(page*5 >= count)
			return 0;
		
		return 9999999;
	}
	
	//~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-~-
		
}