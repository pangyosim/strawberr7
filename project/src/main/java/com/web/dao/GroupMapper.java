package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PaytableVO;
@Repository
@Mapper
public interface GroupMapper {
	
	public void groupInsert(GroupVO groupVO);
	
//	public String selectPeoplecnt(GroupVO groupVO);
	
	//수정
	void groupUpdate(GroupVO groupVo);
	
	//리스트
	List<GroupVO> getGroupList();
	
	//리스트 이미지
	List<GroupVO> selectPeoplecnt();
	
	//방장리스트
	List<GroupVO> MyKingList(String userId);
	//참여리스트
//	GroupVO agetGroup(int seq,String userid);
	//리스트테스트
	List<GroupVO> JoinList(int seq,String userid);
	
}
