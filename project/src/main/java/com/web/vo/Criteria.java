package com.web.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	 
	private int pageNum;
	private int amount;
	
	public Criteria() {
		this(1, 10); //생성자에서 pageNum=1, amount=10으로 설정
	}
	
	// 기본 생성자 설정
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}

	  
}	
