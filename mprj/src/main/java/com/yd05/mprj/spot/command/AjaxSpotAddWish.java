package com.yd05.mprj.spot.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yd05.mprj.comm.Command;

public class AjaxSpotAddWish implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		Gson gson = new Gson();
		
		
		
		return "ajax:" + "hi";
	}

}
