package com.web.vo;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

@Getter
@Builder
@ToString
public class Top {
	private String image;
	private String subject;
	private String url;
}
