package com.web.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.PartyMapper;
import com.web.vo.GroupVO;
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
	@Override
	public String selectPeoplecnt(GroupVO groupVO) {
		// TODO Auto-generated method stub
		return partymapper.selectPeoplecnt(groupVO);
	}
	@Override
	public List<GroupVO> selectPeoplecntList(String userid) {
		// TODO Auto-generated method stub
		List<GroupVO> selectlist = partymapper.selectPeoplecntList(userid);
		return selectlist;
	}
	
	
	
}
