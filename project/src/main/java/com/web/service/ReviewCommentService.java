package com.web.service;

import java.util.List;

import com.web.vo.ReviewCommentVO;

public interface ReviewCommentService {
	
	List<ReviewCommentVO> getReviewComments(String reviewid);

	void addReviewComment(ReviewCommentVO comment);

	void deleteReviewComment(ReviewCommentVO comment);
}