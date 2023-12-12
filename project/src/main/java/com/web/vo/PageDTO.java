package com.web.vo;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class PageDTO {
	private int startPage, endPage;
	private boolean prev,next;
	
	private int total;
	private Criteria cri;
	public PageDTO(Criteria cri,int total) {
		this.cri = cri;
		this.total = total;
		//끝
		this.endPage =(int) (Math.ceil(cri.getPageNum()/10.0)) * 10;
		//시작
		this.startPage = endPage - 9;
		
		// 진자 endPage
		 
		this.prev = this.startPage > 1;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getAmount()) ); 
		
		this.endPage = realEnd <= endPage? realEnd : endPage;
		
		this.next = this.endPage < realEnd;
	}
	
}
