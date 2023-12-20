package com.web.vo;


import java.sql.Date;
import java.time.LocalDateTime;

import lombok.Data;

//CREATE TABLE REVIEW(
//REVIEWID VARCHAR2(20),-- 리뷰에 대한 아이디 고유값
//USERID VARCHAR2(20), -- 유저정보 획득용아이디
//TITLE VARCHAR2(30), -- 리뷰 제목
//CONTENT VARCHAR2(200), --내용
//hit NUMBER DEFAULT 0,-- 조회수
//WRITEDATE DATE DEFAULT SYSDATE
//);
@Data
public class ReviewVO {	
	private int seq;
	private String reviewid;
	private String userid;
	private String nickname;
	private String title;
	private String content;
	private int hit;
	private Date writedate;
}