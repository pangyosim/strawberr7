package com.web.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class GroupVO {


	private String seq;			//고유파티넘버
	private String service;		//서비스 종류
	private String title;		//파티제목
	private int peoplecnt;		//파티인원
	private String userid;		//파티장
	private String partyday;			//파티기간
	private int price;			//가입가격
	private Date partydate;			//생성일자
	
	
	
	
	
	
		
		
	
}