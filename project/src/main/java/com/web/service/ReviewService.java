package com.web.service;

import java.util.List;

import com.web.vo.Criteria;
import com.web.vo.ReviewVO;

public interface ReviewService {
	//리뷰 글
	public List<ReviewVO> reviewList(ReviewVO reviewVO);
	// 리뷰 상세글
	public ReviewVO getReviewByuserId(ReviewVO reviewVO);

	
	public int ReviewInsert(ReviewVO reviewVO);
	
	public void deleteReview(ReviewVO reviewVO);
	
	
	

	public List<ReviewVO> getList(Criteria cri);
}
