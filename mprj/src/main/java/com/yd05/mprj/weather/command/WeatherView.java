package com.yd05.mprj.weather.command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.weather.service.WeatherVO;

public class WeatherView implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		ArrayList<WeatherVO> item = new ArrayList<>();
		WeatherVO vo = new WeatherVO();
		vo.setSpotname(request.getParameter("Spotname"));
		request.setAttribute("weathers", vo);
		
		return "weather/weatherView.tiles";
	}

}
