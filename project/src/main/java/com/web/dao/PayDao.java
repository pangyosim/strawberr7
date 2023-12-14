package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PayVO;

@Mapper
@Repository
public interface PayDao {
	
	public GroupVO doPartyList(int seq);
	public MemberVO doMemberList(int session);
	public void insertPayList(PayVO pv);
	public void updatepartyinfo(GroupVO gv);
	
	public int selectPeoplecnt(int seq);
}
