package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.PartyMapper;
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
}
