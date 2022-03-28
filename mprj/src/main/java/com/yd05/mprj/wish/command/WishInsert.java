package com.yd05.mprj.wish.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.wish.service.WishService;
import com.yd05.mprj.wish.service.WishServiceImpl;
import com.yd05.mprj.wish.service.WishVO;

public class WishInsert implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		WishService dao = new WishServiceImpl();
		WishVO vo = new WishVO();
		HttpSession session = request.getSession();
		
		vo.setUId((String)session.getAttribute("id"));
		vo.setContentTypeId(request.getParameter("contentTypeId"));
		vo.setContentId(request.getParameter("contentId"));
		vo.setCat1(request.getParameter("cat1"));
		vo.setCat2(request.getParameter("cat2"));
		vo.setCat3(request.getParameter("cat3"));
		vo.setAreaCode(request.getParameter("areaCode"));
		vo.setSigunguCode(request.getParameter("sigunguCode"));
		
		int n = dao.insertWish(vo);
		
		if(n !=0 ) {
			// 성공
			request.setAttribute("message", "확인하시겠습니까?");
			return "wish/wishSuccess.tiles";
		} else {
			// 실패
			request.setAttribute("message", "다시 시도해 주세요.");
			return "wish/wishFail.tiles";
		}
	}

}
