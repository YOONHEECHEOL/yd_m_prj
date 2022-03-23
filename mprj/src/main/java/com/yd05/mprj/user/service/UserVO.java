package com.yd05.mprj.user.service;


public class UserVO {
	private String uId;
	private String uPwd;
	private String uName;
	private String uAuthor;
	
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getuPwd() {
		return uPwd;
	}
	public void setuPwd(String uPwd) {
		this.uPwd = uPwd;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getuAuthor() {
		return uAuthor;
	}
	public void setuAuthor(String uAuthor) {
		this.uAuthor = uAuthor;
	}
	
}
