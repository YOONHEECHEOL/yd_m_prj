package com.yd05.mprj.delicious.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class DeliciousSelect implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		String ctId = request.getParameter("contentTypeId");
		
		if(ctId == "12") {
			// 관광지			
			request.setAttribute("contentId", request.getParameter("contentId"));			
			
			return "viewSpot.do";
		} else if(ctId == "32") {
			// 숙박
			return null;
		} else {
			// 음식집
			request.setAttribute("DeliCtid", request.getParameter("contentTypeId"));
			request.setAttribute("DeliCid", request.getParameter("contentId"));
			request.setAttribute("DeliMapx", request.getParameter("mapx"));
			request.setAttribute("DeliMapy", request.getParameter("mapy"));
			
			return "delicious/deliciousSelect.tiles";
		}
		
//		System.out.println(request.getParameter("mapx"));
//		System.out.println(request.getParameter("mapy"));
		
	}

}
