package com.yd05.mprj.visit.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.visit.service.VisitService;
import com.yd05.mprj.visit.service.VisitServiceImpl;
import com.yd05.mprj.visit.service.VisitVO;

public class VisitDelete implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		VisitService dao = new VisitServiceImpl();
		VisitVO vo = new VisitVO();
		
		vo.setContentId(request.getParameter("contentId"));
		
		int n =dao.deleteVisit(vo);
		
		if(n != 0) {
			request.setAttribute("message", "삭제가 완료되었습니다.");
			return "visit/deleteMessage.tiles";
		} else {
			request.setAttribute("message", "잠시 후 다시 시도해 주세요.");
			return "visit/deleteMessage.tiles";
		}
	}

}
