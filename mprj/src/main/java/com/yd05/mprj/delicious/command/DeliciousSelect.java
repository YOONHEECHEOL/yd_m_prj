package com.yd05.mprj.delicious.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class DeliciousSelect implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 개별건
		request.setAttribute("DeliCtid", request.getParameter("contentTypeId"));
		request.setAttribute("DeliCid", request.getParameter("contentId"));
		request.setAttribute("DeliMapx", request.getParameter("mapx"));
		request.setAttribute("DeliMapy", request.getParameter("mapy"));
		request.setAttribute("DeliMlevel", request.getParameter("mlevel"));
		
//		System.out.println(request.getParameter("mapx"));
//		System.out.println(request.getParameter("mapy"));
		
		return "delicious/deliciousSelect.tiles";
	}

}
