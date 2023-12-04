package com.web.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.vo.GroupVO;
import com.web.vo.PartyMember;

@Mapper
public interface PartyMapper {
	public int insertbyacount(PartyMember partyMember);
	
	public String selectPeoplecnt(GroupVO groupVO);
	
	public List<GroupVO> selectPeoplecntList(String userid);
	
	
}
