package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.service.GroupService;
import com.web.service.PayService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PayVO;



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

  //방장 Creategroup
  MemberVO memberVO = (MemberVO)session.getAttribute("member");
  List<GroupVO> mykinglist = groupService.MyKingList(memberVO.getEmail());
  model.addAttribute("mykinglist",mykinglist);
  //전체 Allgroup
  List<GroupVO> groupList = groupService.getGroupList();
  model.addAttribute("groupList",groupList);
  // 참여 joingroup
  PayVO pv = new PayVO();
  pv.setUserid(memberVO.getEmail());
  List<PayVO> pv_res = ps.getuserpaidparty(pv);
  if(pv_res != null) {
	  List<GroupVO> joinList = new ArrayList<>();
	  for(PayVO pv_get : pv_res) {
		  GroupVO group = groupService.JoinList(pv_get.getSeq());
		  joinList.add(group);
	  }
	  model.addAttribute("joinList",joinList);
  }
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

//더보기파티리스트

	@GetMapping("groupview")
	public String groupview(Model model) {
		List<GroupVO> groupList = groupService.getGroupList();
		model.addAttribute("groupList",groupList);
		return"/createparty/groupview";
	}
	@GetMapping("groupviewhaed")
	public String groupviewhaed(Model model) {
		List<GroupVO> groupList = groupService.getGroupList();
		model.addAttribute("groupList",groupList);
		return"groupview";
	}
	//더보기파티리스트 검색기능
	@PostMapping("/search")
  public String searchGroups(@RequestParam String keyword,@RequestParam String servicesearch, Model model) {
      List<GroupVO> groups;
      
      if ("allSearch".equals(servicesearch)) {
          // 전체 서비스에서 검색
          groups = groupService.searchAll(keyword);
      } else {
          // 특정 서비스에서 검색
          groups = groupService.searchByService(keyword, servicesearch);
      }
      model.addAttribute("groupList", groups);
     return "/createparty/groupview";   		
  }

}






















