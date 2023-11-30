package com.web.vo;

public class MemberVO {
	
	private String id;
	private String pwd;
	private String name;
	private String role;
	public MemberVO(String id, String pwd, String name, String role) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.role = role;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
}
