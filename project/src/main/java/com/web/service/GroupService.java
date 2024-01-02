package com.web.service;

import java.util.List;

import org.springframework.ui.Model;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;
import com.web.vo.PayVO;

public interface GroupService {
  
	public void groupInsert(GroupVO groupVo);
	
	//파티수정
	void groupUpdate(GroupVO groupVo);
	
	//파티리스트
	List<GroupVO> getGroupList();
	//방장리스트
	List<GroupVO> MyKingList(String partykingid);
	//참여리스트
//	List<PartyMember> Account(int account);
//==============================================================
	
//	//리스트테스트
	GroupVO JoinList(int seq);
//	
	void partyDelete(String partykingid, int seq);
	void partyAllDelete(String partykingid);
	//더보기검색기능
	List<GroupVO> searchAll(String keyword);
    List<GroupVO> searchByService(String keyword, String service);
	 
	
}
