package com.web.vo;


import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;
import oracle.sql.DATE;

@Data
public class GroupVO {
	private int seq;			//고유파티넘버
	private String service;		//서비스 종류
	private String title;		//파티제목
	private int peoplecnt;		//파티인원
	private String userid;		//파티장
	private int partyday;			//파티기간
	private String price;			//가입가격
	private LocalDateTime partydate;     //생성일자
}
	
