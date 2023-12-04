package com.web.service;

import java.util.List;

import com.web.vo.MemberVO;

public interface MemberService {

	List<MemberVO> doMemberList();

	int joinMember(MemberVO memberVO);

	MemberVO loginResult(String id, String pw);

}