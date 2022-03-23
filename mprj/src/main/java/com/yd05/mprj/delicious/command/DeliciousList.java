package com.yd05.mprj.delicious.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class DeliciousList implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 맛집 목록
		
		return "delicious/deliciousList.tiles";
	}

}
