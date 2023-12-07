package com.web.vo;


<<<<<<< HEAD
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;

@Data
public class GroupVO {
	private int seq;			//고유파티넘버
	private String service;		//서비스 종류
	private String title;		//파티제목
	private int peoplecnt;		//파티인원
	private String userid;		//파티장
	private int partyday;			//파티기간
	private int price;			//가입가격
	private String partydate;     //생성일자
//LocalDateTime
}
	
=======
import java.util.Date;

import lombok.Data;

@Data
public class GroupVO {


	private int seq;			//고유파티넘버
	private String service;		//서비스 종류
	private String title;		//파티제목
	private int peoplecnt;		//파티인원
	private String userid;		//파티장
	private int partyday;			//파티기간
	private int price;			//가입가격
	private Date partydate;			//생성일자
	
	
	
	
	
	
		
		
	
}
>>>>>>> refs/remotes/origin/spg9468-pay
