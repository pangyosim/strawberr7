package com.web.vo;

import lombok.Data;

@Data
public class PayVO {
	
	private String userid;
	private int price;
	private String paydate;
	private String imp_uid;
	private String merchant_uid;
	private String result;
	private int seq;
}
