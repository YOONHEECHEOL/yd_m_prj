package com.yd05.mprj.weather.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class WeatherSpot implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 관광지 날씨보기 페이지로 이동
		return "weather/weatherSpot.tiles";
	}

}
