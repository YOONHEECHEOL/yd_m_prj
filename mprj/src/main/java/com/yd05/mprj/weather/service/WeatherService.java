package com.yd05.mprj.weather.service;

import java.util.List;

public interface WeatherService {
	
	List<WeatherVO> weatherSelectSearchList(String key, String val); //검색할 항목, 검색할 내용
	List<WeatherVO> weatherSortList(String key);
}
