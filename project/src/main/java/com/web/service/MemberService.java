package com.web.service;

import java.util.List;


import com.web.vo.MemberVO;

public interface MemberService {

	List<MemberVO> doMemberList();

	int joinMember(MemberVO memberVO);

	MemberVO loginResult(String id, String pw);

	//주소 자르기
	public String[] updateaddr(String id);
	//정보불러오기
	public MemberVO selectMember(String id);
	//수정한데이터 저장
	public int updateClient(MemberVO vo);
	MemberVO kakaologinResult(String kakaoid);
	boolean isDuplicateId(String id);

	int updateMember(MemberVO memberVO);

	int notBirthUpdate(MemberVO memberVO);

	int memberDelete(String email);

	// 파티장 룰 변경
	public void updateRole(String email);
}