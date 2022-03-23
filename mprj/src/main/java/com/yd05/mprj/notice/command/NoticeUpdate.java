package com.yd05.mprj.notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.notice.service.NoticeService;
import com.yd05.mprj.notice.service.NoticeVO;
import com.yd05.mprj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeUpdate implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		String NTitle = request.getParameter("nTitle");
		String nContent = request.getParameter("nContent");
		String NId = request.getParameter("NId");
		
		NoticeVO vo = new NoticeVO();
		vo.setNTitle(NTitle);
		vo.setNContent(nContent);
		vo.setNId(Integer.parseInt(NId));
		
		NoticeService service = new NoticeServiceImpl();
		service.noticeUpdate(vo);
		
		service = new NoticeServiceImpl();
		List<NoticeVO> list = service.noticeSelectList();
		
		request.setAttribute("list", list);
		
		return "notice/noticeUpdate.tiles";
	}

}
