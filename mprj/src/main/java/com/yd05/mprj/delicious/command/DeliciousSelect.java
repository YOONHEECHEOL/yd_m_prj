package com.yd05.mprj.delicious.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class DeliciousSelect implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 맛집 개별 화면
		
		return "delicious/deliciousSelect.tiles";
	}

}
