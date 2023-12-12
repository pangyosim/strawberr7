package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.PartyMapper;
import com.web.vo.GroupVO;
import com.web.vo.PartyMember;

@Service
public class PartyServiceImpl implements PartyService {
	
	@Autowired
	private PartyMapper partymapper;
	
	@Override
	public void groupjoin(PartyMember partyMember) {
		partymapper.insertbyaccount(partyMember);
	}
	// youtube
	@Override
	public List<GroupVO> selectPeoplecnt() {
		return partymapper.selectPeoplecnt();
	}
	// wacha
	@Override
	public GroupVO selectPeoplecntList(int seq) {
		// TODO Auto-generated method stub
		GroupVO vo = partymapper.selectPeoplecntList(seq);
		return vo;
	}
	
	@Override
	@Transactional
	public void groupInsert(GroupVO groupVo) {
		// TODO Auto-generated method stub
		partymapper.groupInsert(groupVo);
	}
	
	
	 
	
	
	
}
