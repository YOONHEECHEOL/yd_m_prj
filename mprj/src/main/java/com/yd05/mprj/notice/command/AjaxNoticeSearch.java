package com.yd05.mprj.notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yd05.mprj.comm.Command;
import com.yd05.mprj.notice.service.NoticeService;
import com.yd05.mprj.notice.service.NoticeVO;
import com.yd05.mprj.notice.serviceImpl.NoticeServiceImpl;

public class AjaxNoticeSearch implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		System.out.println("key :"+key);
		System.out.println("val:"+val);
		List<NoticeVO> list = noticeDao.noticeSelectSearchList(key, val);
		String data = null;
		try {
		    data = new ObjectMapper().writeValueAsString(list); //json 객체로 변환 한다.
		    System.out.println(data);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:"+ data;
	}

}
