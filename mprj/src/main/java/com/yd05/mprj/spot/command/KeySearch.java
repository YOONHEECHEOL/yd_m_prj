package com.yd05.mprj.spot.command;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class KeySearch implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("contentTypeId", request.getParameter("contentTypeId"));
		request.setAttribute("cat1", request.getParameter("cat1"));
		request.setAttribute("cat2", request.getParameter("cat2"));
		request.setAttribute("cat3", request.getParameter("cat3"));
		request.setAttribute("keyword", request.getParameter("keyword"));
		
		response.setContentType("text/html; charset=utf-8");
		
		return "spot/keySearch.tiles";
	}

}
