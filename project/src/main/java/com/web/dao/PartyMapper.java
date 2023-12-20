package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.service.PayService;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

@Mapper
public interface PartyMapper {
	public void insertbyaccount(PartyMember partyMember);
	
	public List<GroupVO> selectPeoplecnt();
	
	public GroupVO selectPeoplecntList(int seq);
	
	public int updatePartyKing(String partykingid);
	
	//내파티 보기
	public List<GroupVO> Findid(String partykingid);
	//내파티 수정하기
	public int partyUpdate(GroupVO groupVO);
	
	public void accountDelete(String email);
}
