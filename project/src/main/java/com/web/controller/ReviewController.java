package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.dao.ReviewMapper;
import com.web.service.MemberService;
import com.web.service.ReviewCommentService;
import com.web.service.ReviewService;
import com.web.vo.ReviewCommentVO;
import com.web.vo.ReviewVO;

@Controller
@SessionAttributes("member")
public class ReviewController {
//	페이징 처리 

//	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ReviewCommentService reviewCommentService;
	
	@GetMapping("/reviewForm")
	public String ReviewForm(Model model, ReviewVO reviewVO, int page, String keyword) {
		
		// 조회수
		int article = 5; // 한페이지 글 목록수
		int currentPage = page; // 현재 페이지 넘버
		int start = (currentPage - 1) * article + 1; // 글 번호
		int last = start + article - 1; // 마지막 글번호
		int totalArticle = 0; // 전체 글수
		List<ReviewVO> list = new ArrayList<>();
		// 게시판 검색
		if(keyword==null) {
			// 키워드가 없을때
			list = reviewService.getList(start, last);	
			totalArticle = reviewService.getTotalArticle();
		} else {
			// 검색 했을때
			list = reviewService.getListForKeyword(start,last,keyword);
			totalArticle = reviewService.getTotalArticle2(keyword);
		}
		
		// 페이징
		int totalPage = (totalArticle - 1) / article + 1; // 전체 페이지 수

		int block = 4; // 페이지 블록
		int startPage = (currentPage - 1) / block * block + 1;
		int endPage = startPage + block - 1; // 끝
		if (endPage > totalPage)
			endPage = totalPage;
		model.addAttribute("memberlist",memberService.doMemberList());
		model.addAttribute("page", page);
		model.addAttribute("list", list);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("block", block);
		return "/review/reviewForm";
	}

	// 리뷰 상세내용
	@GetMapping("reviewContent")
	public String reviewContent(Model model, ReviewVO reviewVO,String reviewid) {
		model.addAttribute("reviewContent", reviewService.getReviewByuserId(reviewVO,reviewid));
		model.addAttribute("reviewco", reviewCommentService.getReviewComments(reviewVO.getReviewid()));
		return "/review/reviewContent";
	}
	// 리뷰 글등록
	@GetMapping("reviewInsert")
	public String reviewInsert(RedirectAttributes ra) {
		ra.addAttribute("page", 1);
		return "/review/reviewInsert";
	}
	//작성정보 뷰 페이지
	@PostMapping("reviewInsertContent")
	public String reviewInsertContent(ReviewVO reviewVO, RedirectAttributes ra) {
		reviewService.ReviewInsert(reviewVO);
		ra.addAttribute("page", 1);
		return "redirect:reviewForm";
	}
	// 리뷰 삭제
	@RequestMapping("deleteReview")
	public String deleteReview(ReviewVO reviewVO, RedirectAttributes ra) {
		ra.addAttribute("page", 1);
		reviewService.deleteReview(reviewVO);
		return "redirect:reviewForm";
	}
	
	
}