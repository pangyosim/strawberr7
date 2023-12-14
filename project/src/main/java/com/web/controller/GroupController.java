package com.web.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.service.GroupService;
import com.web.service.PayService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;



@SessionAttributes({"member","paytable"})
@Controller
public class GroupController {
@Autowired
private GroupService groupService;
@Autowired
private PayService ps;

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
  return "redirect:/";
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
@GetMapping("KingModify")
public String KingModify() {
  return "/creatparty/KingModify";
}
//=======================================================================
//마이페이지내정보보기
@GetMapping("getmypage")
public String getmypage(Model model,HttpSession session,
            @ModelAttribute("member") MemberVO memberVo) {

//	//참여 joingroup
//	PartyMember partymember = (PartyMember)session.getAttribute("accout");
//	if(partymember !=null) {
//	List<PartyMember> account = groupService.Account(partymember.getSeq());
//	model.addAttribute("joinlist",account);	
//	}
  //방장 Creategroup
  MemberVO memberVO = (MemberVO)session.getAttribute("member");
  System.out.println(memberVO);
  List<GroupVO> mykinglist = groupService.MyKingList(memberVO.getEmail());
  model.addAttribute("mykinglist",mykinglist);
  //전체 Allgroup
  List<GroupVO> groupList = groupService.getGroupList();
  model.addAttribute("groupList",groupList);
  return "/createparty/getmypage";
}
//방장리스트
@GetMapping("MyKingList")
public String MyKingList(Model model, HttpSession session) {
  MemberVO memberVO = (MemberVO)session.getAttribute("member");

  List<GroupVO> mykinglist = groupService.MyKingList(memberVO.getId());
  model.addAttribute("mykinglist",mykinglist);
  return "/createparty/MyKingList";
}
//	System.out.println(memberVO.toString());
//	System.out.println(memberVO.getId());
//	return "0";




//=======================================================================
//테스트리스트
//리스트 이미지

@GetMapping("listtest")
public String listtest(Model model,HttpSession session,
            @Param("pseq")Integer pseq,@Param("userid") String userid){
  //전체 Allgroup
  List<GroupVO> groupList = groupService.getGroupList();
  model.addAttribute("groupList",groupList);
//		
//		//참여파티 불러오기
  MemberVO memberVO = (MemberVO)session.getAttribute("member");
  int seq = memberVO.getSeq();
  String id = memberVO.getId();
  model.addAttribute("joinlist", groupService.JoinList(seq,id));


  return"/createparty/listtest";
}


//	@Autowired
//	private GroupService groupService;
//	
//	@GetMapping("groupJoinForm")
//	public String groupJoinView() {
//		return "/createparty/groupJoinForm";
//	}
//
//	// 동의폼
//	@GetMapping("groupRegistrationForm")
//	public String groupRegistrationView() {
//		return "/createparty/groupRegistrationForm";
//	}
//
//	// 파티만들기폼
//	@GetMapping("groupInsert")
//	public String groupInsert() {
//		return "/createparty/groupInsert";
//	}
//
//	// 파티만들기 등록
//	@PostMapping("groupOk")
//	public String groupInsertpost(GroupVO groupVo) {
//		groupService.groupInsert(groupVo);
//		return "/main/index";
//	}

}






















