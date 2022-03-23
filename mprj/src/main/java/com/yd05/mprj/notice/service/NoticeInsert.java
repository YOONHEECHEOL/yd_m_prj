package com.yd05.mprj.notice.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeInsert implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		
		vo.setNDate(Date.valueOf(request.getParameter("nDate")));
		vo.setNTitle(request.getParameter("nTitle"));
		vo.setNContent(request.getParameter("nContent"));
		
		int n  = noticeDao.noticeInsert(vo);
		if(n != 0 ) {
			return "noticeList.do";
		}else {
			request.setAttribute("message", "게시글 등록이 실패하였습니다.");
			return "notice/noticeError";
		}
	}

}
