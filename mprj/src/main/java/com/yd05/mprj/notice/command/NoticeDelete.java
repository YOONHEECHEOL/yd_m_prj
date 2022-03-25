package com.yd05.mprj.notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.notice.service.NoticeService;
import com.yd05.mprj.notice.service.NoticeVO;
import com.yd05.mprj.notice.serviceImpl.NoticeServiceImpl;

public class NoticeDelete implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		String nId = request.getParameter("nid");
		System.out.println(nId);

		NoticeVO vo = new NoticeVO();
		vo.setNId(Integer.parseInt(nId));
		

		NoticeService service = new NoticeServiceImpl();
		service.noticeDelete(vo);


		service = new NoticeServiceImpl();
		List<NoticeVO> list = service.noticeSelectList();

		request.setAttribute("notices", list);
		return "notice/noticeList.tiles";
	}

}
