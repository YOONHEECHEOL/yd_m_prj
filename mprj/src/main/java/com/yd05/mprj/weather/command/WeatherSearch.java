package com.yd05.mprj.weather.command;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.weather.service.WeatherVO;

public class WeatherSearch implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			String apiUrl = "http://apis.data.go.kr/1360000/TourStnInfoService/getTourStnVilageFcst";
//	    홈페이지에서 받은 키
			String serviceKey = "4wXtQhL4%2Bp3AvqsdfdPwtgkfI1IBCmwwlqXi0EToL8o54WbXOfvGf%2ByPYR15kU%2Fj6qTTDJbgKtZfWlrSaqE0NQ%3D%3D";
		
			StringBuilder urlBuilder = new StringBuilder(apiUrl);
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + serviceKey);
			
		URL url = new URL(urlBuilder.toString());

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());

		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
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
		String result = sb.toString();

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject) jsonParser.parse(result);
		JSONObject firstObj = (JSONObject) jsonObj.get("response");
		JSONObject thirdObj = (JSONObject) firstObj.get("body");
		JSONObject fourthObj = (JSONObject) thirdObj.get("items");
		JSONArray jsonArray = (JSONArray) fourthObj.get("item");

		ArrayList<WeatherVO> item = new ArrayList<>();

		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject getObj = (JSONObject) jsonArray.get(i);

			WeatherVO vo = new WeatherVO();
			vo.setSpotname((String) getObj.get("spotName"));
			vo.setSky(getWeatherName(getObj.get("sky")));
			vo.setWd((Long) getObj.get("wd"));
			vo.setWs((Long) getObj.get("ws"));
			vo.setPop((Long) getObj.get("pop"));

			item.add(vo);

		}

		request.setAttribute("weather", item);
	} catch (Exception e) {
		e.printStackTrace();
	}

	return "weather/weatherSpot.tiles";
	
	}

	private String getWeatherName(Object weatherNum) {
		String result = null;

		int num = ((Long) weatherNum).intValue();

		switch (num) {
		case 1:
			result = "./images/d4b42dfc0884c443b8395dd13d658b1d4022de826f725e10df604bf1b9725cfd.png"; //맑음
			break;
		case 2:
			result = "./images/82229280-kawaii-만화-흰색-이모티콘-귀여운-구름-벡터-일러스트-레이션.webp"; //구름
			break;
		case 3:
			result = "./images/d4b42dfc0884c443b8395dd13d658b1d41d1a2caccd0c566eab28b91e2e5d306.png"; //흐림
			break;
		case 4:
			result = "./images/d4b42dfc0884c443b8395dd13d658b1d8f324a0b9c48f77dbce3a43bd11ce785.png"; //비
			break;
		case 5:
			result = "./images/24c740699333e8d04843a728c21b38aeeffd194bae87d73dd00522794070855d.png"; //소나기
			break;
		case 6:
			result = "./images/NB12.png"; //비눈
			break;
		case 7:
			result = "./images/NB13.png"; //눈비
			break;
		case 8:
			result = "./images/a0cd4c54cd7589e0690b5a674aaff7a241d1a2caccd0c566eab28b91e2e5d306.png"; //눈
			break;

		}

		return result;
	}

}
