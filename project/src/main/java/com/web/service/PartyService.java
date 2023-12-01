package com.web.service;

import org.apache.ibatis.annotations.Param;

import com.web.vo.PartyMember;

public interface PartyService {

	public int groupjoin(PartyMember partyMember);

}