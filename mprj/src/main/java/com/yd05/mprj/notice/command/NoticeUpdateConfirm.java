package com.yd05.mprj.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.notice.service.NoticeService;
import com.yd05.mprj.notice.service.NoticeVO;
import com.yd05.mprj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeUpdateConfirm implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String NTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		String NId = request.getParameter("nid");
		System.out.println(NId);
		
		NoticeVO vo = new NoticeVO();
		vo.setNTitle(NTitle);
		vo.setNContent(nContent);
		vo.setNId(Integer.parseInt(NId));
		
		NoticeService service = new NoticeServiceImpl();
		service.noticeUpdate(vo);	
		
		NoticeService noticeDao = new NoticeServiceImpl();
		NoticeVO updatedVo = new NoticeVO();
		updatedVo.setNId(Integer.parseInt(NId));
		request.setAttribute("notice", noticeDao.noticeSelect(updatedVo));
		
		return "notice/noticeView.tiles";
	}

}
