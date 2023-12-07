package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.MemberDao;
import com.web.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberdao;
	
	// 중복여부
	@Override
	public boolean isDuplicateId(String id) {
		int count = memberdao.isDuplicateId(id);
		
		
		return count > 0;
	}


	@Override
	public List<MemberVO> doMemberList(){
		return memberdao.doMemberList();
	}
	

	// 회원가입
	@Override
	public int joinMember(MemberVO memberVO) {
		int su = memberdao.joinMember(memberVO);
		return su;
	}
	// 로그인 
	@Override
	public MemberVO loginResult(String id, String pw) {
		
		return memberdao.loginResult(id, pw);
	}
	
	// 카카오 로그인 
	@Override
	public MemberVO kakaologinResult(String kakaoid) {
		System.out.println("Test");
		return memberdao.kakaologinResult(kakaoid);
	}

	// 회원 수정
	@Override
	public int updateMember(MemberVO memberVO) {
		int su = memberdao.updateMember(memberVO);
		return su;
	}


	@Override
	public int notBirthUpdate(MemberVO memberVO) {
		int su = memberdao.notBirthUpdate(memberVO);
		return su;
	}
		
	
}
