package com.yd05.mprj.type.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.yd05.mprj.comm.Command;
import com.yd05.mprj.type.service.TypeService;
import com.yd05.mprj.type.service.TypeServiceImpl;
import com.yd05.mprj.type.service.TypeVO;

public class AjaxContentTypeList implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// Type 값을 리스트로 반환
		List<TypeVO> list = null;
		Gson gson = new Gson();
		
		// request 값으로 contentTypeId, cat1, cat2, cat3 어떤 값을 돌려줄지 정함
		
		// contentTypeId
		if(request.getParameter("req").equals("contentTypeId")) {
			TypeService dao = new TypeServiceImpl();
			list = dao.selectContentTypeId();
		}
		
		// cat1
		if(request.getParameter("req").equals("cat1")) {
			TypeService dao = new TypeServiceImpl();
			TypeVO vo = new TypeVO();
			vo.setContentTypeId(request.getParameter("contentTypeId"));
			list = dao.selectCat1(vo);		
		}
		
		// cat2
		if(request.getParameter("req").equals("cat2")) {
			TypeService dao = new TypeServiceImpl();
			TypeVO vo = new TypeVO();
			vo.setContentTypeId(request.getParameter("contentTypeId"));
			vo.setCat1(request.getParameter("cat1"));
			list = dao.selectCat2(vo);			
		}
		
		// cat3
		if(request.getParameter("req").equals("cat3")) {
			TypeService dao = new TypeServiceImpl();
			TypeVO vo = new TypeVO();
			vo.setContentTypeId(request.getParameter("contentTypeId"));
			vo.setCat1(request.getParameter("cat1"));
			vo.setCat2(request.getParameter("cat2"));
			list = dao.selectCat3(vo);
		}
		
		String resultList = gson.toJson(list);
		
		return "ajax:" + resultList;
	}

}
