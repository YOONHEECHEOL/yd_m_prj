package com.yd05.mprj.recomm.service;

public class RecommVO {
	private long rId;
	private String uId;
	private String cId;
	private long rCnt;
	
	public long getrId() {
		return rId;
	}
	public void setrId(long rId) {
		this.rId = rId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getcId() {
		return cId;
	}
	public void setcId(String cId) {
		this.cId = cId;
	}
	public long getrCnt() {
		return rCnt;
	}
	public void setrCnt(long rCnt) {
		this.rCnt = rCnt;
	}
	
	
}
