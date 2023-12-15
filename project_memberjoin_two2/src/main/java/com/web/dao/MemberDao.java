package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.web.vo.MemberVO;

@Mapper
@Repository
public interface MemberDao {
	public List<MemberVO> doMemberList();
	
	// 회원가입
	public int joinMember(MemberVO memberVO);
	
	// 로그인 
	public MemberVO loginResult(String id, String pw);
  
	//회원수정
	public MemberVO selectMember(String id);

	public int updateClient(MemberVO vo);

	// 카카오로그인 
	public MemberVO kakaologinResult(String kakaoid);

	// 중복여부 
	public int isDuplicateId(String id);

	String searchId(@Param("name")String name, @Param("tel")String tel);

	public void updatePassword(String pw, String email);
	
	
	
	// 회원 수정 
	public int updateMember(MemberVO memberVO);

	public int notBirthUpdate(MemberVO memberVO);

	public int memberDelete(String email);
	
	public void updateRole(String email);

	public MemberVO updateaddr(String id);
}
