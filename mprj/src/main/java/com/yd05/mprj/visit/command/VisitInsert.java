package com.yd05.mprj.visit.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.visit.service.VisitService;
import com.yd05.mprj.visit.service.VisitServiceImpl;
import com.yd05.mprj.visit.service.VisitVO;

public class VisitInsert implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		VisitService dao = new VisitServiceImpl();
		VisitVO vo = new VisitVO();

		HttpSession session = request.getSession();

		vo.setUId((String) session.getAttribute("id"));
		vo.setContentTypeId(request.getParameter("contentTypeId"));
		vo.setContentId(request.getParameter("contentId"));
		vo.setFirstImage(request.getParameter("firstImage"));
		vo.setTitle(request.getParameter("title"));
		vo.setAddr1(request.getParameter("addr1"));

		// contentId 중복확인 필요
		String str1 = request.getParameter("contentId");
		String str2 = (String) request.getSession().getAttribute("id");
		boolean b = dao.isCIdCheck(str1, str2); // true
		// System.out.println(b);

		if (b) {
			// insert 가능(true)
			int n = dao.insertVisit(vo);
			if (n != 0) {
				// 성공
				return "visitList.do";
			} else {
				// 실패
				request.setAttribute("inFail", "잠시 후 다시 시도해 주세요.");
				return "visit/visitMessage.tiles";
			}
		} else {
			// insert 불가능(false)
			request.setAttribute("inSuccess", "이미 VISIT 목록에 있습니다." + "VISIT 목록을 확인하시겠습니까?"); // 줄바꿈확인
			return "visit/visitMessage.tiles";
		}

	}

}
