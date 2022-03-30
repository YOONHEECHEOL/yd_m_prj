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
		String str1 = request.getParameter("contentId");
		String str2 = (String) request.getSession().getAttribute("id");
		boolean b = dao.isCIdCheck(str1, str2); //true
		//System.out.println(b);
		
		if (b) {
			// insert 가능(true)
			int n = dao.insertWish(vo);
			if(n !=0 ) {
				// 성공
				return "wishList.do";
			} else {
				// 서버 실패
				request.setAttribute("inFail", "잠시 후 다시 시도해 주세요.");
				return "wish/wishMessage.tiles";
			}
		} else {
			// insert 불가능(false)
			request.setAttribute("inSuccess", "이미 WISH 목록에 있습니다." + "WISH 목록을 확인하시겠습니까?"); // 줄바꿈확인
			return "wish/wishMessage.tiles";
		}
		
	}

}
