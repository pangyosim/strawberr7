package com.web.service;

import java.util.List;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

public interface PartyService {

	public void groupjoin(PartyMember partyMember);

	public List<GroupVO> selectPeoplecnt();

	public GroupVO selectPeoplecntList(int seq);

	public int updatePartyKing(String partykingid);
	
	// 유저가 만든 파티 정보 가져오기
	public List<GroupVO> myparty(String partykingid);
	// 유저정보 업데이트 수정
	public int partyUpdate(GroupVO groupVO);
	
	public void accountDelete(String email);
}