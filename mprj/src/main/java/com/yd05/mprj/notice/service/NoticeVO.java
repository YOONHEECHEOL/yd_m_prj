package com.yd05.mprj.notice.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	
	
	
		
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date nDate;
	
	private int nId;
	private String nTitle;
	private String nContent;
	private int nHit;
	

}
