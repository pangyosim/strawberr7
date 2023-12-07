package com.web.service;

import java.util.List;

import com.web.vo.MemberVO;

public interface MemberService {

	List<MemberVO> doMemberList();

	int joinMember(MemberVO memberVO);

	MemberVO loginResult(String id, String pw);

	MemberVO kakaologinResult(String kakaoid);

	boolean isDuplicateId(String id);

}