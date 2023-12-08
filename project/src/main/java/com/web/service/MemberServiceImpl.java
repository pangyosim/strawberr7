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

	// 회원가입
	@Override
	public int joinMember(MemberVO memberVO) {
		int su = memberdao.joinMember(memberVO);
		return su;
	}

	@Override
	public MemberVO loginResult(String id, String pw) {
		return memberdao.loginResult(id, pw);
	}


	@Override
	public int updateClient(MemberVO vo) {
	int result =memberdao.updateClient(vo);
		return result;
	}

	@Override
	public String[] updateaddr(String id) {
		MemberVO membervo = memberdao.updateaddr(id);
		return membervo.getAddr().split("/");
	}
	
	
}