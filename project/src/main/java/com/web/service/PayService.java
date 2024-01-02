package com.web.service;

import java.util.List;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PayVO;

public interface PayService {

	GroupVO doPartyList(int seq);
	MemberVO doMemberList(int session);
	void insertPayList(PayVO pv);
	void updatepartyinfo(GroupVO gv);
	int selectPeoplecnt(int seq);
	List<PayVO> getuserpaidparty(PayVO pv);
}