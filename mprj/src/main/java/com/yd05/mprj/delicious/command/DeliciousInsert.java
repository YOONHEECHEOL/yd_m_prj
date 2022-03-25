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
		DeliciousService dao = new DeliciousServiceImpl();
		DeliciousVO vo = new DeliciousVO();

		// String contentTypeIdVal = request.getParameter("contentTypeId");
		vo.setContentid(request.getParameter("contentid"));
		vo.setAddr1(request.getParameter("addr1"));
		vo.setFirstimage(request.getParameter("firstimage"));
		vo.setTel(request.getParameter("tel"));
		vo.setTitle(request.getParameter("title"));

		String str = request.getParameter("contentid");
		// String result;
		// vo = dao.selectDeli(vo);
		// if (vo.getContentid() != null) {
		// contentid 가 있는지 db 조회
		boolean b = dao.isConidCheck(str); // b = true;
		if (!b) {
			// result = "ajax:0"; // false > 존재하는 contentid
			return "deliciousSelect.do";
		} else {
			// result = "ajax:1"; // true -> insert작업 가능
			// insert 작업
			int n = dao.insertDeli(vo);
			if (n != 0) {
				return "deliciousSelect.do";
			}
		}
		// }
		return "home.do";
	}
}
