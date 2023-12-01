package com.web.dao;

import org.apache.ibatis.annotations.Mapper;

import com.web.vo.PartyMember;

@Mapper
public interface PartyMapper {
	public int insertbyacount(PartyMember partyMember);
}
