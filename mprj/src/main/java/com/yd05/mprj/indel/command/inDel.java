package com.yd05.mprj.indel.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.visit.service.VisitService;
import com.yd05.mprj.visit.service.VisitServiceImpl;
import com.yd05.mprj.visit.service.VisitVO;
import com.yd05.mprj.wish.service.WishService;
import com.yd05.mprj.wish.service.WishServiceImpl;
import com.yd05.mprj.wish.service.WishVO;

public class inDel implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		VisitService vDao = new VisitServiceImpl();
		VisitVO vVo = new VisitVO();
		
		vVo.setUId((String) session.getAttribute("id"));
		vVo.setContentTypeId(request.getParameter("contentTypeId"));
		vVo.setContentId(request.getParameter("contentId"));
		vVo.setFirstImage(request.getParameter("firstImage"));
		vVo.setTitle(request.getParameter("title"));
		vVo.setAddr1(request.getParameter("addr1"));
		vVo.setMapx(request.getParameter("mapx"));
		vVo.setMapy(request.getParameter("mapy"));

		WishService wDao = new WishServiceImpl();
		WishVO wVo = new WishVO();
		wVo.setContentId(request.getParameter("contentId"));


		// visitList에 있는지 없는지 체크 -> contentId 중복확인 필요
		String str1 = request.getParameter("contentId");
		String str2 = (String) request.getSession().getAttribute("id");
		boolean b = vDao.isCIdCheck(str1, str2); // true

		if (b) {
			// insert 가능(true)
			// wishList 삭제
			int n = wDao.deleteWish(wVo);
			if (n != 0) {
				// delete 성공
				// insert 작업
				int x = vDao.insertVisit(vVo);
				if (x != 0) {
					// insert 성공
					return "visitList.do";
				} else {
					// insert 서버 실패
					request.setAttribute("indelFail", "잠시 후 다시 시도해 주세요.");
					return "inDel/inDelMessage.tiles";
				}
			} else {
				// delete 실패
				request.setAttribute("indelFail", "잠시 후 다시 시도해 주세요.");
				return "inDel/inDelMessage.tiles";
			}
		} else {
			// insert 불가능(false)
			// wishList 삭제
			int y = wDao.deleteWish(wVo);
			if (y != 0) {
				// delete 성공
				request.setAttribute("indelSuccess", "이미 VISIT 목록에 있습니다." + "VISIT 목록을 확인하시겠습니까?");
				return "inDel/inDelMessage.tiles";
			} else {
				// delete 실패
				request.setAttribute("indelFail", "잠시 후 다시 시도해 주세요.");
				return "inDel/inDelMessage.tiles";
			}
		}
	}
}
