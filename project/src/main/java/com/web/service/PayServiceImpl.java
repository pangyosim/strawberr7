package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.PayDao;
import com.web.vo.GroupVO;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayDao paydao;

	@Override
	public GroupVO doPartyList(int seq) {
		return paydao.doPartyList(seq);
	}
	
	
	
}
