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

public class AjaxSortNotice implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		String key = request.getParameter("key");
		
		System.out.println(key);

		List<NoticeVO> list = noticeDao.noticeSortList(key);
		String data = null;
		try {
		    data = new ObjectMapper().writeValueAsString(list); //json 객체로 변환 한다.
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:"+ data;
	}

}
