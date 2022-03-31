package com.yd05.mprj.spot.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.wish.service.WishService;
import com.yd05.mprj.wish.service.WishServiceImpl;
import com.yd05.mprj.wish.service.WishVO;

public class NextRecSpot implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
				
		
		/*
		 * // 위시리스트 값으로 이동 WishService dao = new WishServiceImpl(); WishVO vo = new
		 * WishVO();
		 * 
		 * vo.setUId((String)session.getAttribute("id"));
		 * request.setAttribute("wishList", dao.selectWishList(vo));
		 * 
		 * HttpSession session = request.getSession(); request.setAttribute("uid",
		 * (String)session.getId("id"));
		 */
		
		
		request.setAttribute("areaCode", request.getParameter("areaCode"));
		/*
		 * request.setAttribute("contentTypeId", request.getParameter("contentTypeId"));
		 * request.setAttribute("contentId", request.getParameter("contentId"));
		 * request.setAttribute("firstImage2", request.getParameter("firstImage2"));
		 * request.setAttribute("title", request.getParameter("title"));
		 * request.setAttribute("addr1", request.getParameter("addr1"));
		 */
		
		
		
		
		
		return "spot/nextRecSpot.tiles";
	}

}
