package com.web.service;

import java.util.List;


import com.web.vo.MemberVO;

public interface MemberService {

	List<MemberVO> doMemberList();

	int joinMember(MemberVO memberVO);

	MemberVO loginResult(String id, String pw);

	//수정한데이터 저장
	public int updateClient(MemberVO vo);
	//주소 자르기
	public String[] updateaddr(String id);
}