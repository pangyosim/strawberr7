package com.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.GroupMapper;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PartyMember;
import com.web.vo.PayVO;

@Service
public class GroupServiceImpl implements GroupService{
	@Autowired
	private GroupMapper groupMapper;
	
	@Override
	public void groupInsert(GroupVO groupVo) {
		groupMapper.groupInsert(groupVo);
	}

	//파티수정
	@Override
	public void groupUpdate(GroupVO groupVo) {
		groupMapper.groupUpdate(groupVo);
	}
//================================================================
	//파티리스트
	@Override
	public List<GroupVO> getGroupList() {
		return groupMapper.getGroupList();
	}
	//방장리스트
	@Override
	public List<GroupVO> MyKingList(String partykingid) {
		return groupMapper.MyKingList(partykingid);
	}
//	//참여리스트
//	@Override
//	public List<PartyMember> Account(int account) {
//		return groupMapper.Account(account);
//	}
	//리스트테스트
	@Override
	public List<GroupVO> JoinList(int seq) {
		return groupMapper.JoinList(seq);
	}

}
