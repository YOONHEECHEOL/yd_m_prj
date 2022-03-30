package com.yd05.mprj.weather.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface WeatherMapper {
	List<WeatherVO> weatherSelectSearchList(@Param("key") String key, @Param("val") String val);; //검색할 항목, 검색할 내용
	List<WeatherVO> weatherSortList(String key);
}
