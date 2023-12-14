package com.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.service.MailService;
import com.web.service.MemberService;
import com.web.service.PartyService;
import com.web.session.MemberSession;
import com.web.vo.MemberVO;


@Controller
public class LoginController implements MemberSession{
	@Autowired
	private MailService ma;
	
	@Autowired
	private MemberService ms;
	
	@Autowired
	private PartyService ps;
	
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
		for (MemberVO vo : list) {
			System.out.println("ID : " + vo.getId() + ", NAME : " + vo.getName() + ", ROLE : " + vo.getRole());

		}
		return "forward:/";
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
	
	//----------------------------------------------------------------

	// 카카오 로그인
	@GetMapping("/checkUser")
	public String getCheckUser(HttpSession session) {
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    if(memberVO != null && memberVO.getId() != null) {
	        session.setAttribute("party", ps.selectPeoplecnt());
	        return "forward:/";
	    } else {
	        return "/login/memberJoinForm";        
	    }
	}
	
	@PostMapping("/checkUser")
	public String checkUser(@RequestBody Map<String, String> user, HttpSession session) {

		String kakaoid = user.get("kakaoid");
	    if(kakaoid != null) {

	        MemberVO VO = ms.kakaologinResult(kakaoid);
	        if(VO != null && VO.getKakaoid() != null) {
	            session.setAttribute("member", VO);
	            return "redirect:checkUser";
	        } else {
	            session.setAttribute("kakaoid", kakaoid);
	    		return "redirect:/memberJoinForm";
	        }
	    }
	    session.setAttribute("kakaoid", kakaoid);
	    return "redirect:register";
	}
	
	//----------------------------------------------------------------

	// 로그인
	@PostMapping("loginResult")
	public String loginResult(@RequestParam("userId") String id,
	                          @RequestParam("password") String pw, HttpSession session) {
		System.out.println("POST LOGIN");
		MemberVO memberVO = ms.loginResult(id, pw);
		
	    if(memberVO != null) {
	        session.setAttribute("member", memberVO);
	       //System.out.println(memberVO.getRole()); // 회원등급 확인
	        if(memberVO.getRole().equals("ADMIN")) {
	        	return "/main/admin";
	        }
          return "redirect:/";
	    }
	    return "/login/loginForm";
	}
	//----------------------------------------------------------------
	
	// 로그인 실패 
	@GetMapping("loginNo")
	public String loginNo() {
		return "/login/login";
	}

	// 로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "forward:/";
	}

	// 회원가입
	@PostMapping("memberJoinResult")
	public String memberJoinResult(@RequestParam("loginId") String id, 
								@RequestParam("kakaoid") String kakaoid, 
			   					 @RequestParam("loginPw") String pw, 
			   					 @RequestParam("loginPwConfirm") String pwC, 
			   					 @RequestParam("name") String name,
			   					 @RequestParam(value = "birth-year", required = false) String year, 
			   					 @RequestParam(value = "birth-month", required = false) String month, 
			   					 @RequestParam(value = "birth-day", required = false) String day, 
			   					 @RequestParam("address_1") String addr_1, 
			   					 @RequestParam("address_2") String addr_2, 
			   					 @RequestParam("address_3") String addr_3, 
			   					 @RequestParam("address_4") String addr_4, 
			   					 @RequestParam("tel") String tel, 
			   					 @RequestParam("mail") String email,
			   					 @RequestParam("domain") String domain,
			   					 RedirectAttributes ra) {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		if (pw.equals(pwC)) {
			memberVO.setPw(pw);
		} else {
			System.out.println("에러");
			return "register";
		}
		memberVO.setKakaoid(kakaoid);
		memberVO.setName(name);
		Random r = new Random();
		memberVO.setNickname(name + (r.nextInt(99999)));
		if(year == null || month == null || day == null) {	
		}
		memberVO.setBirth(year+"-"+ month +"-" + day);;
		memberVO.setAddr(addr_1 + "/" + addr_2 + "/" + addr_3 + "/" + addr_4);
		memberVO.setTel(tel);
		memberVO.setEmail(email + "@" + domain);
		int su = ms.joinMember(memberVO);
		System.out.println(su + "회원가입");
		if (su == 1) {
			ra.addFlashAttribute("nickname", memberVO.getNickname());
			return "redirect:memberSuccess";
		}
		return "register";
	}
	@GetMapping("memberSuccess")
	public String memberSuccess() {
		return "/login/memberSuccess";
	}

	// 정보불러오기
	@GetMapping("memberUpdate")
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
	
	// 아이디 비밀번호 찾기
	@GetMapping("userSearch")
	public String userSearch() {
		return "/login/userSearch";
	}
	
	@RequestMapping(value = "/login/userSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("name") String name,
								@RequestParam("tel") String tel) {
		
		String result = ms.searchId(name, tel);
		
		return result;
	}

	@PostMapping("changePwResult")
	public String changePwResult(@RequestParam("changePw") String pw, 
								@RequestParam("umail")String email,
								Model model) {
		ms.updatePassword(pw,email);
        model.addAttribute("successMessage", "비밀번호가 성공적으로 변경되었습니다.");
        return "/login/loginForm";
	}
	

	// 회원수정
	@GetMapping("memberUpdateForm")
	public String memberModifyView() {
	
		return "/login/memberUpdateForm";
	}
	
	@PostMapping("memberUpdateResult")
	public String memberUpdateResult(@RequestParam("loginId") String id, 
				@RequestParam("kakaoid") String kakaoid, 
				 @RequestParam("loginPw") String pw, 
				 @RequestParam("loginPwConfirm") String pwC, 
				 @RequestParam("nickname") String nickname,
				 @RequestParam(value = "birth-year", required = false) String year, 
				 @RequestParam(value = "birth-month", required = false) String month, 
				 @RequestParam(value = "birth-day", required = false) String day,  
				 @RequestParam("address_1") String addr_1, 
				 @RequestParam("address_2") String addr_2, 
				 @RequestParam("address_3") String addr_3, 
				 @RequestParam("address_4") String addr_4, 
				 @RequestParam("tel") String tel, 
				 @RequestParam("email") String email,
				 HttpSession session
				) {
		
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		if(pw.equals(pwC)) {
			memberVO.setPw(pw);			
		} else {
			System.out.println("수정 비번 에러");
			return "memberUpdateForm";
		} 		
		memberVO.setKakaoid(kakaoid);
		memberVO.setNickname(nickname);		
		memberVO.setAddr(addr_1 + "/" + addr_2 + "/" + addr_3 + "/" + addr_4);
		memberVO.setTel(tel);
		memberVO.setEmail(email);
		memberVO.setBirth(year+"-"+ month +"-" + day);;
		int su = 0;
		System.out.println(memberVO.toString());

		if(memberVO.getBirth().matches("(.*)null(.*)")) {
			su = ms.notBirthUpdate(memberVO);
			if(su == 1) {
				session.invalidate();
				return "/login/memberUpdateResult";	
			}
			return "redirect:memberUpdateNo";
		}  
		System.out.println(memberVO.toString());
		su = ms.updateMember(memberVO);
		System.out.println(su + "회원수정");
		if(su == 1) {
			session.invalidate();
			return "/login/memberUpdateResult";			
		}
		
		return "redirect:memberUpdateNo";
	}
	
	@GetMapping("memberUpdateNo")
	public String memberUpdateNo() {
		return "/login/memberUpdateNo";
	}
	
	// 회원 탈퇴 
	@GetMapping("memberDelete")
	public String memberDelete(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    MemberVO memberVO = (MemberVO) session.getAttribute("member");
	    String email = memberVO.getEmail();
	    int su = ms.memberDelete(email);
	    
	    session.invalidate();  // 세션 종료
	    return "redirect:/";
	}
	

}
