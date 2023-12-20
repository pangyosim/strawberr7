package com.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.service.ReviewCommentService;
import com.web.service.ReviewService;
import com.web.vo.ReviewCommentVO;
import com.web.vo.ReviewVO;

@Controller
public class ReviewCommentController {
	@Autowired
	private ReviewCommentService reviewCommentService;
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping("/insertComment")
	public String insertComment(Model model,ReviewCommentVO reCommentVO, RedirectAttributes ra) {
		reviewCommentService.addReviewComment(reCommentVO);
		ra.addAttribute("reviewid",reCommentVO.getReviewid());
		System.out.println("ghkra");
		return "redirect:reviewContent";
	}
	 @PostMapping("/deleteComment")
     public String deleteComment(ReviewCommentVO reCommentVO,Model model, ReviewVO reviewVO,String reviewid) {
         reviewCommentService.deleteReviewComment(reCommentVO);
         model.addAttribute("reviewContent", reviewService.getReviewByuserId(reviewVO,reviewid));
         model.addAttribute("reviewco", reviewCommentService.getReviewComments(reviewVO.getReviewid()));
         return "/review/reviewContent";
	 }
	 
}