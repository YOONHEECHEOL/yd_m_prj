package com.yd05.mprj.weather.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class WeatherSpot2 implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		//response.setHeader('Access-Control-Allow-origin', 'https://localhost.com:8000');
		return "weather/weatherSpot.tiles";
	}

}
