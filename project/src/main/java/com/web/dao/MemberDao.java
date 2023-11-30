package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.web.vo.MemberVO;

@Mapper
@Repository
public interface MemberDao {
	public List<MemberVO> doMemberList();
}
