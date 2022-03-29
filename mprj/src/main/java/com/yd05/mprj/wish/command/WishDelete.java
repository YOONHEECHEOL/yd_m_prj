package com.yd05.mprj.wish.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.wish.service.WishService;
import com.yd05.mprj.wish.service.WishServiceImpl;
import com.yd05.mprj.wish.service.WishVO;

public class WishDelete implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		WishService dao = new WishServiceImpl();
		WishVO vo = new WishVO();
		
		vo.setContentId((String)request.getParameter("contentId"));
		//System.out.println(request.getParameter("contentId"));
		
		int n = dao.deleteWish(vo);
		
		if(n != 0) {
			request.setAttribute("message", "삭제가 완료되었습니다.");
			return "wish/deleteMessage.tiles";
		} else {
			request.setAttribute("message", "잠시 후 다시 시도해 주세요.");
			return "wish/deleteMessage.tiles";
		}
	}

}
