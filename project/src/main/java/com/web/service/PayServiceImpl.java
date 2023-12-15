package com.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.PayDao;
import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PayVO;

@Service
public class PayServiceImpl implements PayService {
	
	@Autowired
	PayDao paydao;

	@Override
	public GroupVO doPartyList(int seq) {
		return paydao.doPartyList(seq);
	}

	@Override
	public MemberVO doMemberList(int session) {
		return paydao.doMemberList(session);
	}

	@Override
	public void insertPayList(PayVO pv) {
		paydao.insertPayList(pv);
	}

	@Override
	public void updatepartyinfo(GroupVO gv) {
		paydao.updatepartyinfo(gv);
	}

	@Override
	public int selectPeoplecnt(int seq) {
		// TODO Auto-generated method stub
		return paydao.selectPeoplecnt(seq);
	}

	@Override
	public PayVO getuserpaidparty(PayVO pv) {
		return paydao.getuserpaidparty(pv);
	}
	
	
	
	
}
