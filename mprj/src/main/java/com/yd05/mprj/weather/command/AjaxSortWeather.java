package com.yd05.mprj.weather.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yd05.mprj.comm.Command;
import com.yd05.mprj.weather.service.WeatherService;
import com.yd05.mprj.weather.service.WeatherVO;
import com.yd05.mprj.weather.serviceImpl.WeatherServiceImpl;

public class AjaxSortWeather implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		WeatherService item = new WeatherServiceImpl();
		String key = request.getParameter("key");
		
		System.out.println(key);

		List<WeatherVO> list = item.weatherSortList(key);
		String data = null;
		try {
		    data = new ObjectMapper().writeValueAsString(list); //json 객체로 변환 한다.
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:"+ data;
	}

}
