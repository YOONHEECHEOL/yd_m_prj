package com.yd05.mprj.visit.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.visit.service.VisitService;
import com.yd05.mprj.visit.service.VisitServiceImpl;
import com.yd05.mprj.visit.service.VisitVO;

public class VisitList implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		VisitService dao = new VisitServiceImpl();
		VisitVO vo = new VisitVO();
		HttpSession session = request.getSession();
		
		vo.setUId((String)session.getAttribute("id"));
		request.setAttribute("visitList", dao.selectVisit(vo));
		
		return "visit/visitList.tiles";
	}

}
