package com.yd05.mprj.weather.command;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class WeatherSpot2 implements Command {

	String page = "1";
	String perPage = "10";
	
	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 관광지 날씨보기 페이지로 이동
		try {
		String apiUrl = "https://api.odcloud.kr/api/15007097/v1/uddi:e1cdb81d-44d4-40c1-a8d8-f1b311129a54";
//	    홈페이지에서 받은 키
	   String serviceKey = "4wXtQhL4%2Bp3AvqsdfdPwtgkfI1IBCmwwlqXi0EToL8o54WbXOfvGf%2ByPYR15kU%2Fj6qTTDJbgKtZfWlrSaqE0NQ%3D%3D";

	   StringBuilder urlBuilder = new StringBuilder(apiUrl);
	   urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey);
	   urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); 
	   urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode(perPage, "UTF-8")); 
	  

	   /*
	    * GET방식으로 전송해서 파라미터 받아오기
	    */
	   URL url = new URL(urlBuilder.toString());

	   HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	   conn.setRequestMethod("GET");
	   conn.setRequestProperty("Content-type", "application/json");
	   System.out.println("Response code: " + conn.getResponseCode());
	   
	   BufferedReader rd;
	   if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	       rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	   } else {
	       rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	   }
	   
	   StringBuilder sb = new StringBuilder();
	   String line;
	   while ((line = rd.readLine()) != null) {
	       sb.append(line);
	   }
	   
	   rd.close();
	   conn.disconnect();
	   String result= sb.toString();
	   request.setAttribute("weather", result);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "weather/weatherSpot.tiles";
	}

}
