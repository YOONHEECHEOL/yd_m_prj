package com.yd05.mprj.delicious.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.delicious.service.DeliciousService;
import com.yd05.mprj.delicious.service.DeliciousServiceImpl;
import com.yd05.mprj.delicious.service.DeliciousVO;

public class DeliciousSelect implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 개별건
//		DeliciousService dao = new DeliciousServiceImpl();
//		DeliciousVO vo = new DeliciousVO();
//		vo.setContentid(request.getParameter("contentid"));
//		vo = dao.selectDel(vo);
//		request.setAttribute("deli", vo);
		
		return "delicious/deliciousSelect.tiles";
	}

}
