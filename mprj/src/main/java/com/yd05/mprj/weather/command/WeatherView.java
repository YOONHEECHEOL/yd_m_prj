package com.yd05.mprj.weather.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.weather.service.WeatherService;
import com.yd05.mprj.weather.serviceImpl.WeatherServiceImpl;

public class WeatherView implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		WeatherService item = new WeatherServiceImpl();
		WeatherVO vo = new WeatherVO();
		return null;
	}

}
