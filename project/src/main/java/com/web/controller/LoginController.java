package com.web.controller;

import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.domain.Member;
import com.web.service.MemberService;
import com.web.vo.MemberVO;

import oracle.net.aso.m;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService ms;
	
	@GetMapping("login")
	public String login() {
		return "/login/loginForm";
	}
	
	@GetMapping("register")
	public String register() {
		return "/login/memberJoinForm";
	}
	@GetMapping("service")
	public String service() {
		List<MemberVO> list = ms.doMemberList();
		for(MemberVO vo : list) {
			System.out.println("ID : " + vo.getId() + ", NAME : " + vo.getName() + ", ROLE : " + vo.getRole() );
			
		}
		return "/main/index";
	}
	
	// 로그인 						
	@PostMapping("loginResult")
	public String loginResult(@RequestParam("userId") String id,
	                          @RequestParam("password") String pw, HttpSession session) {
	    MemberVO memberVO = ms.loginResult(id, pw);

	    if(memberVO != null) {
	        session.setAttribute("member", memberVO);
	        return "/login/loginResult";
	    }
	    return "redirect:loginNo";
	}
	
	@GetMapping("loginNo")
	public String loginNo() {
		return "/login/loginNo";
	}
	
	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/main/index";
	}
	
	// 회원가입
	@PostMapping("memberJoinResult")
	public String memberJoinResult(@RequestParam("loginId") String id, 
			   					 @RequestParam("loginPw") String pw, 
			   					 @RequestParam("loginPwConfirm") String pwC, 
			   					 @RequestParam("name") String name,
			   					 @RequestParam("birth-year") String year, 
			   					 @RequestParam("birth-month") String month, 
			   					 @RequestParam("birth-day") String day, 
			   					 @RequestParam("address_1") String addr_1, 
			   					 @RequestParam("address_2") String addr_2, 
			   					 @RequestParam("address_3") String addr_3, 
			   					 @RequestParam("address_4") String addr_4, 
			   					 @RequestParam("tel") String tel, 
			   					 @RequestParam("email") String email,
			   					 @RequestParam("domain") String domain,
			   					 RedirectAttributes ra) {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		if(pw.equals(pwC)) {
			memberVO.setPw(pw);			
		} else {
			System.out.println("에러");
			return "register";
		}
		memberVO.setName(name);
		Random r = new Random();
		memberVO.setNickname(name + (r.nextInt(99999)));
		memberVO.setBirth(year+"-"+ month +"-" + day);;
		memberVO.setAddr(addr_1 + "/" + addr_2 + "/" + addr_3 + "/" + addr_4);
		memberVO.setTel(tel);
		memberVO.setEmail(email + "@" + domain);	
		int su = ms.joinMember(memberVO);
		System.out.println(su + "회원가입");
		if(su == 1) {
			ra.addFlashAttribute("nickname", memberVO.getNickname());
			return "redirect:memberSuccess";					
		}
		return "register";
	}
	
	@GetMapping("memberSuccess")
	public String memberSuccess() {
		return "/login/memberSuccess";
	}
	//정보불러오기
	@GetMapping("memberUpdate")
	public String memberModify(Model model) {
//		MemberVO membervo = (MemberVO) httpSession.getAttribute("member");
		model.addAttribute("member", ms.updateMember("jsk7640@naver.com"));
		return "/login/memberUpdate";
	}
	//수정한데이터 저장
	@PostMapping("updateClient")
	public void updateClient(MemberVO vo) {
//		System.out.println(memberVO.toString());
		ms.updateClient(vo);
		System.out.println(vo.toString());
//		ra.addAttribute("member", ms.updateMember("qwe"));		
//		System.out.println(ms.updateMember("qwe"));
	}
	@PostMapping("resultUpdate")
	public String slakf() {
		return "/login/resultUpdate";
	}
	
}























