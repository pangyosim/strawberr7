package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.dao.GroupMapper;
import com.web.vo.GroupVO;
@Service
public class GroupServiceImpl implements GroupService{
	@Autowired
	private GroupMapper groupMapper;
	   
//	@Override
//	@Transactional
//	public void groupInsert(GroupVO groupVo) {
//		// TODO Auto-generated method stub
//		groupMapper.groupInsert(groupVo);
//	}

}
