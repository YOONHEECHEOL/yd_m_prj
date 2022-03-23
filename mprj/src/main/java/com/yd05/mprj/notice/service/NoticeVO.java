package com.yd05.mprj.notice.service;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class NoticeVO {
	private int nId;
	private String nTitle;
	private String nContent;
			
	@JsonFormat(pattern = "yyyy-MM-dd", timezone="Asia/Seoul")
	private Date nDate;
	
	private int nHit;
	

}
