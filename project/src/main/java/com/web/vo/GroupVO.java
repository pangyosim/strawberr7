package com.web.vo;


import java.util.Date;


import lombok.Data;

@Data
public class GroupVO {
	private int seq;			//고유파티넘버
	private String service;		//서비스 종류
	private String title;		//파티제목
	private int peoplecnt;		//파티인원
	private int peoplecnt_max;	//파티인원최대 
	private String userid;		//공유할ID
	private String userpw;		//공유할PW
	private String partykingid; //파티장ID
	private int partyday;		//파티기간
	private int price;			//가입가격
	private Date partydate;   //생성일자
	private Date enddate;		//끝나는일자
//LocalDateTime
}
	
