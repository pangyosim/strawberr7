package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

@Mapper
public interface PartyMapper {
	public int insertbyacount(PartyMember partyMember);
	
	public List<GroupVO> selectPeoplecnt(GroupVO groupVO);
	
	public GroupVO selectPeoplecntList(int seq);
	
	public void groupInsert(GroupVO groupVO);
	
	public int updatePartyKing(String id);
	
	//내파티 보기
	public List<GroupVO> Findid(String userid);
	//내파티 수정하기
	public int partyUpdate(GroupVO groupVO);
}