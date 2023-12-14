package com.web.dao;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import com.web.vo.Criteria;
import com.web.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	//리뷰 리스트 모두 불러오기
	public List<ReviewVO> reviewList(ReviewVO reviewVO);
	
	public ReviewVO getReviewByuserId(ReviewVO reviewVO);
	
	public int ReviewInsert(ReviewVO reviewVO);
	
	public void deleteReview(ReviewVO reviewVO);
	
	//페이징
	
	/* 게시판 총 개수 */
	
	
	//유튜브 페이징
	public List<ReviewVO> getListWithpaging(Criteria cri);
}
