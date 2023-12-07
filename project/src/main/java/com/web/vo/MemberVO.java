package com.web.vo;

import lombok.Data;

/*
seq 		NUMBER 			NOT NULL,     -- 회원고유번호
<<<<<<< HEAD
id      	VARCHAR2(30)   	NOT NULL,  -- 회원ID
kakaoid		VARCHAR2(30)				-- 카카오ID
pw    		VARCHAR2(100)   NOT NULL,     -- 회원pw
name  		VARCHAR2(10)    NOT NULL,     -- 회원이름
nickname 	VARCHAR2(30) 	NOT NULL,     -- 닉네임
role    	VARCHAR2(50) 	NOT NULL,     -- 회원권한(user, party, admin) 기본 user
tel     	VARCHAR2(13) 	NOT NULL,     -- 휴대폰번호
addr    	VARCHAR2(50) 	PRIMARY KEY,     -- 회원주소
=======
id      	VARCHAR2(30)   	PRIMARY KEY,  -- 회원ID
pw    		VARCHAR2(100)   NOT NULL,     -- 회원pw
name  		VARCHAR2(10)    NOT NULL,     -- 회원이름
nickname 	VARCHAR2(30) 	NOT NULL,     -- 닉네임
role    	VARCHAR2(50) 	NOT NULL,     -- 회원권한(user, party, admin) 기본 user
tel     	VARCHAR2(13) 	NOT NULL,     -- 휴대폰번호
addr    	VARCHAR2(50) 	NOT NULL,     -- 회원주소
>>>>>>> refs/remotes/origin/spg9468-pay
birth   	VARCHAR2(50) 	NOT NULL,     -- 회원생일
email   	VARCHAR2(50) 	NOT NULL,     -- 이메일
tier    	VARCHAR2(30) 	NOT NULL      -- 회원등급(5 ~ 1) 기본:5
*/

@Data
public class MemberVO {
	
	private int seq;
	private String id;
<<<<<<< HEAD
	private String kakaoid;
=======
	private int kakaoid;
>>>>>>> refs/remotes/origin/spg9468-pay
	private String pw;
	private String name;
	private String nickname;
	private String role;
	private String tel;
	private String addr;
	private String birth;
	private String email;
	private String tier;
<<<<<<< HEAD
}
=======
}
>>>>>>> refs/remotes/origin/spg9468-pay
