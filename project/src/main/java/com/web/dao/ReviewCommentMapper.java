package com.web.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.web.vo.ReviewCommentVO;

@Mapper
public interface ReviewCommentMapper {
	List<ReviewCommentVO> getReviewComments(String reviewid);

	void addReviewComment(ReviewCommentVO comment);

	void deleteReviewComment(ReviewCommentVO comment);
}