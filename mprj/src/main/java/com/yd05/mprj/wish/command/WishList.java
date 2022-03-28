package com.yd05.mprj.wish.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.wish.service.WishService;
import com.yd05.mprj.wish.service.WishServiceImpl;
import com.yd05.mprj.wish.service.WishVO;

public class WishList implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		WishService dao = new WishServiceImpl();
		WishVO vo = new WishVO();
		HttpSession session = request.getSession();
		
		vo.setUId((String)session.getAttribute("id"));
		request.setAttribute("wishList", dao.selectWishList());
		
		return "wish/wishList.tiles";
	}

}
