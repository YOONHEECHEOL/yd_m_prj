package com.yd05.mprj.delicious.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.delicious.service.DeliciousService;
import com.yd05.mprj.delicious.service.DeliciousServiceImpl;
import com.yd05.mprj.delicious.service.DeliciousVO;

public class DeliciousInsert implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 맛집 개별 화면 -> insert작업
		DeliciousService dao = new DeliciousServiceImpl();
		DeliciousVO vo = new DeliciousVO();
		// String contentTypeIdVal = request.getParameter("contentTypeId");
		vo.setContentid(request.getParameter("contentid"));
		vo.setAddr1(request.getParameter("addr1"));
		vo.setFirstimage(request.getParameter("firstimage"));
		vo.setTel(request.getParameter("tel"));
		vo.setTitle(request.getParameter("title"));
		int n = dao.insertDel(vo);
		if(n != 0) {
			return "deliciousSelect.do";
		} else {
			return "home.do";
			// 실패 다시 확인
		}
		
	}

}
