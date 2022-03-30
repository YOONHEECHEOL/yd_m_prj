package com.yd05.mprj.weather.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class WeatherDetail implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		
		request.setAttribute("spotAreaId", request.getParameter("spotAreaId"));
		request.setAttribute("courseId", request.getParameter("courseId"));
		
		return "weather/weatherDetail.tiles";
	}

}
