package com.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.PartyMapper;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;

@Service
public class PartyServiceImpl implements PartyService{
	
	@Autowired
	private PartyMapper partymapper;
	
	
	@Override
	public int groupjoin(PartyMember partyMember) {
		int result= partymapper.insertbyacount(partyMember);
		return result;
	}
	// youtube
	@Override
	public List<GroupVO> selectPeoplecnt(GroupVO groupVO) {
		// TODO Auto-generated method stub
		List<GroupVO> selectPeoplecnt = partymapper.selectPeoplecnt(groupVO);
		return selectPeoplecnt;
	}
	// wacha
	@Override
	public GroupVO selectPeoplecntList(int seq) {
		// TODO Auto-generated method stub
		GroupVO vo = partymapper.selectPeoplecntList(seq);
		return vo;
	}

	@Override
	public int updatePartyKing(String id) {
		// TODO Auto-generated method stub
		
		int result = partymapper.updatePartyKing(id);
		return result;
	}
	//내파티 보기
	@Override
	public List<GroupVO> es(String userid) {
		// TODO Auto-generated method stub
		List<GroupVO> list = partymapper.Findid(userid);
		return list;
	}
	//내파티 수정하기
	@Override
	public int partyUpdate(GroupVO groupVO) {
		// TODO Auto-generated method stub
		int result = partymapper.partyUpdate(groupVO);
		return result;
	}
	
	 
	
	
	
}
