package com.web.service;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;

public interface PayService {

	GroupVO doPartyList(int seq);
	MemberVO doMemberList(int session);
}