package com.yd05.mprj.delicious.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class DeliciousSelect implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 개별건
		request.setAttribute("DeliCtid", request.getParameter("contentTypeSel"));
		request.setAttribute("DeliCid", request.getParameter("contentId"));
		
		System.out.println("1"+request.getParameter("contentTypeSel")+".");
		System.out.println("2"+request.getParameter("contentId")+".");
		
		return "delicious/deliciousSelect.tiles";
	}

}
