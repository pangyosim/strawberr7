package com.web.vo;

import lombok.Data;

@Data
public class MemberVO {
	
	private int seq;
	private String id;
	private String kakaoid;
	private String pw;
	private String name;
	private String nickname;
	private String role;
	private String tel;
	private String addr;
	private String birth;
	private String email;
	private String tier;
}
