package com.web.service;

import java.util.List;


import com.web.vo.MemberVO;

public interface MemberService {

	List<MemberVO> doMemberList();

	int joinMember(MemberVO memberVO);

	MemberVO loginResult(String id, String pw);

	//정보불러오기
	public MemberVO updateMember(String id);
	//수정한데이터 저장
	public void updateClient(MemberVO vo);
	MemberVO kakaologinResult(String kakaoid);
	boolean isDuplicateId(String id);
	// 파티장 룰 변경
	public void updateRole(String email);
}