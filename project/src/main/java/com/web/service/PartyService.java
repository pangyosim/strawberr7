package com.web.service;

import java.util.List;

import com.web.vo.GroupVO;
import com.web.vo.PartyMember;

public interface PartyService {

	public int groupjoin(PartyMember partyMember);

	public List<GroupVO> selectPeoplecnt(GroupVO groupVO);

	public GroupVO selectPeoplecntList(int seq);

	public void groupInsert(GroupVO groupVo);

	
}