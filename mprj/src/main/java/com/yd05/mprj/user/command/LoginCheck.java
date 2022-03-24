package com.yd05.mprj.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yd05.mprj.comm.Command;
import com.yd05.mprj.user.service.UserService;
import com.yd05.mprj.user.service.UserServiceImpl;
import com.yd05.mprj.user.service.UserVO;

public class LoginCheck implements Command {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) {
		// 로그인
		HttpSession session = request.getSession();
		UserService dao = new UserServiceImpl();
		
		UserVO vo = new UserVO();
		vo.setuId(request.getParameter("uId"));
		vo.setuPwd(request.getParameter("uPwd"));
		
		vo = dao.userSelect(vo);
		
		String viewPage;
		if(vo != null) {			
			session.setAttribute("id", vo.getuId());
			session.setAttribute("author", vo.getuAuthor());
			viewPage = "main/main.tiles";			
		} else {
			request.setAttribute("message", "아이디 없음");
			viewPage = "user/login.tiles";
		}
		
		return viewPage;		
	}

}
