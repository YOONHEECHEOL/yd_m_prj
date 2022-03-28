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
		
		// contentId 중복확인 필요
		String str = request.getParameter("contentId");
		boolean b = dao.isCIdCheck(str);
		System.out.println(b);
		if (!b) {
			// insert 가능(false)
			int n = dao.insertWish(vo);
			if(n !=0 ) {
				// 성공
				request.setAttribute("message", "WISH 목록을 확인하시겠습니까?");
				return "wish/success.tiles";
			} else {
				// 실패
				request.setAttribute("message", "다시 시도해 주세요.");
				return "wish/fail.tiles";
			}
		} else {
			// insert 불가 (true)
			// ?
			return null;
		}
		
	}

}
