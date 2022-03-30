package com.yd05.mprj.mcComment.service;

import com.fasterxml.jackson.annotation.JsonFormat;

public class McCommentVO {
	private Long commId;
	private String uId;
	private String mcId;
	private String commComment;
	
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private String comRegDate;
	
	public Long getCommId() {
		return commId;
	}
	public void setCommId(Long commId) {
		this.commId = commId;
	}
	public String getuId() {
		return uId;
	}
	public void setuId(String uId) {
		this.uId = uId;
	}
	public String getMcId() {
		return mcId;
	}
	public void setMcId(String mcId) {
		this.mcId = mcId;
	}
	public String getCommComment() {
		return commComment;
	}
	public void setCommComment(String commComment) {
		this.commComment = commComment;
	}
	public String getComRegDate() {
		return comRegDate;
	}
	public void setComRegDate(String comRegDate) {
		this.comRegDate = comRegDate;
	}
	
	
}
