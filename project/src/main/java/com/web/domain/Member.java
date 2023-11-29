package com.web.domain;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Data;

@Data
public class Member {
	
	@Id
	@GeneratedValue
	private String id;
	private String pw;
	private String pwC;
	private String name;
	private String year;
	private String month;
	private String day;
	private String addr_1;
	private String addr_2;
	private String addr_3;
	private String addr_4;
	private String tel;
 	private String email;
	private String domain;

}