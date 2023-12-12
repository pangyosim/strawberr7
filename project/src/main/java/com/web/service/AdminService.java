package com.web.service;

import java.util.List;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;
import com.web.vo.PayVO;

public interface AdminService {
	// 멤버 목록
	List<MemberVO> getMemberList();
	// 멤버 수정
	void memberUpdate(MemberVO memberVO);
	// 멤버 삭제 
	void memberDelete(MemberVO memberVO);
	
	// 파티 목록
	List<GroupVO> getPartyList();
	// 파티 수정
	void partyUpdate(GroupVO groupVO);
	// 파티 삭제
	void partyDelete(GroupVO groupVO);
	
	// 계좌 목록
	List<PartyMember> getAccountList();
	// 계좌 수정
	void accountUpdate(PartyMember accountVO);
	// 계좌 삭제
	void accountDelete(PartyMember accountVO);
	
	// 결제 목록
	List<PayVO> getPayList();
	// 결제 수정
	void PayUpdate(PayVO payVO);
	// 결제 삭제
	void PayDelete(PayVO payVO);
	
	
	

}
