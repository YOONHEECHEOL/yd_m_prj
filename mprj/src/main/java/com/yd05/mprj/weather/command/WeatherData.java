package com.yd05.mprj.weather.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class WeatherData implements Command {
	
		@Override
		public String excute(HttpServletRequest request, HttpServletResponse response) {
			
			return "weather/weatherSpot.tiles";
		}

	}


