package com.web.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.web.vo.GroupVO;

@Repository
@Mapper
public interface GroupMapper {
	public void groupInsert(GroupVO groupVO);
}
