package com.yd05.mprj.myCourse.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.myCourse.service.MyCourseService;
import com.yd05.mprj.myCourse.service.MyCourseServiceImpl;
import com.yd05.mprj.myCourse.service.MyCourseVO;

public class CourseList implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 
		
		MyCourseService dao = new MyCourseServiceImpl();
		List<MyCourseVO> list = new ArrayList<MyCourseVO>();
		
		list = dao.allCourse();
		request.setAttribute("clist", list);
		
		return "myCourse/courseList.tiles";
	}

}
