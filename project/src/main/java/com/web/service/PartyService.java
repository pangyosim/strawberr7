package com.web.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.web.vo.GroupVO;
import com.web.vo.PartyMember;

public interface PartyService {

	public int groupjoin(PartyMember partyMember);
	
	public String selectPeoplecnt(GroupVO groupVO);
	
	public List<GroupVO> selectPeoplecntList(String userid);
	
	
}