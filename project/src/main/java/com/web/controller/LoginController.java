package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
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
	
	// 중복 아이디 방지
	@PostMapping("/idCheck")
	public ResponseEntity<?> idCheck(@RequestParam("loginId") String id) {
	    System.out.println("idCheck 콘솔1번 ");
		boolean isDuplicate = ms.isDuplicateId(id);  // 아이디 중복 확인
	    Map<String, Boolean> response = new HashMap<>();
	    response.put("isDuplicate", isDuplicate);
	    return ResponseEntity.ok(response);  // 결과를 JSON 형식으로 응답합니다.
	}	
	
	@GetMapping("memberJoinForm")
	public String memberJoinForm() {
		System.out.println("GET MEMVERJOINFORM");
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
	// 카카오 로그인
	@GetMapping("/checkUser")
	public String getCheckUser(HttpSession session) {
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    if(memberVO != null && memberVO.getId() != null) {
	    	System.out.println("GET CHECKUSER 1번 ");
	        return "/login/loginResult";
	    } else {
	    	System.out.println("GET CHECKUSER 2번 ");
	        return "/login/memberJoinForm";        
	    }
	}
	
	@PostMapping("/checkUser")
	public String checkUser(@RequestBody Map<String, String> user, HttpSession session) {
		System.out.println("POST CHECKUSER 1번 ");

		String kakaoid = user.get("kakaoid");
	    if(kakaoid != null) {
			System.out.println("POST CHECKUSER 2번 ");

	        MemberVO VO = ms.kakaologinResult(kakaoid);
	        if(VO != null && VO.getKakaoid() != null) {
	    		System.out.println("POST CHECKUSER 3번 ");
	            session.setAttribute("member", VO);
	           
	            return "redirect:checkUser";
	        } else {
	    		System.out.println("POST CHECKUSER 4번 ");
	            session.setAttribute("kakaoid", kakaoid);
	    		return "redirect:/memberJoinForm";
	        }
	    }
		System.out.println("POST CHECKUSER 5번 ");
	    session.setAttribute("kakaoid", kakaoid);
	    return "redirect:register";
	}
	
	
	// 로그인
	@GetMapping("loginResult")
	public String getLoginResult() {
		System.out.println("GET LOGIN");
		return "/login/loginResult";
	}
	
	@PostMapping("loginResult")
	public String loginResult(@RequestParam("userId") String id,
	                          @RequestParam("password") String pw, HttpSession session) {
		System.out.println("POST LOGIN");
		MemberVO memberVO = ms.loginResult(id, pw);
		
	    if(memberVO != null) {
	        session.setAttribute("member", memberVO);
	        return "/login/loginResult";
	    }
	    return "redirect:loginNo";
	}
	
	// 로그인 실패 
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
								@RequestParam("kakaoid") String kakaoid, 
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
		memberVO.setKakaoid(kakaoid);
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
	
	
	
}























