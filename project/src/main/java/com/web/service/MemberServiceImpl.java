package com.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.MemberDao;
import com.web.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberdao;

  @Override
	public List<MemberVO> doMemberList() {
		return memberdao.doMemberList();
	}
	public boolean isDuplicateId(String id) {
		int count = memberdao.isDuplicateId(id);
		
		
		return count > 0;
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


	@Override
	public int updateClient(MemberVO vo) {
	int result =memberdao.updateClient(vo);
		return result;
	}
	
	public MemberVO selectMember(String id) {
		return memberdao.selectMember(id);
	}

	@Override
	public String[] updateaddr(String id) {
		MemberVO membervo = memberdao.updateaddr(id);
		return membervo.getAddr().split("/");
	}
	
	
	public void updateRole(String email) {
		memberdao.updateRole(email);
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


	// 회원 삭제 
	@Override
	public int memberDelete(String email) {
		int su = memberdao.memberDelete(email);
		
		return su;
	}
		
	
}
