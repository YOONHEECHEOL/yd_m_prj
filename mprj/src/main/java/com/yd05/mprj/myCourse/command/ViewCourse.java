package com.yd05.mprj.myCourse.command;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.yd05.mprj.comm.Command;
import com.yd05.mprj.mcComment.service.McCommentService;
import com.yd05.mprj.mcComment.service.McCommentServiceImpl;
import com.yd05.mprj.mcComment.service.McCommentVO;

public class ViewCourse implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		Gson gson = new Gson();
		
		String contentIdList = request.getParameter("tsId");
		
		// split
		String[] contentList = contentIdList.split(" ");

		// 앞번호 cid 제거
		List<String> clist = new ArrayList<String>(); 
		for(String str: contentList) {
			clist.add(str.substring(3));
		}		
				
		// Val 담음
		request.setAttribute("mcTitle", request.getParameter("mcTitle"));
		request.setAttribute("mcId", request.getParameter("mcId"));
		request.setAttribute("uId", request.getParameter("uId"));
		request.setAttribute("mcDate", request.getParameter("mcDate"));
		request.setAttribute("mcDesc", request.getParameter("mcDescription"));
		request.setAttribute("contentList", gson.toJson(clist));
		request.setAttribute("loginId", (String) request.getSession().getAttribute("id"));
		
		McCommentService mdao = new McCommentServiceImpl();
		McCommentVO vo = new McCommentVO();
		vo.setMcId(request.getParameter("mcId"));
		List<McCommentVO> commList = mdao.selectComments(vo);
		request.setAttribute("commList", commList);
		
		return "myCourse/courseView.tiles";
	}

}
