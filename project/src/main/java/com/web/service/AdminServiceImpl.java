package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.AdminMapper;
import com.web.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService{

	@Autowired
	AdminMapper adminMapper;

	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> list = adminMapper.getMemberList();
		return list;

	}
	
	
	
}
