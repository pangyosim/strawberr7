package com.web.service;

import java.util.List;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

public interface PartyService {

	public int groupjoin(PartyMember partyMember);

	public List<GroupVO> selectPeoplecnt(GroupVO groupVO);

	public GroupVO selectPeoplecntList(int seq);

	public void groupInsert(GroupVO groupVo);

	public int updatePartyKing(String id);
	
	// 유저가 만든 파티 정보 가져오기
	public List<GroupVO> es(String userid);
	// 유저정보 업데이트 수정
	public int partyUpdate(GroupVO groupVO);
	
}