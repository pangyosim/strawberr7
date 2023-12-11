package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.AdminMapper;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper adminMapper;
	
	// 멤버 목록
	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> list = adminMapper.getMemberList();
		return list;
	}
	
	// 멤버 수정 
	@Override
	public void memberUpdate(MemberVO memberVO) {
		adminMapper.memberUpdate(memberVO);
	}

	// 멤버 삭제
	@Override
	public void memberDelete(MemberVO memberVO) {
		adminMapper.memberDelete(memberVO);
	}

	
	// 파티 목록
	@Override
	public List<GroupVO> getPartyList() {
		List<GroupVO> list = adminMapper.getPartyList();
		return list;	
	}
	
	//파티 수정
	@Override
	public void partyUpdate(GroupVO groupVO) {
		adminMapper.partyUpdate(groupVO);

	}
	// 파티 삭제
	@Override
	public void partyDelete(GroupVO groupVO) {
		adminMapper.partyDelete(groupVO);

	}

	//계좌 목록
	@Override
	public List<PartyMember> getAccountList() {
		List<PartyMember> list = adminMapper.getAccountList();
		return list;
	}
	
	// 계좌 수정
	@Override
	public void accountUpdate(PartyMember accountVO) {
		adminMapper.accountUpdate(accountVO);

	}
	// 계좌 삭제
	@Override
	public void accountDelete(PartyMember accountVO) {
		adminMapper.accountDelete(accountVO);

	}
	
	
	
	
	
	
	
}
