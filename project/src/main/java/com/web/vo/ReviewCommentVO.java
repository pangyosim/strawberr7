package com.web.vo;


import java.sql.Date;

import lombok.Data;

///CREATE TABLE REVIEWCOMMENT (
//		   commentid NUMBER PRIMARY KEY,
//		   reviewid NUMBER NOT NULL,
//		   reviewcomment VARCHAR2(200),
//		   commentdate DATE DEFAULT SYSDATE
//			);
//	    private String adminid; // 댓글을 등록한 사용자의 ID -- 추가 해야됨
@Data
public class ReviewCommentVO {
	private int commentid;
    private String reviewid;
    private String reviewcomment; // 댓글 내용
    private Date commentdate; // 댓글 등록 일자

}