package com.yd05.mprj.myCourse.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.myCourse.service.MyCourseService;
import com.yd05.mprj.myCourse.service.MyCourseServiceImpl;
import com.yd05.mprj.myCourse.service.MyCourseVO;

public class DeleteCourse implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		MyCourseService dao = new MyCourseServiceImpl();
		
		
		
		MyCourseVO vo = new MyCourseVO();
		vo.setMcId(Long.parseLong(request.getParameter("mcId")));
		dao.deleteCourse(vo);
		
		return "myCourseList.do";
	}

}
