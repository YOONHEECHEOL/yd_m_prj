package com.yd05.mprj.category.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class Accom implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 숙박정보 조회
		return "category/accom.tiles";
	}

}
