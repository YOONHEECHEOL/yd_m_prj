package com.yd05.mprj.myCourse.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MyCourseVO {
	private long mcId;
	private String uId;
	private String tsId;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date mcDate;
	
	private String mcTitle;
	private String mcDescription;
	private String sumImg;
	
	public long getMcId() {
		return mcId;
	}
	public void setMcId(long mcId) {
		this.mcId = mcId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getTsId() {
		return tsId;
	}
	public void setTsId(String tsId) {
		this.tsId = tsId;
	}
	public Date getMcDate() {
		return mcDate;
	}
	public void setMcDate(Date mcDate) {
		this.mcDate = mcDate;
	}
	public String getMcTitle() {
		return mcTitle;
	}
	public void setMcTitle(String mcTitle) {
		this.mcTitle = mcTitle;
	}
	public String getMcDescription() {
		return mcDescription;
	}
	public void setMcDescription(String mcDescription) {
		this.mcDescription = mcDescription;
	}
	public String getSumImg() {
		return sumImg;
	}
	public void setSumImg(String sumImg) {
		this.sumImg = sumImg;
	}
	
}
