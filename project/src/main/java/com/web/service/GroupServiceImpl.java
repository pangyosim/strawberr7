package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.GroupMapper;
import com.web.vo.GroupVO;

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
	public GroupVO JoinList(int seq) {
		return groupMapper.JoinList(seq);
	}

}
