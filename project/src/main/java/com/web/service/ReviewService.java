package com.web.service;

import java.util.List;

import org.springframework.ui.Model;

import com.web.vo.ReviewVO;

public interface ReviewService {
	// 리뷰 글
	public List<ReviewVO> reviewList(ReviewVO reviewVO);

	// 리뷰 상세글
	public ReviewVO getReviewByuserId(ReviewVO reviewVO,String reviewid);

	public int ReviewInsert(ReviewVO reviewVO);

	public void deleteReview(ReviewVO reviewVO);

	public int getTotalArticle();
	public int getTotalArticle2(String keyword);

	public List<ReviewVO> getList(int start, int last);
	
	public List<ReviewVO> getListForKeyword(int start, int last,String keyword);
	
}
