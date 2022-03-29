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
		vo.setFirstImage(request.getParameter("firstImage"));
		vo.setTitle(request.getParameter("title"));
		vo.setAddr1(request.getParameter("addr1"));
		
		// contentId 중복확인 필요
		String str = request.getParameter("contentId");
		boolean b = dao.isCIdCheck(str); //true
		System.out.println(b);
		if (b) {
			// insert 가능(true)
			int n = dao.insertWish(vo);
			if(n !=0 ) {
				// 성공
				request.setAttribute("message", "WISH 목록을 확인하시겠습니까?");
				return "wish/success.tiles";
			} else {
				// 실패
				request.setAttribute("message", "잠시 후 다시 시도해 주세요.");
				return "wish/message.tiles";
			}
		} else {
			// insert 불가능(false)
			request.setAttribute("message", "이미 WISH 목록에 있습니다." + "WISH 목록을 확인하시겠습니까?"); // 줄바꿈확인
			return "wish/success.tiles";
		}
		
	}

}
