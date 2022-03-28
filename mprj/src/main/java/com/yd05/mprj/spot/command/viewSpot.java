package com.yd05.mprj.spot.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class viewSpot implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 관광지 뷰 페이지로 이동
		request.setAttribute("contentId", request.getParameter("contentId"));
		
		return "spot/viewSpot.tiles";
	}

}
