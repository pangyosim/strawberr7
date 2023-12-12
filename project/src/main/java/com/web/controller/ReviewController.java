package com.web.controller;

import java.util.ArrayList;

import org.apache.ibatis.javassist.tools.rmi.Sample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.web.service.ReviewService;
import com.web.service.ReviewServiceImpl;
import com.web.vo.Criteria;
import com.web.vo.PageDTO;
import com.web.vo.ReviewVO;

@Controller
@SessionAttributes("member")
public class ReviewController {
//	페이징 처리 

//	
	@Autowired
	private ReviewService reviewService;

	// 리뷰 리스트
//	@GetMapping("reviewForm")
//	public String ReviewForm(Model model, ReviewVO reviewVO) {
//		model.addAttribute("list", reviewService.reviewList(reviewVO));
//		return "/review/reviewForm";
//	}
//	
	@GetMapping("/reviewForm")
	public String ReviewForm(Model model, ReviewVO reviewVO ,Criteria cri) {
//		model.addAttribute("list", reviewService.reviewList(reviewVO));
		
		model.addAttribute("list",reviewService.getList(cri));
		model.addAttribute("pageMaker",new PageDTO(cri,20));
		System.out.println("cri " + cri);
		return "/review/reviewForm";
	}

	// 리뷰 상세내용 ===하나는 되는데 2개는 못찾음 정보를 못가지고 온다 /
	@GetMapping("reviewContent")
	public String reviewContent(Model model,ReviewVO reviewVO) {
//		System.out.println(reviewVO.getReviewid());
		System.out.println(reviewVO);
		System.out.println(reviewService.getReviewByuserId(reviewVO));
		 model.addAttribute("reviewContent",reviewService.getReviewByuserId(reviewVO)) ;
		return "/review/reviewContent";
	}

	@GetMapping("reviewInsert")
	public String reviewInsert() {
		return "/review/reviewInsert";
	}

	@PostMapping("reviewInsertContent")
	public String reviewInsertContent(ReviewVO reviewVO) {
		reviewService.ReviewInsert(reviewVO);
//		System.out.println(reviewVO);
		return "redirect:reviewForm";
	}
	@RequestMapping("deleteReview")
	public String deleteReview(ReviewVO reviewVO) {
		System.out.println(reviewVO);
		
		reviewService.deleteReview(reviewVO); 
		return "redirect:reviewForm";
	}
}
