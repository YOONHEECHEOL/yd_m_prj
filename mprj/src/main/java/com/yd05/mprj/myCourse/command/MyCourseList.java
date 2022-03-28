package com.yd05.mprj.myCourse.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.myCourse.service.MyCourseService;
import com.yd05.mprj.myCourse.service.MyCourseServiceImpl;
import com.yd05.mprj.myCourse.service.MyCourseVO;

public class MyCourseList implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
				
		if(request.getSession().getAttribute("id") != null) {
			MyCourseVO vo = new MyCourseVO();
			String userId = (String) request.getSession().getAttribute("id");
			vo.setuId(userId);
			
			MyCourseService listDao = new MyCourseServiceImpl();		
			request.setAttribute("courseList", listDao.selectAllCourse(vo));
			return "myCourse/myCourseList.tiles";
		} else {
			request.setAttribute("message", "로그인을 먼저 해주세요!");
			return "user/login.tiles";
		}
	}

}
