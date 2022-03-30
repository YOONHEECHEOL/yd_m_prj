package com.yd05.mprj.weather.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yd05.mprj.comm.DataSource;
import com.yd05.mprj.weather.service.WeatherMapper;
import com.yd05.mprj.weather.service.WeatherService;
import com.yd05.mprj.weather.service.WeatherVO;

public class WeatherServiceImpl implements WeatherService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private WeatherMapper map = sqlSession.getMapper(WeatherMapper.class);

	

	@Override
	public List<WeatherVO> weatherSelectSearchList(String key, String val) {
		// TODO Auto-generated method stub
		return map.weatherSelectSearchList(key, val);
	}

	@Override
	public List<WeatherVO> weatherSortList(String key) {
		// TODO Auto-generated method stub
		return map.weatherSortList(key);
	}

}
