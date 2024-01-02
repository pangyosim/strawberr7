package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.web.vo.GroupVO;
import com.web.vo.MemberVO;
import com.web.vo.PayVO;
@Repository
@Mapper
public interface GroupMapper {
	
	public void groupInsert(GroupVO groupVO);
	
	
	//수정
	void groupUpdate(GroupVO groupVo);
	
	//리스트
	List<GroupVO> getGroupList();
	
	//리스트 이미지
	List<GroupVO> selectPeoplecnt();
	
	//방장리스트
	List<GroupVO> MyKingList(String partykingid);
	//리스트테스트
	GroupVO JoinList(int seq);
	
	void partyDelete(String partykingid, int seq);
	void partyAllDelete(String partykingid);
	//더보기검색기능
	List<GroupVO> searchAll(String keyword);

    List<GroupVO> searchByService(String keyword, String service);
	    
}
