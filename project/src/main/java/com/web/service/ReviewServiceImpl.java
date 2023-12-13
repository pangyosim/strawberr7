package com.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.dao.ReviewMapper;
import com.web.vo.Criteria;
import com.web.vo.MemberVO;
import com.web.vo.ReviewVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewVO> reviewList(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = reviewMapper.reviewList(reviewVO);
		return list;
	}
	
//	페이징

	@Override
	public ReviewVO getReviewByuserId(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		ReviewVO reviewvo = reviewMapper.getReviewByuserId(reviewVO);
		return reviewvo;
	}


	//	uuid 고유하게 식별 가능한 값 = 
	@Override
	public int ReviewInsert(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		UUID uuid = UUID.randomUUID();
		reviewVO.setReviewid(uuid.toString());
		int result = reviewMapper.ReviewInsert(reviewVO);
		return result;
	}


	//삭제
	@Override
	public void deleteReview(ReviewVO reviewVO) {
		// TODO Auto-generated method stub
		reviewMapper.deleteReview(reviewVO);
	}

	//페이징
	@Override
	public List<ReviewVO> getList(Criteria cri) {
		// TODO Auto-generated method stub
		return reviewMapper.getListWithpaging(cri);
	}
	

	
	
	
	

}
