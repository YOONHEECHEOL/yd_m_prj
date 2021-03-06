package com.yd05.mprj.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.notice.service.NoticeService;
import com.yd05.mprj.notice.service.NoticeVO;
import com.yd05.mprj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeView implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		vo.setNId(Integer.parseInt(request.getParameter("nId")));
		request.setAttribute("notice", noticeDao.noticeSelect(vo));
		noticeDao.noticeUpdateHit(vo.getNId()); // 조회수 증가
		return "notice/noticeView.tiles";
	}

}
