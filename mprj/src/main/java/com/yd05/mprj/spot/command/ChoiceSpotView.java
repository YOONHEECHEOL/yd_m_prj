package com.yd05.mprj.spot.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class ChoiceSpotView implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 선택한 숙박소의 정보를 넘겨받는다
		// 넘겨줄 정보를 만들어준다
		request.setAttribute("choiceSpot", request.getParameter("choiceSpot"));
		request.setAttribute("areaCode", request.getParameter("areaCode"));
		request.setAttribute("contentid", request.getParameter("contentid"));
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("addr1", request.getParameter("addr1"));
		request.setAttribute("firstimage", request.getParameter("firstimage"));
		
		System.out.println(request.getParameter("choiceSpot"));
		System.out.println(request.getParameter("areaCode"));
		System.out.println(request.getParameter("contentid"));
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("addr1"));
		System.out.println(request.getParameter("firstimage"));
		
		return "spot/choiceSpotView.tiles";
	}

}
