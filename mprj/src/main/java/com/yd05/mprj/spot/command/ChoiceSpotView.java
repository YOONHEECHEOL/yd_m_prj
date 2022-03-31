package com.yd05.mprj.spot.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;

public class ChoiceSpotView implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		// 세션 ID 가져오기
		request.setAttribute("id", session.getId());
		// 선택한 숙박소의 정보를 넘겨받는다
		// 넘겨줄 정보를 만들어준다
		request.setAttribute("choiceSpot", request.getParameter("choiceSpot"));
		request.setAttribute("areaCode", request.getParameter("areaCode"));
		request.setAttribute("contentId", request.getParameter("contentId"));
		request.setAttribute("title", request.getParameter("title"));
		request.setAttribute("addr1", request.getParameter("addr1"));
		request.setAttribute("firstImage", request.getParameter("firstImage"));
		
		System.out.println(request.getParameter("choiceSpot"));
		System.out.println(request.getParameter("areaCode"));
		System.out.println(request.getParameter("contentId"));
		System.out.println(request.getParameter("contentTypeId"));
		System.out.println(request.getParameter("title"));
		System.out.println(request.getParameter("addr1"));
		System.out.println(request.getParameter("firstimage"));
		
		return "spot/choiceSpotView.tiles";
	}

}
