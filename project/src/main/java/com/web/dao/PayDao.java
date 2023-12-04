package com.web.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.web.vo.GroupVO;

@Mapper
@Repository
public interface PayDao {
	
	public GroupVO doPartyList(int seq);
}
