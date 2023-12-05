package com.web.service;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PayVO;

public interface PayService {

	GroupVO doPartyList(int seq);
	MemberVO doMemberList(int session);
	void insertPayList(PayVO pv);
}