package com.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.service.ReviewService;
import com.web.vo.ReviewVO;

@Controller
@SessionAttributes("member")
public class ReviewController {
//	페이징 처리 

//	
	@Autowired
	private ReviewService reviewService;

	@GetMapping("/reviewForm")
	public String ReviewForm(Model model, ReviewVO reviewVO, int page) {
		// 조회수
		int article = 10; // 한페이지 글 목록수
		int currentPage = page; // 현재 페이지 넘버
		int start = (currentPage - 1) * article + 1; // 글 번호
		int last = start + article - 1; // 마지막 글번호
		List<ReviewVO> list = new ArrayList<>();
		list = reviewService.getList(start, last);

		// 페이징
		int totalArticle = reviewService.getTotalArticle(); // 전체 글수
		int totalPage = (totalArticle - 1) / article + 1; // 전체 페이지 수

		int block = 4; // 페이지 블록
		int startPage = (currentPage - 1) / block * block + 1;
		int endPage = startPage + block - 1; // 끝
		if (endPage > totalPage)
			endPage = totalPage;
		System.out.println(list);
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
		return "/review/reviewContent";
	}

	@GetMapping("reviewInsert")
	public String reviewInsert() {
		return "/review/reviewInsert";
	}

	@PostMapping("reviewInsertContent")
	public String reviewInsertContent(ReviewVO reviewVO, RedirectAttributes ra) {
		reviewService.ReviewInsert(reviewVO);
		ra.addAttribute("page", 1);
		return "redirect:reviewForm";
	}

	@RequestMapping("deleteReview")
	public String deleteReview(ReviewVO reviewVO, RedirectAttributes ra) {
		ra.addAttribute("page", 1);
		reviewService.deleteReview(reviewVO);
		return "redirect:reviewForm";
	}
}
