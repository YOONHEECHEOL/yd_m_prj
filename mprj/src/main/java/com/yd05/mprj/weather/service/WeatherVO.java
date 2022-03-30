package com.yd05.mprj.weather.service;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter

public class WeatherVO {
	
	String spotname;
	String sky;
	Long wd;
	Long ws;
	Long pop;

}
