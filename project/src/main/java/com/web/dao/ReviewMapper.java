package com.web.dao;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	//리뷰 리스트 모두 불러오기
	public List<ReviewVO> reviewList(ReviewVO reviewVO);
	
	public ReviewVO getReviewByuserId(ReviewVO reviewVO);
	
	public int ReviewInsert(ReviewVO reviewVO);
	
	public void deleteReview(ReviewVO reviewVO);
	
	//페이징
	
	public int getTotal();
	
	public int getTotal2(String keyword);
	/* 게시판 검색 */
	
	
	
	//유튜브 페이징
	public List<ReviewVO> getListWithpaging(int start,int last);

	public List<ReviewVO> getListWithpaging2(int start,int last,String keyword);
	
	public void updateHit(String reviewid);
	

}
