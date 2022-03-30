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

public class AjaxWeatherSearch implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		WeatherService WeatherDao = new WeatherServiceImpl();
		String key = request.getParameter("key");
		String val = request.getParameter("val");
		System.out.println("key :"+key);
		System.out.println("val:"+val);
		List<WeatherVO> list = WeatherDao.weatherSelectSearchList(key, val);
		String data = null;
		try {
		    data = new ObjectMapper().writeValueAsString(list); //json 객체로 변환 한다.
		    System.out.println(data);
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		return "ajax:"+ data;
	}

}
