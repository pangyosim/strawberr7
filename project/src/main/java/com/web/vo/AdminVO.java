package com.web.vo;

import lombok.Getter;

@Getter
public class AdminVO {

	private static AdminVO instance = null;
	
	private final String[] table = {"member", "partyinfo", "account", "paytable"};

	 public static synchronized AdminVO getInstance() {
	        if (instance == null) {
	            instance = new AdminVO();
	        }
	        return instance;
	    }
	
}