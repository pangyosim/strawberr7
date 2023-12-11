package com.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.MemberDao;
import com.web.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberdao;
	
	@Autowired
	private MailService ma;

	@Autowired
	private SqlSessionTemplate sqlSession;
	
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
	public MemberVO updateMember(String id) {
		// TODO Auto-generated method stub
		return memberdao.updateMember(id);
	}

	@Override
	public void updateClient(MemberVO vo) {
		memberdao.updateClient(vo);
	}
	
	
	// 카카오 로그인 
	@Override
	public MemberVO kakaologinResult(String kakaoid) {
		System.out.println("Test");
		return memberdao.kakaologinResult(kakaoid);
	}
	
	// 아이디 찾기
	@Override
	public String searchId(String name, String tel) {
		
		memberdao =sqlSession.getMapper(MemberDao.class);
		
		String result = "";
		
		try {
			result = memberdao.searchId(name, tel);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
