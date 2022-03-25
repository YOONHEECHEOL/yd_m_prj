package com.yd05.mprj.spot.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class NextRecSpot implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		return "spot/nextRecSpot.tiles";
	}

}
