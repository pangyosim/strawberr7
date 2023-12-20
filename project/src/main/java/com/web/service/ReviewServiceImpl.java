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
import org.springframework.ui.Model;

import com.web.dao.ReviewMapper;
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
//	내용 조회수 
	@Override
	public ReviewVO getReviewByuserId(ReviewVO reviewVO,String reviewid) {
		// TODO Auto-generated method stub
		reviewMapper.updateHit(reviewid);
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
	public List<ReviewVO> getList(int start,int last) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = new ArrayList<>();
		list = reviewMapper.getListWithpaging(start,last);
		System.out.println(list);
		return list;
	}

	@Override
	public int getTotalArticle() {
		// TODO Auto-generated method stub
		int total = reviewMapper.getTotal();
		return total;
	}
	@Override
	public int getTotalArticle2(String keyword) {
		// TODO Auto-generated method stub
		int total = reviewMapper.getTotal2(keyword);
		return total;
	}
	@Override
	public List<ReviewVO> getListForKeyword(int start, int last ,String keyword) {
		// TODO Auto-generated method stub
		List<ReviewVO> list = new ArrayList<>();
		list = reviewMapper.getListWithpaging2(start,last,keyword);
		System.out.println(list);
		return list;
	}
	
	
	
	
	

}