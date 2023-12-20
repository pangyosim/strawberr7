package com.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.ReviewCommentMapper;
import com.web.vo.ReviewCommentVO;

@Service
public class ReviewCommentServiceImpl implements ReviewCommentService{

	  @Autowired
	    private ReviewCommentMapper reviewCommentMapper;

	    @Override
	    public List<ReviewCommentVO> getReviewComments(String reviewid) {
	        return reviewCommentMapper.getReviewComments(reviewid);
	    }

	    @Override
	    public void addReviewComment(ReviewCommentVO comment) {
	    	reviewCommentMapper.addReviewComment(comment);
	    }

	    @Override
	    public void deleteReviewComment(ReviewCommentVO comment) {
	    	reviewCommentMapper.deleteReviewComment(comment);
	    }
	
}