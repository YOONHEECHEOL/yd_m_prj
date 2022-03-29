package com.yd05.mprj.weather.command;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;

public class WeatherSpot implements Command {

	String page = "1";
	String perPage = "10";
	String pageNo;
	int numOfRows;
	String dataType;
	Date CURRENT_DATE;
	int HOUR;
	int COURSE_ID;
	int DAY;
	String CITY_AREA_ID;
	
	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 관광지 날씨보기 페이지로 이동
		try {
		String apiUrl = "http://apis.data.go.kr/1360000/TourStnInfoService/getTourStnVilageFcst";
//	    홈페이지에서 받은 키
	   String serviceKey = "4wXtQhL4%2Bp3AvqsdfdPwtgkfI1IBCmwwlqXi0EToL8o54WbXOfvGf%2ByPYR15kU%2Fj6qTTDJbgKtZfWlrSaqE0NQ%3D%3D";

	   StringBuilder urlBuilder = new StringBuilder(apiUrl);
	   urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "="+serviceKey);
	   urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); 
	   urlBuilder.append("&" + URLEncoder.encode("perPage","UTF-8") + "=" + URLEncoder.encode(perPage, "UTF-8"));
	   urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
       urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
       urlBuilder.append("&" + URLEncoder.encode("dataType","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*요청자료형식(XML/JSON)*/
       urlBuilder.append("&" + URLEncoder.encode("CURRENT_DATE","UTF-8") + "=" + URLEncoder.encode("2019122010", "UTF-8")); /*2016-12-01 01시부터 조회*/
       urlBuilder.append("&" + URLEncoder.encode("HOUR","UTF-8") + "=" + URLEncoder.encode("24", "UTF-8")); /*CURRENT_DATE부터 24시간 후까지의 자료 호출*/
       urlBuilder.append("&" + URLEncoder.encode("COURSE_ID","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*관광 코스ID*/
       urlBuilder.append("&" + URLEncoder.encode("DAY","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8"));
       urlBuilder.append("&" + URLEncoder.encode("CITY_AREA_ID","UTF-8") + "=" + URLEncoder.encode("5013000000", "UTF-8"));
	  

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
