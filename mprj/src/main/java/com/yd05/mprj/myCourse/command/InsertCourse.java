package com.yd05.mprj.myCourse.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.myCourse.service.MyCourseService;
import com.yd05.mprj.myCourse.service.MyCourseServiceImpl;
import com.yd05.mprj.myCourse.service.MyCourseVO;

public class InsertCourse implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// myCourse 추가
		MyCourseService dao = new MyCourseServiceImpl();
		
		System.out.println(request.getParameter("uId"));
		System.out.println(request.getParameter("contentIdList"));
		System.out.println(request.getParameter("mcTitle"));
		System.out.println(request.getParameter("mcDescription"));
		
		MyCourseVO vo = new MyCourseVO();
		vo.setuId(request.getParameter("uId"));
		vo.setTsId(request.getParameter("contentIdList"));
		vo.setMcTitle(request.getParameter("mcTitle"));
		vo.setMcDescription(request.getParameter("mcDescription"));
		vo.setSumImg(request.getParameter("sumImg"));
		
		dao.insertCourse(vo);	
		
		return "myCourseList.do";
	}

}
