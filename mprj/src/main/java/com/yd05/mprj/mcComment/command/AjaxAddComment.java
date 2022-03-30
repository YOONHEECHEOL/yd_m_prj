package com.yd05.mprj.mcComment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yd05.mprj.comm.Command;
import com.yd05.mprj.mcComment.service.McCommentService;
import com.yd05.mprj.mcComment.service.McCommentServiceImpl;
import com.yd05.mprj.mcComment.service.McCommentVO;

public class AjaxAddComment implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		McCommentService dao = new McCommentServiceImpl();
		
		McCommentVO vo = new McCommentVO();
		vo.setuId((String) request.getSession().getAttribute("id"));
		vo.setMcId(request.getParameter("mcId"));
		vo.setCommComment(request.getParameter("cVal"));
		
		dao.insertComments(vo);
		
		return "ajax:addComment!";
	}

}
